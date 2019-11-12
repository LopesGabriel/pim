package com.virtualcondo.models;

public class Veiculo {

	private Integer id;
	private String marca;
	private String placa;
	private String vaga;

	public Veiculo() {}

	public Veiculo(Integer id, String marca, String placa, String vaga) {
		super();
		this.id = id;
		this.marca = marca;
		this.placa = placa;
		this.vaga = vaga;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getMarca() {
		return marca;
	}

	public void setMarca(String marca) {
		this.marca = marca;
	}

	public String getPlaca() {
		return placa;
	}

	public void setPlaca(String placa) {
		this.placa = placa;
	}

	public String getVaga() {
		return vaga;
	}

	public void setVaga(String vaga) {
		this.vaga = vaga;
	}

}
