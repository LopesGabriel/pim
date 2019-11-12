package com.virtualcondo.models;

public class Mensagem {

	private Integer id;
	private String assunto;
	private String mensagem;
	private boolean sit;

	private Usuario destinatario;
	private Usuario remetente;

	public Mensagem() {}

	public Mensagem(Integer id, String assunto, String mensagem, Usuario destinatario, Usuario remetente, boolean sit) {
		super();
		this.id = id;
		this.assunto = assunto;
		this.mensagem = mensagem;
		this.destinatario = destinatario;
		this.remetente = remetente;
		this.sit = sit;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getAssunto() {
		return assunto;
	}

	public void setAssunto(String assunto) {
		this.assunto = assunto;
	}

	public String getMensagem() {
		return mensagem;
	}

	public void setMensagem(String mensagem) {
		this.mensagem = mensagem;
	}

	public Usuario getDestinatario() {
		return destinatario;
	}

	public void setDestinatario(Usuario destinatario) {
		this.destinatario = destinatario;
	}

	public Usuario getRemetente() {
		return remetente;
	}

	public void setRemetente(Usuario remetente) {
		this.remetente = remetente;
	}

	public boolean isSit() {
		return sit;
	}

	public void setSit(boolean sit) {
		this.sit = sit;
	}

}