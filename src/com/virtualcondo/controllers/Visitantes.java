package com.virtualcondo.controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.virtualcondo.models.Usuario;
import com.virtualcondo.models.Visitante;
import com.virtualcondo.persistencia.VisitanteDAO;

@WebServlet("/visitantes")
public class Visitantes extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Visitantes() {
        super();
    }

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		HttpSession session = req.getSession();
    	Usuario u = (Usuario) session.getAttribute("Usuario");
    	String id = req.getParameter("id");
    	String acao = req.getParameter("acao");
    	if(acao == null) acao = "listar";
    	req.setCharacterEncoding("utf-8");

    	try {

    		// Usuário é Síndico
        	if(u.getTipoUsu().getId() == 2) {

        		if(acao.equals("listar")) {
        			List<Visitante> lista = new VisitanteDAO().listarVisitantes();
        			req.setAttribute("visitantes", lista);
        			RequestDispatcher view = req.getRequestDispatcher("WEB-INF/jsp/admin/lista-visitantes.jsp");
            		view.forward(req, res);
        		}
        		else if(acao.equalsIgnoreCase("cadastrar")) {

        			RequestDispatcher view = req.getRequestDispatcher("WEB-INF/jsp/admin/cadastro-visitante.jsp");
            		view.forward(req, res);

        		}
        		else if(acao.equalsIgnoreCase("editar")) {

        			Visitante v = new VisitanteDAO().recuperarVisitante(Integer.parseInt(id));
        			req.setAttribute("visitante", v);
        			RequestDispatcher view = req.getRequestDispatcher("WEB-INF/jsp/admin/editar-visitante.jsp");
            		view.forward(req, res);

        		}

        	}

    	}catch(Exception e) {
    		e.printStackTrace();
    	}

	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, res);
	}

	protected void doPut(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	protected void doDelete(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
