package com.virtualcondo.connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionFactory {

	private String banco = "";
	private String user = "";
	private String pass = "";
	private Connection connection;

	public ConnectionFactory(){
		this.user = "virtualcondo";
		this.pass = "pim4sem";
		this.banco = "jdbc:mysql://localhost:3306/";
		conectar();
	}

	private void conectar() {

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(banco, user, pass);
			connection.setAutoCommit(false);
		}catch(Exception e) {
			e.printStackTrace();
			throw new RuntimeException("Erro ao conectar com o banco de dados.");
		}

	}

	public Connection getConnection() {
		return connection;
	}

}