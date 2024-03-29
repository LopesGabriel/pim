package com.virtualcondo.models;

import java.util.ArrayList;
import java.util.List;

public class Visitante {

	private Integer id;
	private String nome;
	private String cpf;
	private String rg;
	private String telefone;

	List<Visita> visitas = new ArrayList<Visita>();

	public Visitante() {}

	public Visitante(Integer id) {
		this.id = id;
	}

	public Visitante(Integer id, String nome, String cpf, String rg, String telefone) {
		super();
		this.id = id;
		this.nome = nome;
		this.cpf = cpf;
		this.rg = rg;
		this.telefone = telefone;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public String getRg() {
		return rg;
	}

	public void setRg(String rg) {
		this.rg = rg;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public List<Visita> getVisitas() {
		return visitas;
	}

	public void setVisitas(List<Visita> visitas) {
		this.visitas = visitas;
	}

}
