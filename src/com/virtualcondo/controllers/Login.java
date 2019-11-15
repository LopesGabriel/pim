package com.virtualcondo.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.virtualcondo.models.IndexAdministrador;
import com.virtualcondo.models.Usuario;
import com.virtualcondo.persistencia.DAOAdministrador;
import com.virtualcondo.persistencia.UsuarioDAO;
import com.virtualcondo.persistencia.VisitaDAO;

@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Login() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		Usuario u = (Usuario) session.getAttribute("Usuario");

		if(u == null) {

			RequestDispatcher view = request.getRequestDispatcher("WEB-INF/jsp/login.jsp");
			view.forward(request, response);

		}
		else {

			if(u.getTipoUsu().getId() == 1) {
				request.setAttribute("visitas", new VisitaDAO().listarVisitasMorador(u.getId()));
				RequestDispatcher view = request.getRequestDispatcher("WEB-INF/jsp/morador/index-morador.jsp");
				view.forward(request, response);
			}
			else if(u.getTipoUsu().getId() == 2) {
				IndexAdministrador iA = new DAOAdministrador().popularIndexAdmin();
				iA.setVisitas(new VisitaDAO().listarVisitas());
				request.setAttribute("adminPage", iA);
				RequestDispatcher view = request.getRequestDispatcher("WEB-INF/jsp/admin/index-admin.jsp");
				view.forward(request, response);	
			}
			else if(u.getTipoUsu().getId() == 3) {
				RequestDispatcher view = request.getRequestDispatcher("WEB-INF/jsp/colaborador/index-colaborador.jsp");
				view.forward(request, response);
			}

		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String email = request.getParameter("email");
		String senha = request.getParameter("senha");
		Usuario u = null;

		try{

			u = new UsuarioDAO().autenticarUsuario(senha, email);

		}catch(RuntimeException e) {

			request.setAttribute("msg", "Serviço indisponível. Tente novamente mais tarde<br>" + e.getMessage());
			request.setAttribute("email", email);
			request.setAttribute("senha", senha);
			RequestDispatcher view = request.getRequestDispatcher("WEB-INF/jsp/login.jsp");
			view.forward(request, response);
			return;

		}

		if(u != null) {

			HttpSession session = request.getSession();
			session.setAttribute("Usuario", u);

			if(u.getTipoUsu().getId() == 1) {
				request.setAttribute("visitas", new VisitaDAO().listarVisitasMorador(u.getId()));
				RequestDispatcher view = request.getRequestDispatcher("WEB-INF/jsp/morador/index-morador.jsp");
				view.forward(request, response);
			}
			else if(u.getTipoUsu().getId() == 2) {
				IndexAdministrador iA = new DAOAdministrador().popularIndexAdmin();
				iA.setVisitas(new VisitaDAO().listarVisitas());
				request.setAttribute("adminPage", iA);
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
