package com.virtualcondo.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/desconectar")
public class Desconectar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Desconectar() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.getSession().removeAttribute("Usuario");
		response.sendRedirect("/virtualcondo");

	}

}
