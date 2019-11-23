package com.virtualcondo.persistencia;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.virtualcondo.connection.ConnectionFactory;
import com.virtualcondo.models.Usuario;
import com.virtualcondo.models.Visita;
import com.virtualcondo.models.Visitante;

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
				connection.close();
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
				connection.close();
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

	public List<Visita> listarVisitas(){

		List<Visita> lista = new ArrayList<Visita>();
		String sql = "Select\r\n" + 
			"	a.id_visita, a.visitante_id, a.usuario_id As responsavel_id, a.data_entrada, a.data_saida,\r\n" + 
			"    b.nome, b.cpf, b.rg, b.telefone,\r\n" + 
			"    c.nome As responsavel\r\n" + 
			"From \r\n" + 
			"	virtual_condo.visitante_has_usuario As a\r\n" + 
			"Left Join\r\n" + 
			"	virtual_condo.visitante As b On a.visitante_id = b.id_visitante\r\n" + 
			"Left Join \r\n" + 
			"	virtual_condo.usuario As c On a.usuario_id = c.id_usuario\r\n" + 
			"Order By data_entrada Asc";

		try {

			PreparedStatement st = connection.prepareStatement(sql);
			ResultSet rs = st.executeQuery();

			while(rs.next()) {

				Visitante visitante = new Visitante(rs.getInt("visitante_id"), rs.getString("nome"), rs.getString("cpf"), rs.getString("rg"), rs.getString("telefone"));
				Usuario u = new Usuario(rs.getInt("responsavel_id"));
				u.setNome(rs.getString("responsavel"));

				Visita v = new Visita(rs.getInt("id_visita"), visitante, u, rs.getTimestamp("data_entrada"), rs.getTimestamp("data_saida"));

				lista.add(v);
			}

		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(!connectionReciclada) connection.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}

		return lista;

	}
	
	public List<Visita> listarVisitasMorador(Integer user){

		List<Visita> lista = new ArrayList<Visita>();
		String sql = "SELECT\n" + 
				"	a.id_visita, a.visitante_id, a.usuario_id AS responsavel, a.data_entrada, a.data_saida,\n" + 
				"    b.nome, b.cpf, b.rg, b.telefone,\n" + 
				"    c.id_usuario\n" + 
				"FROM\n" + 
				"	virtual_condo.visitante_has_usuario AS a\n" + 
				"LEFT JOIN\n" + 
				"	virtual_condo.usuario as c ON a.usuario_id = c.id_usuario \n" + 
				"LEFT JOIN\n" + 
				"	virtual_condo.visitante AS b ON a.visitante_id = b.id_visitante\n" + 
				"WHERE\n" + 
				"	a.usuario_id = ?";

		try {

			PreparedStatement st = connection.prepareStatement(sql);
			st.setInt(1, user);
			ResultSet rs = st.executeQuery();

			while(rs.next()) {

				Visitante visitante = new Visitante(rs.getInt("visitante_id"), rs.getString("nome"), rs.getString("cpf"), rs.getString("rg"), rs.getString("telefone"));
				Usuario u = new Usuario(rs.getInt("responsavel"));

				Visita v = new Visita(rs.getInt("id_visita"), visitante, u, rs.getTimestamp("data_entrada"), rs.getTimestamp("data_saida"));

				lista.add(v);
			}

		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(!connectionReciclada) connection.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}

		return lista;

	}

	public List<Visitante> recuperarVisitantes(){
		List<Visitante> lista = new ArrayList<Visitante>();
		String sql = "Select\r\n" + 
			"	id_visitante, nome\r\n" + 
			"From virtual_condo.visitante";

		try {
			PreparedStatement st = connection.prepareStatement(sql);
			ResultSet rs = st.executeQuery();

			while(rs.next()) {
				Visitante v = new Visitante(rs.getInt("id_visitante"));
				v.setNome(rs.getString("nome"));
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
