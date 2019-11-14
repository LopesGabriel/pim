package com.virtualcondo.models;

public class Vagas {

	private Integer id;
	private String vaga;
	private Boolean em_uso;

	public Vagas() {}

	public Vagas(Integer id, String vaga, Boolean em_uso) {
		super();
		this.id = id;
		this.vaga = vaga;
		this.em_uso = em_uso;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getVaga() {
		return vaga;
	}

	public void setVaga(String vaga) {
		this.vaga = vaga;
	}

	public Boolean getEm_uso() {
		return em_uso;
	}

	public void setEm_uso(Boolean em_uso) {
		this.em_uso = em_uso;
	}
	
	

}
