package com.virtualcondo.persistencia;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
}
