package com.virtualcondo.models;

import java.util.List;

public class IndexAdministrador {

	private Integer moradoresCadastrados;
	private Integer colaboradoresCadastrados;
	private Integer visitantesCadastrados;
	private Integer veiculosCadastrados;

	private List<Visita> visitas;

	public IndexAdministrador(Integer moradoresCadastrados, Integer colaboradoresCadastrados,
			Integer visitantesCadastrados, Integer veiculosCadastrados, List<Visita> visitas) {
		super();
		this.moradoresCadastrados = moradoresCadastrados;
		this.colaboradoresCadastrados = colaboradoresCadastrados;
		this.visitantesCadastrados = visitantesCadastrados;
		this.veiculosCadastrados = veiculosCadastrados;
		this.visitas = visitas;
	}

	public Integer getMoradoresCadastrados() {
		return moradoresCadastrados;
	}

	public void setMoradoresCadastrados(Integer moradoresCadastrados) {
		this.moradoresCadastrados = moradoresCadastrados;
	}

	public Integer getColaboradoresCadastrados() {
		return colaboradoresCadastrados;
	}

	public void setColaboradoresCadastrados(Integer colaboradoresCadastrados) {
		this.colaboradoresCadastrados = colaboradoresCadastrados;
	}

	public Integer getVisitantesCadastrados() {
		return visitantesCadastrados;
	}

	public void setVisitantesCadastrados(Integer visitantesCadastrados) {
		this.visitantesCadastrados = visitantesCadastrados;
	}

	public Integer getVeiculosCadastrados() {
		return veiculosCadastrados;
	}

	public void setVeiculosCadastrados(Integer veiculosCadastrados) {
		this.veiculosCadastrados = veiculosCadastrados;
	}

	public List<Visita> getVisitas() {
		return visitas;
	}

	public void setVisitas(List<Visita> visitas) {
		this.visitas = visitas;
	}

}
