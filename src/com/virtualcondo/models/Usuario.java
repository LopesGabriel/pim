package com.virtualcondo.models;

import java.util.ArrayList;
import java.util.List;

public class Usuario {

	private Integer id;
	private String nome;
	private String senha;
	private String email;
	private String cpf;
	private String rg;

	private TipoUsu tipoUsu;
	private Veiculo veiculo;

	private List<Mensagem> mensagens = new ArrayList<Mensagem>();

	public Usuario() {}

	public Usuario(Integer id) {
		this.id = id;
	}

	// Getters and Setters

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

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public TipoUsu getTipoUsu() {
		return tipoUsu;
	}

	public void setTipoUsu(TipoUsu tipoUsu) {
		this.tipoUsu = tipoUsu;
	}

	public Veiculo getVeiculo() {
		return veiculo;
	}

	public void setVeiculo(Veiculo veiculo) {
		this.veiculo = veiculo;
	}

	public List<Mensagem> getMensagens() {
		return mensagens;
	}

	public void setMensagens(List<Mensagem> mensagens) {
		this.mensagens = mensagens;
	}

}
