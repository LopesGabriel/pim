package com.virtualcondo.models;

public class AreaDeLazer {

	private Integer id;
	private String nome;
	private String img;

	public AreaDeLazer() {}

	public AreaDeLazer(Integer id, String nome, String img) {
		super();
		this.id = id;
		this.nome = nome;
		this.img = img;
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

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

}
