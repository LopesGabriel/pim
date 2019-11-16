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

@WebServlet("/perfil")
public class Perfil extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Perfil() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Usuario user = (Usuario) request.getSession().getAttribute("Usuario");
		String editar = request.getParameter("editar");
		
		if(editar != null) {
			
			if(editar.equals("true") && user.getTipoUsu().getNivelAcesso().equals("Morador")) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/jsp/morador/editar-perfil.jsp");
				dispatcher.forward(request, response);
			}
			
		} else if(user.getTipoUsu().getNivelAcesso().equals("Morador")) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/jsp/morador/perfil-morador.jsp");
			dispatcher.forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Usuario user = (Usuario) request.getSession().getAttribute("Usuario");
		Integer id = user.getId();
		
		String nome = request.getParameter("nome");
		String cpf = request.getParameter("cpf");
		String rg = request.getParameter("rg");
		String email = request.getParameter("email");
		
		user.setNome(nome);
		user.setCpf(cpf);
		user.setRg(rg);
		user.setEmail(email);
		
		new UsuarioDAO().AlterarUsuario(user);
		
		HttpSession session = request.getSession();
		session.removeAttribute("Usuario");
		session.setAttribute("Usuario", new UsuarioDAO().buscarPorId(id));

		RequestDispatcher view = request.getRequestDispatcher("WEB-INF/jsp/morador/perfil-morador.jsp");
		view.forward(request, response);
		
	}

}
