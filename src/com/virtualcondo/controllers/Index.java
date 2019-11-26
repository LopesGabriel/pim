package com.virtualcondo.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.virtualcondo.models.IndexAdministrador;
import com.virtualcondo.models.Usuario;
import com.virtualcondo.persistencia.DAOAdministrador;
import com.virtualcondo.persistencia.VisitaDAO;

@WebServlet("/index")
public class Index extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Index() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Usuario user = (Usuario) request.getSession().getAttribute("Usuario");
		
		if(user != null) {
			RequestDispatcher dispatcher = null;
			switch(user.getTipoUsu().getId()) {
			case 1:
				request.setAttribute("visitas", new VisitaDAO().listaVisitaMorador(user));
				dispatcher = request.getRequestDispatcher("WEB-INF/jsp/morador/index-morador.jsp");
				dispatcher.forward(request, response);
				break;
			case 2:
				IndexAdministrador iA = new DAOAdministrador().popularIndexAdmin();
				iA.setVisitas(new VisitaDAO().listarVisitas());
				request.setAttribute("adminPage", iA);
				dispatcher = request.getRequestDispatcher("WEB-INF/jsp/admin/index-admin.jsp");
				dispatcher.forward(request, response);
				break;
			case 3:
				break;
			}
			return;
		}
		
		RequestDispatcher view = request.getRequestDispatcher("WEB-INF/jsp/index.jsp");
		view.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
