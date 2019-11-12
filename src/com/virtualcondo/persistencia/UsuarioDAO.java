package com.virtualcondo.persistencia;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.virtualcondo.connection.ConnectionFactory;
import com.virtualcondo.models.TipoUsu;
import com.virtualcondo.models.Usuario;
import com.virtualcondo.models.Veiculo;

public class UsuarioDAO {

	private Connection connection = new ConnectionFactory().getConnection();

	public Usuario autenticarUsuario(String senha, String email) {

		Usuario u = null;
		String sql = "Select "
						+ "a.id_usuario, a.nome, a.senha, a.email, a.cpf, a.rg, a.tipo_usuario_id, a.veiculo_id_veiculo as veiculo, "
						+ "b.marca, b.placa, b.vaga, "
						+ "c.nivel_acesso, c.nom_cargo "
					+ "From virtual_condo.usuario As a "
					+ "Left Join virtual_condo.veiculo As b On a.veiculo_id_veiculo = b.id_veiculo "
					+ "Left Join virtual_condo.tipo_usuario As c On a.tipo_usuario_id = c.id_tipo_usu "
					+ "Where a.senha = SHA2(?, 224) And a.email = ?";

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

				Veiculo v = new Veiculo(rs.getInt("veiculo"), rs.getString("marca"), rs.getString("placa"), rs.getString("vaga"));

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
