package com.virtualcondo.persistencia;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.virtualcondo.connection.ConnectionFactory;
import com.virtualcondo.models.IndexAdministrador;

public class DAOAdministrador {

	private Connection connection = new ConnectionFactory().getConnection();

	public IndexAdministrador popularIndexAdmin() {

		IndexAdministrador iA = null;
		String sql = "Select\r\n" + 
			"	(Select count(virtual_condo.usuario.id_usuario) From virtual_condo.usuario Where tipo_usuario_id = 1 OR tipo_usuario_id = 2) As moradores,\r\n" + 
			"	(Select count(virtual_condo.usuario.id_usuario) From virtual_condo.usuario Where tipo_usuario_id = 3) As colaboradores,\r\n" + 
			"	(Select count(virtual_condo.veiculo.id_veiculo) From virtual_condo.veiculo) As veiculos,\r\n" + 
			"   (Select count(virtual_condo.visitante.id_visitante) From virtual_condo.visitante) As visitantes";

		try {

			PreparedStatement st = connection.prepareStatement(sql);
			ResultSet rs = st.executeQuery();

			if(rs.next()) {

				iA = new IndexAdministrador(rs.getInt("moradores"), rs.getInt("colaboradores"), rs.getInt("visitantes"), rs.getInt("veiculos"), new VisitaDAO(connection).listarVisitas());

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

		return iA;
	}

}
