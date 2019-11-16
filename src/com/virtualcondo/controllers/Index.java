package com.virtualcondo.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.virtualcondo.models.Usuario;

@WebServlet("/index")
public class Index extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Index() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Usuario user = (Usuario) request.getSession().getAttribute("Usuario");
		
		if(user != null) {
			if( user.getTipoUsu().getNivelAcesso().equals("Morador")) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/jsp/morador/index-morador.jsp");
				dispatcher.forward(request, response);
				return;
			}else if ( user.getTipoUsu().getNivelAcesso().equals("Síndico")) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/jsp/admin/index-admin.jsp");
				dispatcher.forward(request, response);
				return;
			}
		}
		
		RequestDispatcher view = request.getRequestDispatcher("WEB-INF/jsp/index.jsp");
		view.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
