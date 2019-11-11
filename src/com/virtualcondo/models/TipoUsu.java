package com.virtualcondo.models;

public class TipoUsu {

	private Integer id;
	private String nivelAcesso;
	private String nom_alias;
	private String cargo;

	public TipoUsu() {}

	// Getters And Setters

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNivelAcesso() {
		return nivelAcesso;
	}

	public void setNivelAcesso(String nivelAcesso) {
		this.nivelAcesso = nivelAcesso;
	}

	public String getNom_alias() {
		return nom_alias;
	}

	public void setNom_alias(String nom_alias) {
		this.nom_alias = nom_alias;
	}

	public String getCargo() {
		return cargo;
	}

	public void setCargo(String cargo) {
		this.cargo = cargo;
	}
}
