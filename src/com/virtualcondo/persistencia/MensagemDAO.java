package com.virtualcondo.persistencia;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.virtualcondo.connection.ConnectionFactory;
import com.virtualcondo.models.Mensagem;
import com.virtualcondo.models.Usuario;

public class MensagemDAO {
	
	private Connection connection = new ConnectionFactory().getConnection();
	
	public boolean enviarMensagem(Mensagem mensagem) {
		boolean op = false;
		String sql = "INSERT INTO virtual_condo.mensagens(assunto, mensagem, remetente, destinatario) VALUES(?, ?, ?, ?)";
		try {
			PreparedStatement st = connection.prepareStatement(sql);
			st.setString(1, mensagem.getAssunto());
			st.setString(2, mensagem.getMensagem());
			st.setInt(3, mensagem.getRemetente().getId());
			st.setInt(4, mensagem.getDestinatario().getId());
			st.execute();
			op = true;
		} catch (SQLException e) {
			e.printStackTrace();
			op = false;
			try {
				connection.rollback();
			}catch(SQLException e1) {
				e1.printStackTrace();
			}
		} finally {
			try {
				connection.commit();
				connection.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return op;
	}
	
	public List<Mensagem> listarMensagemDoUsuario(Usuario user){
		List<Mensagem> lista = new ArrayList<Mensagem>();
		
		String sql = "SELECT m.id_mensagem, m.assunto, m.remetente, m.bl_sit\r\n" + 
					"	FROM virtual_condo.mensagens AS m\r\n" + 
					"    LEFT JOIN virtual_condo.usuario AS u on m.destinatario = u.id_usuario\r\n" + 
					"    WHERE u.id_usuario = ?";
		
		try {
			PreparedStatement st = connection.prepareStatement(sql);
			st.setInt(1, user.getId());
			ResultSet rs = st.executeQuery();
			
			while(rs.next()) {
				
				Usuario remetente = new UsuarioDAO().buscarPorId(rs.getInt("remetente"));
				
				Mensagem m = new Mensagem();
				m.setAssunto(rs.getString("assunto"));
				m.setId(rs.getInt("id_mensagem"));
				m.setRemetente(remetente);
				m.setSit(rs.getBoolean("bl_sit"));
				lista.add(m);
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
	
	public Mensagem buscarPorId(Integer id) {
		Mensagem m = null;
		String sql = "SELECT * FROM virtual_condo.mensagens WHERE id_mensagem = ?";
		try {
			PreparedStatement st = connection.prepareStatement(sql);
			st.setInt(1, id);
			ResultSet rs = st.executeQuery();

			if(rs.next()) {
				Usuario remetente = new UsuarioDAO().buscarPorId(rs.getInt("remetente"));

				m = new Mensagem();
				
				m.setAssunto(rs.getString("assunto"));
				m.setRemetente(remetente);
				m.setId(rs.getInt("id_mensagem"));
				m.setMensagem(rs.getString("mensagem"));
				m.setSit(rs.getBoolean("bl_sit"));
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
		return m;
	}
	
	public void setVisualizada(Integer id) {
		String sql = "UPDATE virtual_condo.mensagens SET bl_sit = ? WHERE id_mensagem = ?";
		try {
			PreparedStatement st = connection.prepareStatement(sql);
			st.setBoolean(1, true);
			st.setInt(2, id);
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
	
	public boolean deletarMensagemPorId(Integer id) {
		boolean op = false;
		String sql = "DELETE FROM virtual_condo.mensagens WHERE id_mensagem = ?";
		try {
			PreparedStatement st = connection.prepareStatement(sql);
			st.setInt(1, id);
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
	
	public int quantidadeDeMensagens(Usuario user) {
		int qtd = 0;
		String sql = "SELECT 	\r\n" + 
				"	count(m.id_mensagem) as qtd\r\n" + 
				"	FROM virtual_condo.mensagens AS m\r\n" + 
				"    LEFT JOIN virtual_condo.usuario AS u on m.destinatario = u.id_usuario\r\n" + 
				"    WHERE u.id_usuario = ?";
		try {
			PreparedStatement st = connection.prepareStatement(sql);
			st.setInt(1, user.getId());
			ResultSet rs = st.executeQuery();
			
			if(rs.next()) {
				qtd = rs.getInt("qtd");
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
		return qtd;
	}

}
