package com.virtualcondo.models;

import java.util.Date;

public class Visita {

	private Integer id;
	private Visitante visitante;
	private Usuario responsavel;
	private Date dtEntrada;
	private Date dtSaida;

	public Visita() {}

	public Visita(Integer id, Visitante visitante, Usuario responsavel, Date dtEntrada, Date dtSaida) {
		super();
		this.id = id;
		this.visitante = visitante;
		this.responsavel = responsavel;
		this.dtEntrada = dtEntrada;
		this.dtSaida = dtSaida;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Visitante getVisitante() {
		return visitante;
	}

	public void setVisitante(Visitante visitante) {
		this.visitante = visitante;
	}

	public Usuario getResponsavel() {
		return responsavel;
	}

	public void setResponsavel(Usuario responsavel) {
		this.responsavel = responsavel;
	}

	public Date getDtEntrada() {
		return dtEntrada;
	}

	public void setDtEntrada(Date dtEntrada) {
		this.dtEntrada = dtEntrada;
	}

	public Date getDtSaida() {
		return dtSaida;
	}

	public void setDtSaida(Date dtSaida) {
		this.dtSaida = dtSaida;
	}

}
