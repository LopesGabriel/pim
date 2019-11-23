package com.virtualcondo.controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.virtualcondo.models.Usuario;
import com.virtualcondo.models.Visitante;
import com.virtualcondo.persistencia.VisitaDAO;


@WebServlet("/visita")
@MultipartConfig
public class Visita extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Visita() {
        super();
    }

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		Usuario u = (Usuario) req.getSession().getAttribute("Usuario");
		String acao = req.getParameter("acao");
		if(acao == null) acao = "index";

		// Variáveis

		RequestDispatcher view = null;

		// Fim Variáveis

		if(u != null) {			
			switch(acao) {
			case "index":
				List<Visitante> visitantes = new VisitaDAO().recuperarVisitantes();
				req.setAttribute("visitantes", visitantes);
				view = req.getRequestDispatcher("WEB-INF/jsp/admin/cadastro-visita.jsp");
				view.forward(req, res);
				break;
			}
		}
		else {
			res.sendRedirect("/virtualcondo/index");
		}

	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doGet(req, res);
	}

	protected void doPut(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	protected void doDelete(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
