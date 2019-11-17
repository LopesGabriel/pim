package com.virtualcondo.persistencia;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.virtualcondo.connection.ConnectionFactory;
import com.virtualcondo.models.AreaDeLazer;

public class AreaDeLazerDAO {

	private Connection connection = null;
	private boolean connectionReciclada = false;
	
	public AreaDeLazerDAO() {
		connection = new ConnectionFactory().getConnection();
	}
	
	public AreaDeLazerDAO(Connection connection) {
		this.connection = connection;
		this.connectionReciclada = true;
	}
	
	public List<AreaDeLazer> listarAreasDeLazer(){
		List<AreaDeLazer> lista = new ArrayList<AreaDeLazer>();
		String sql = "SELECT nom_espaco, link_img FROM virtual_condo.area_de_lazer";
		try {
			PreparedStatement st = connection.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			
			while( rs.next() ) {
				AreaDeLazer area = new AreaDeLazer();
				area.setNome(rs.getString("nom_espaco"));
				area.setImg(rs.getString("link_img"));
				
				lista.add(area);
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
