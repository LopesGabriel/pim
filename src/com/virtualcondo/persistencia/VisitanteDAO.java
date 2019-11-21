package com.virtualcondo.persistencia;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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

	public boolean salvarVisitante(Visitante v) {

		boolean op = false;
		String sql = "Insert into virtual_condo.visitante(nome, cpf, rg, telefone) Values(?, ?, ?, ?)";

		try {

			PreparedStatement st = connection.prepareStatement(sql);
			st.setString(1, v.getNome());
			st.setString(2, v.getCpf());
			st.setString(3, v.getRg());
			st.setString(4, v.getRg());
			st.execute();
			op = true;

		}catch(SQLException e) {
			e.printStackTrace();
			op = false;
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
		return op;

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

	public List<Visitante> listarVisitantes(){

		List<Visitante> lista = new ArrayList<Visitante>();
		String sql = "Select\r\n" + 
			"	id_visitante, nome, cpf, rg, telefone\r\n" + 
			"From virtual_condo.visitante;";

		try {

			PreparedStatement st = connection.prepareStatement(sql);
			ResultSet rs = st.executeQuery();

			while(rs.next()) {

				Visitante v = new Visitante(
					rs.getInt("id_visitante"),
					rs.getString("nome"),
					rs.getString("cpf"),
					rs.getString("rg"),
					rs.getString("telefone")
				);
				lista.add(v);

			}

		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				connection.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return lista;
	}

}
