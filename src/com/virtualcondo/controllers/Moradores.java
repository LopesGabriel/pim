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
import com.virtualcondo.persistencia.UsuarioDAO;

@WebServlet("/moradores")
public class Moradores extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Moradores() {
        super();
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

    	HttpSession session = req.getSession();
    	Usuario u = (Usuario) session.getAttribute("Usuario");
    	String id = req.getParameter("id");
    	System.out.println("Tipo usu: " + u.getTipoUsu().getId());

    	try {

        	// Usuário é Síndico
        	if(u.getTipoUsu().getId() == 2) {

        		// Caso informe um id
        		if(id.length() > 0) {

        			

        		}
        		else {

        			List<Usuario> moradores = new UsuarioDAO().listarMoradores();

        			req.setAttribute("moradores", moradores);
        			RequestDispatcher view = req.getRequestDispatcher("WEB-INF/jsp/admin/lista-moradores.jsp");
        			view.forward(req, res);
        			return;

        		}

        	}

    	}catch(RuntimeException e) {

    		req.setAttribute("msg", e.getMessage());
    		RequestDispatcher view = req.getRequestDispatcher("WEB-INF/jsp/auxiliar/erro.jsp");
    		view.forward(req, res);

    	}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	/**
	 * @see HttpServlet#doPut(HttpServletRequest, HttpServletResponse)
	 */
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
