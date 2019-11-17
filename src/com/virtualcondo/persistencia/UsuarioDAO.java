package com.virtualcondo.persistencia;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.virtualcondo.connection.ConnectionFactory;
import com.virtualcondo.models.TipoUsu;
import com.virtualcondo.models.Usuario;
import com.virtualcondo.models.Vagas;
import com.virtualcondo.models.Veiculo;

public class UsuarioDAO {

	private Connection connection = new ConnectionFactory().getConnection();

	public Usuario autenticarUsuario(String senha, String email) {

		Usuario u = null;
		String sql = "SELECT  a.id_usuario, a.nome, a.senha, a.email, a.cpf, a.rg, a.tipo_usuario_id, a.veiculo_id_veiculo AS veiculo, \n" + 
				"		b.marca, b.placa, b.vaga AS veiculo_vaga_id, \n" + 
				"        v.id_vaga, v.vaga AS vaga, v.em_uso,\n" + 
				"		c.nivel_acesso, c.nom_cargo \n" + 
				"FROM 	virtual_condo.usuario AS a \n" + 
				"	LEFT JOIN virtual_condo.veiculo AS b ON a.veiculo_id_veiculo = b.id_veiculo \n" + 
				"    LEFT JOIN virtual_condo.vagas AS v ON b.vaga = v.id_vaga\n" + 
				"	LEFT JOIN virtual_condo.tipo_usuario AS c ON a.tipo_usuario_id = c.id_tipo_usu \n" + 
				"WHERE 	a.senha = SHA2(?, 224) AND a.email = ?;";

		try {

			PreparedStatement st = connection.prepareStatement(sql);
			st.setString(1, senha);
			st.setString(2, email);
			ResultSet rs = st.executeQuery();

			if(rs.next()) {

				TipoUsu tU = new TipoUsu();
				tU.setId(rs.getInt("tipo_usuario_id"));
				tU.setNivelAcesso(rs.getString("nivel_acesso"));
				tU.setCargo(rs.getString("nom_cargo"));
				
				Vagas vaga = new Vagas(rs.getInt("id_vaga"), rs.getString("vaga"), rs.getBoolean("em_uso"));

				Veiculo v = new Veiculo(rs.getInt("veiculo"), rs.getString("marca"), rs.getString("placa"), vaga);

				u = new Usuario(
					rs.getInt("id_usuario"),
					rs.getString("nome"),
					rs.getString("senha"),
					rs.getString("email"),
					rs.getString("cpf"),
					rs.getString("rg"),
					tU,
					v
				);

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

		return u;
	}

	public boolean salvarUsuario(Usuario u) {

		boolean op = false;
		String sql = "Insert Into virtual_condo.usuario(nome, email, cpf, rg, tipo_usuario_id, senha) \r\n" +
			"Values(?, ?, ?, ?, ?, SHA2(?, 224))";

		try {

			PreparedStatement st = connection.prepareStatement(sql);
			st.setString(1, u.getNome());
			st.setString(2, u.getEmail());
			st.setString(3, u.getCpf());
			st.setString(4, u.getRg());
			st.setInt(5, u.getTipoUsu().getId());
			st.setString(6, u.getSenha());
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

	public List<Usuario> listarMoradores(){

		List<Usuario> lista = new ArrayList<Usuario>();
		String sql = "Select\r\n" + 
			"	a.id_usuario, a.nome, a.senha, a.email, a.cpf, a.rg, a.tipo_usuario_id, a.veiculo_id_veiculo,\r\n" + 
			"    b.nivel_acesso, b.nom_cargo\r\n" + 
			"From\r\n" + 
			"	virtual_condo.usuario As a\r\n" + 
			"Left Join \r\n" + 
			"	virtual_condo.tipo_usuario As b On a.tipo_usuario_id = b.id_tipo_usu \r\n" +
			"Where a.tipo_usuario_id != 3";

		try {

		PreparedStatement st = connection.prepareStatement(sql);
		ResultSet rs = st.executeQuery();

		while(rs.next()) {

			Veiculo v = new Veiculo();
			v.setId(rs.getInt("veiculo_id_veiculo"));

			TipoUsu tU = new TipoUsu();
			tU.setId(rs.getInt("tipo_usuario_id"));
			tU.setCargo(rs.getString("nom_cargo"));
			tU.setNivelAcesso(rs.getString("nivel_acesso"));

			Usuario u = new Usuario(
				rs.getInt("id_usuario"),
				rs.getString("nome"),
				rs.getString("senha"),
				rs.getString("email"),
				rs.getString("cpf"),
				rs.getString("rg"),
				tU,
				v
			);

			lista.add(u);

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

	public Usuario buscarPorId(Integer id) {

		Usuario u = null;
		String sql = "Select\r\n" + 
			"	a.id_usuario, a.nome, a.senha, a.email, a.cpf, a.rg, a.tipo_usuario_id, a.veiculo_id_veiculo,\r\n" + 
			"    b.nivel_acesso, b.nom_cargo\r\n" + 
			"From\r\n" + 
			"	virtual_condo.usuario As a\r\n" + 
			"Left Join \r\n" + 
			"	virtual_condo.tipo_usuario As b On a.tipo_usuario_id = b.id_tipo_usu\r\n" + 
			"Where a.id_usuario = " + id;

		try {

			PreparedStatement st = connection.prepareStatement(sql);
			ResultSet rs = st.executeQuery();

			if(rs.next()) {

				TipoUsu tU = new TipoUsu();
				tU.setId(rs.getInt("tipo_usuario_id"));
				tU.setCargo(rs.getString("nom_cargo"));
				tU.setNivelAcesso(rs.getString("nom_cargo"));

				u = new Usuario(
					rs.getInt("id_usuario"),
					rs.getString("nome"),
					rs.getString("senha"),
					rs.getString("email"),
					rs.getString("cpf"),
					rs.getString("rg"),
					tU,
					null
				);

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
		return u;

	}
	
	public void AlterarUsuario(Usuario user) {
		String sql = "UPDATE virtual_condo.usuario SET nome = ?, email = ?, cpf = ?, rg = ? WHERE id_usuario = ?";
		try {
			
			PreparedStatement st = connection.prepareStatement(sql);
			st.setString(1, user.getNome());
			st.setString(2, user.getEmail());
			st.setString(3, user.getCpf());
			st.setString(4, user.getRg());
			st.setInt(5, user.getId());
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

	public boolean EditarMorador(Usuario user) {
		boolean op = false;
		String sql = "UPDATE virtual_condo.usuario SET nome = ?, email = ?, cpf = ?, rg = ?, tipo_usuario_id = ?  WHERE id_usuario = ?";
		try {

			PreparedStatement st = connection.prepareStatement(sql);
			st.setString(1, user.getNome());
			st.setString(2, user.getEmail());
			st.setString(3, user.getCpf());
			st.setString(4, user.getRg());
			st.setInt(5, user.getTipoUsu().getId());
			st.setInt(6, user.getId());
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

	public boolean deletarPorId(Integer id) {

		boolean op = false;
		String sql = "Delete From virtual_condo.usuario Where id_usuario = " + id;

		try {

			PreparedStatement st = connection.prepareStatement(sql);
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

}
