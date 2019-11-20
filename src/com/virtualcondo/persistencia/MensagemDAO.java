package com.virtualcondo.persistencia;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.virtualcondo.connection.ConnectionFactory;
import com.virtualcondo.models.Mensagem;

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

}
