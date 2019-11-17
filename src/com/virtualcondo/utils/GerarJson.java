package com.virtualcondo.utils;

import org.json.JSONObject;

/**
 * Classe responsável por gerar a resposta Json.
 * @author Gabriel
 *
 */
public class GerarJson {

	/**
	 * Gera um Json de sucesso com uma mensagem.<br>
	 * Atributos do JSON: status e msg
	 * @param mensagem
	 * @return JSON
	 */
	public static String sucesso(String mensagem) {

		JSONObject obj = new JSONObject();
		obj.put("status", true);
		obj.put("msg", mensagem);

		return obj.toString();

	}

	/**
	 * Gera um Json de erro com mensagem e ex.<br>
	 * Atributos do JSON: status, msg e ex
	 * @param mensagem
	 * @param exception Mensagem de erro
	 * @return JSON
	 */
	public static String erro(String mensagem, String exception) {

		JSONObject obj = new JSONObject();
		obj.put("status", false);
		obj.put("msg", mensagem);
		if(exception != null) obj.put("ex", exception);

		return obj.toString();

	}

}
