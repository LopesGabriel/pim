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
import com.virtualcondo.persistencia.UsuarioDAO;
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
				List<Usuario> moradores = new UsuarioDAO().listarMoradores();
				req.setAttribute("visitantes", visitantes);
				req.setAttribute("moradores", moradores);
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

		Usuario u = (Usuario) req.getSession().getAttribute("Usuario");
		res.setCharacterEncoding("utf-8");
		req.setCharacterEncoding("utf-8");
		RequestDispatcher view = null;

		if(u != null) {

			try {

				com.virtualcondo.models.Visita v = new com.virtualcondo.models.Visita();
				Visitante visitante = new Visitante(Integer.parseInt(req.getParameter("visitante")));
				Usuario morador = new Usuario(Integer.parseInt(req.getParameter("morador")));
				v.setVisitante(visitante);
				v.setResponsavel(morador);
				new VisitaDAO().incluirVisita(v);

				req.setAttribute("msg", "Visita cadastrada com sucesso!<br>Informe quando o visitante sair.");
				view = req.getRequestDispatcher("WEB-INF/jsp/admin/cadastro-visita.jsp");
				view.forward(req, res);

			}catch(Exception e) {
				e.printStackTrace();
				req.setAttribute("msg", "Não foi possível cadastrar a visita! Tente novamente mais tarde.<br>"+ e.getMessage());
				view = req.getRequestDispatcher("WEB-INF/jsp/admin/cadastro-visita.jsp");
				view.forward(req, res);
			}

		}
		else {
			res.sendRedirect("/virtualcondo/index");
		}

		return;

	}

	protected void doPut(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		Usuario u = (Usuario) req.getSession().getAttribute("Usuario");
		res.setCharacterEncoding("utf-8");
		res.setContentType("json");

		if(u != null) {

			try {

				Integer id = Integer.parseInt(req.getParameter("uid"));

			}catch(Exception e) {
				e.printStackTrace();
			}

		}

	}

	protected void doDelete(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
