package com.virtualcondo.persistencia;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.virtualcondo.connection.ConnectionFactory;
import com.virtualcondo.models.Vagas;

public class VagasDAO {

	private Connection connection = null;
	private boolean connectionReciclada = false;
	
	public VagasDAO() {
		connection = new ConnectionFactory().getConnection();
	}
	
	public VagasDAO(Connection connection) {
		this.connection = connection;
		this.connectionReciclada = true;
	}
	
	public void setarVagaEmUso(Vagas vaga) {
		
		String sql = "UPDATE virtual_condo.vagas SET em_uso = true WHERE id_vaga = ?";
		
		try {
			
			PreparedStatement st = connection.prepareStatement(sql);
			st.setInt(1, vaga.getId());
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
	
	public void removerVagaEmUso(Integer id) {
		String sql = "UPDATE virtual_condo.vagas SET em_uso = false WHERE id_vaga = ?";
		try {
			PreparedStatement st = connection.prepareStatement(sql);
			st.setInt(1, id);
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
	
	public Vagas buscarVaga(String vaga) {
		
		Vagas v = new Vagas();
		String sql = "SELECT * FROM virtual_condo.vagas WHERE vaga = ?";
		
		try {
			PreparedStatement st = connection.prepareStatement(sql);
			st.setString(1, vaga);
			ResultSet rs = st.executeQuery();
			
			if(rs.next()) {
				v.setId(rs.getInt("id_vaga"));
				v.setVaga(rs.getString("vaga"));
				v.setEm_uso(rs.getBoolean("em_uso"));
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
	
	public List<Vagas> listarVagas(){
		
		List<Vagas> lista = new ArrayList<Vagas>();
		String sql = "SELECT vaga, em_uso FROM virtual_condo.vagas WHERE em_uso = 0";
		System.out.println(sql);
		
		try {
			
			PreparedStatement st = connection.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			
			while(rs.next()) {
				Vagas vaga = new Vagas();
				vaga.setVaga(rs.getString("vaga"));
				vaga.setEm_uso(rs.getBoolean("em_uso"));
				lista.add(vaga);
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
