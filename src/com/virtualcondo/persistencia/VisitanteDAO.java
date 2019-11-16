package com.virtualcondo.persistencia;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.virtualcondo.connection.ConnectionFactory;
import com.virtualcondo.models.Visitante;

public class VisitanteDAO {

	private Connection connection = null;
	private boolean connectionReciclada = false;

	public VisitanteDAO() {
		 connection = new ConnectionFactory().getConnection();
	}

	public VisitanteDAO(Connection connection) {
		this.connection = connection;
		this.connectionReciclada = true;
	}

	public void salvarVisitante(Visitante v) {

		String sql = "Insert into virtual_condo.visitante(nome, cpf, rg, telefone) Values(?, ?, ?, ?)";

		try {

			PreparedStatement st = connection.prepareStatement(sql);
			st.setString(1, v.getNome());
			st.setString(2, v.getCpf());
			st.setString(3, v.getRg());
			st.setString(4, v.getRg());
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
				connection.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}

	}

	public Visitante recuperarVisitante(Integer id) {

		Visitante v = new Visitante(id);
		String sql = "Select nome, cpf, rg, telefone From virtual_condo.visitante Where id_visitante = ?";

		try {

			PreparedStatement st = connection.prepareStatement(sql);
			st.setInt(1, id);
			ResultSet rs = st.executeQuery();

			if(rs.next()) {
				v.setNome(rs.getString("nome"));
				v.setCpf(rs.getString("cpf"));
				v.setRg(rs.getString("rg"));
				v.setTelefone(rs.getString("telefone"));
			}

		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			if(!connectionReciclada) {
				try {
					connection.close();
				}catch(SQLException e) {
					e.printStackTrace();
				}
			}
		}

		return v;

	}

}
