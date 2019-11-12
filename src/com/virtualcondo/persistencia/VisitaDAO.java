package com.virtualcondo.persistencia;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import com.virtualcondo.connection.ConnectionFactory;
import com.virtualcondo.models.Usuario;
import com.virtualcondo.models.Visita;

public class VisitaDAO {

	private Connection connection = null;
	private boolean connectionReciclada = false;

	public VisitaDAO() {
		connection = new ConnectionFactory().getConnection();
	}

	public VisitaDAO(Connection connection) {
		this.connection = connection;
		this.connectionReciclada = true;
	}

	public void incluirVisita(Visita v) {

		String sql = "Insert Into virtual_condo.visitante_has_usuario(visitante_id, usuario_id) Values(?, ?)";

		try {

			PreparedStatement st = connection.prepareStatement(sql);
			st.setInt(1, v.getVisitante().getId());
			st.setInt(2, v.getResponsavel().getId());
			st.execute();

		}catch(SQLException e) {
			e.printStackTrace();
			try {
				connection.rollback();
			}catch(SQLException e1) {
				e1.printStackTrace();
			}
		}finally {
			try {
				connection.commit();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}

	}

	public void registrarSaida(Visita v) {

		String sql = "Update virtual_condo.visitante_has_usuario Set data_saida = ? Where id_visita = ?";

		try {

			PreparedStatement st = connection.prepareStatement(sql);
			st.setTimestamp(1, new Timestamp(v.getDtSaida().getTime()));
			st.setInt(2, v.getId());
			st.execute();

		}catch(SQLException e) {
			e.printStackTrace();
			try {
				connection.rollback();
			}catch(SQLException e1) {
				e1.printStackTrace();
			}
		}finally {
			try {
				connection.commit();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}

	}

	/**
	 * Recupera a visita por id
	 * @param id
	 */
	public Visita recuperarVisita(Integer id) {

		Visita v = new Visita();
		String sql = "Select id_visita, visitante_id, usuario_id, data_entrada, data_saida From virtual_condo.visitante_has_usuario Where id_visita = ?";

		try {

			PreparedStatement st = connection.prepareStatement(sql);
			st.setInt(1, id);
			ResultSet rs = st.executeQuery();

			if(rs.next()) {

				v.setId(id);
				v.setVisitante(new VisitanteDAO(connection).recuperarVisitante(rs.getInt("visitante_id")));
				v.setResponsavel(new Usuario(rs.getInt("usuario_id")));
				v.setDtEntrada(rs.getTimestamp("data_entrada"));
				v.setDtSaida(rs.getTimestamp("data_saida"));

			}

		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			if(!connectionReciclada) {
				try{
					connection.close();
				}catch(SQLException e) {
					e.printStackTrace();
				}
			}
		}

		return v;
	}

}
