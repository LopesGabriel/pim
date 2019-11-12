package com.virtualcondo.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.virtualcondo.models.Usuario;
import com.virtualcondo.persistencia.UsuarioDAO;

@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Login() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		RequestDispatcher view = request.getRequestDispatcher("WEB-INF/jsp/login.jsp");
		view.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String email = request.getParameter("email");
		String senha = request.getParameter("senha");

		Usuario u = new UsuarioDAO().autenticarUsuario(senha, email);

		if(u != null) {

			HttpSession session = request.getSession();
			session.setAttribute("Usuario", u);

			if(u.getTipoUsu().getId() == 1) {
				RequestDispatcher view = request.getRequestDispatcher("WEB-INF/jsp/morador/index-morador.jsp");
				view.forward(request, response);	
			}
			else if(u.getTipoUsu().getId() == 2) {
				RequestDispatcher view = request.getRequestDispatcher("WEB-INF/jsp/admin/index-admin.jsp");
				view.forward(request, response);	
			}
			else if(u.getTipoUsu().getId() == 3) {
				RequestDispatcher view = request.getRequestDispatcher("WEB-INF/jsp/colaborador/index-colaborador.jsp");
				view.forward(request, response);
			}

		}
		else {

			request.setAttribute("msg", "Email ou senha incorreto.");
			RequestDispatcher view = request.getRequestDispatcher("WEB-INF/jsp/login.jsp");
			view.forward(request, response);

		}

	}

}