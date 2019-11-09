package com.virtualcondo.connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionFactory {

	private String banco = "";
	private String user = "";
	private String pass = "";
	private Connection connection;

	public ConnectionFactory(){
		this.user = "AutenticadorHM";
		this.pass = "HarDMoD";
		this.banco = "jdbc:mysql://localhost:3306/minehardmod?useTimezone=true&serverTimezone=UTC";
/*		this.user = "gabriel";
		this.pass = "Biellindo3-";
		this.banco = "jdbc:mysql://149.56.170.143:3306/minehardmod?useTimezone=true&serverTimezone=UTC";*/
		conectar();
	}

	public ConnectionFactory(String user, String pass, String banco) {
		this.user = user;
		this.pass = pass;
		this.banco = "jdbc:mysql://localhost:3306/" + banco;
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