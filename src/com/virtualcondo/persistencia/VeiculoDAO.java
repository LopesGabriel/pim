package com.virtualcondo.persistencia;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.virtualcondo.connection.ConnectionFactory;
import com.virtualcondo.models.Usuario;
import com.virtualcondo.models.Vagas;
import com.virtualcondo.models.Veiculo;

public class VeiculoDAO {

	private Connection connection = null;
	private boolean connectionReciclada = false;
	
	public VeiculoDAO() {
		connection = new ConnectionFactory().getConnection();
	}
	
	public VeiculoDAO(Connection connection) {
		this.connection = connection;
		this.connectionReciclada = true;
	}
	
	public void editarVeiculo(Veiculo veiculo) {
		String sql = "UPDATE virtual_condo.veiculo SET marca = ?, placa = ?, vaga = ? WHERE id_veiculo = ?";
		try {
			PreparedStatement st = connection.prepareStatement(sql);
			st.setString(1, veiculo.getMarca());
			st.setString(2, veiculo.getPlaca());
			st.setInt(3, veiculo.getVaga().getId());
			st.setInt(4, veiculo.getId());
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
	
	public Veiculo buscarVeiculo(Integer id) {
		Veiculo veiculo = null;
		String sql = "SELECT \r\n" + 
				"	veiculo.id_veiculo, veiculo.marca, veiculo.placa,\r\n" + 
				"    vaga.id_vaga, vaga.vaga, vaga.em_uso\r\n" + 
				"FROM \r\n" + 
				"	virtual_condo.veiculo AS veiculo\r\n" + 
				"LEFT JOIN\r\n" + 
				"	virtual_condo.vagas AS vaga ON veiculo.vaga = vaga.id_vaga\r\n" + 
				"WHERE id_veiculo = ?";
		try {
			PreparedStatement st = connection.prepareStatement(sql);
			st.setInt(1, id);
			ResultSet rs = st.executeQuery();
			if(rs.next()) {
				
				Vagas vaga = new Vagas();
				vaga.setId(rs.getInt("id_vaga"));
				vaga.setVaga(rs.getString("vaga"));
				vaga.setEm_uso(rs.getBoolean("em_uso"));
				
				veiculo = new Veiculo();
				veiculo.setId(rs.getInt("id_veiculo"));
				veiculo.setMarca(rs.getString("marca"));
				veiculo.setPlaca(rs.getString("placa"));
				veiculo.setVaga(vaga);
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
		
		return veiculo;
	}
	
	public void salvarVeiculo(Veiculo v, Usuario u) {
		
		Integer id_veiculo = 0;
		String sql = "INSERT INTO virtual_condo.veiculo(marca, placa, vaga) VALUES(?, ?, ?)";
		
		String sql1 = "SELECT id_veiculo FROM virtual_condo.veiculo WHERE placa = ?";
		
		String sql2 = "UPDATE virtual_condo.usuario SET veiculo_id_veiculo = ? WHERE id_usuario = ?";
		
		try {
			PreparedStatement st = connection.prepareStatement(sql);
			st.setString(1, v.getMarca());
			st.setString(2, v.getPlaca());
			st.setInt(3, v.getVaga().getId());
			st.execute();
			
			PreparedStatement st1 = connection.prepareStatement(sql1);
			st1.setString(1, v.getPlaca());
			ResultSet rs = st1.executeQuery();
			
			if(rs.next()) {
				id_veiculo = rs.getInt("id_veiculo");
			}
			
			PreparedStatement st2 = connection.prepareStatement(sql2);
			st2.setInt(1, id_veiculo);
			st2.setInt(2, u.getId());
			st2.execute();
			
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
	
	public void deletarVeiculoMorador(Integer veiculo, Usuario user) {
		String sql = "UPDATE virtual_condo.usuario SET veiculo_id_veiculo = null WHERE id_usuario = ?";
		String sql1 = "DELETE FROM virtual_condo.veiculo WHERE id_veiculo = ?";
		try {
			PreparedStatement st = connection.prepareStatement(sql);
			st.setInt(1, user.getId());
			st.execute();
			
			PreparedStatement st1 = connection.prepareStatement(sql1);
			st1.setInt(1, veiculo);
			st1.execute();
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
	
	public Veiculo listarVeiculoPorId(Integer id){
		
		Veiculo veiculo = null;
		String sql = "SELECT " + 
				"	veiculo.id_veiculo, veiculo.marca, veiculo.placa," + 
				"    vaga.vaga, vaga.em_uso, vaga.id_vaga" + 
				" FROM " + 
				"	virtual_condo.usuario AS u " + 
				" LEFT JOIN " + 
				"	virtual_condo.veiculo AS veiculo ON u.veiculo_id_veiculo = veiculo.id_veiculo " + 
				" LEFT JOIN" + 
				"	virtual_condo.vagas AS vaga ON veiculo.vaga = vaga.id_vaga" + 
				" WHERE u.id_usuario = ?";
		try {
			PreparedStatement st = connection.prepareStatement(sql);
			st.setInt(1, id);
			ResultSet rs = st.executeQuery();
			if(rs.next()) {
				Vagas vaga = new Vagas();
				vaga.setId(rs.getInt("id_vaga"));
				vaga.setVaga(rs.getString("vaga"));
				vaga.setEm_uso(rs.getBoolean("em_uso"));

				veiculo = new Veiculo();
				veiculo.setId(rs.getInt("id_veiculo"));
				veiculo.setMarca(rs.getString("marca"));
				veiculo.setPlaca(rs.getString("placa"));
				veiculo.setVaga(vaga);
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
		return veiculo;
	}
	
	public List<Usuario> listarVeiculosCadastrados(){
		List<Usuario> lista = new ArrayList<Usuario>();
		String sql = "SELECT u.nome, v.id_veiculo, v.marca, v.placa, v.vaga AS vaga_id, va.vaga\r\n" + 
				"FROM virtual_condo.usuario AS u\r\n" + 
				"LEFT JOIN virtual_condo.veiculo AS v ON u.veiculo_id_veiculo = v.id_veiculo\r\n" + 
				"LEFT JOIN virtual_condo.vagas AS va ON v.vaga = va.id_vaga\r\n" + 
				"WHERE u.veiculo_id_veiculo is not null";
		try {
			PreparedStatement st = connection.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				Usuario user = new Usuario();
				Veiculo veiculo = new Veiculo();
				Vagas vaga = new Vagas();

				vaga.setId(rs.getInt("vaga_id"));
				vaga.setVaga(rs.getString("vaga"));

				veiculo.setId(rs.getInt("id_veiculo"));
				veiculo.setMarca(rs.getString("marca"));
				veiculo.setPlaca(rs.getString("placa"));
				veiculo.setVaga(vaga);

				user.setNome(rs.getString("nome"));
				user.setVeiculo(veiculo);
				
				lista.add(user);
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
	
}
