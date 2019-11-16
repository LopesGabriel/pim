package com.virtualcondo.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.virtualcondo.models.Usuario;

@WebServlet("/mensagem")
public class Mensagem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Mensagem() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Usuario user = (Usuario) request.getSession().getAttribute("Usuario");
		
		if(user.getTipoUsu().getNivelAcesso().equals("Morador")) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/jsp/morador/mensagem-lista.jsp");
			dispatcher.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
