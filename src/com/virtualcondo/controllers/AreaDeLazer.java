package com.virtualcondo.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.virtualcondo.models.Usuario;
import com.virtualcondo.persistencia.AreaDeLazerDAO;

@WebServlet("/area-de-lazer")
public class AreaDeLazer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AreaDeLazer() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Usuario user = (Usuario) request.getSession().getAttribute("Usuario");
		
		if(user.getTipoUsu().getNivelAcesso().equals("Morador")) {
			request.setAttribute("AreasDeLazer", new AreaDeLazerDAO().listarAreasDeLazer());
			RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/jsp/morador/area-de-lazer.jsp");
			dispatcher.forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
