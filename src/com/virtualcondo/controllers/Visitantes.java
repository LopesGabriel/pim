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
import javax.servlet.http.HttpSession;

import com.virtualcondo.models.Usuario;
import com.virtualcondo.models.Visitante;
import com.virtualcondo.persistencia.VisitanteDAO;
import com.virtualcondo.utils.GerarJson;

@WebServlet("/visitantes")
@MultipartConfig
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

		Usuario u = (Usuario) req.getSession().getAttribute("Usuario");
		RequestDispatcher view = null;
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");

		String nome = req.getParameter("nome");
		String rg = req.getParameter("rg");
		String cpf = req.getParameter("cpf");
		String telefone = req.getParameter("telefone");
		String acao = req.getParameter("acao");
		if(acao == null) acao = "inserir";

		if(u != null) {
			if(acao.equals("editar")) {
				try {
					Integer id = Integer.parseInt(req.getParameter("uid"));
					Visitante v = new Visitante(id, nome, cpf, rg, telefone);
					boolean op = new VisitanteDAO().editarVisitante(v);

					res.setContentType("json");

					if(op) res.getWriter().write(GerarJson.sucesso("Visitante atualizado com sucesso!"));
					else res.getWriter().write(GerarJson.erro("Erro ao atualizar.", null));
				}catch(Exception e) {
					e.printStackTrace();
					res.getWriter().write(GerarJson.erro("Erro ao atualizar.", e.getMessage()));
				}
				return;
			}else {
				try {
					
					Visitante v = new Visitante(0, nome, cpf, rg, telefone);
					boolean op = new VisitanteDAO().salvarVisitante(v);
					
					if(op) {
						req.setAttribute("msg", nome + ", foi cadastrado com sucesso!");
						view = req.getRequestDispatcher("WEB-INF/jsp/admin/cadastro-visitante.jsp");
					}
					else {
						req.setAttribute("msg", "Não foi possível cadastrar o visitante!");
						view = req.getRequestDispatcher("WEB-INF/jsp/admin/cadastro-visitante.jsp");
					}
					view.forward(req, res);
					return;
					
				}catch(Exception e) {
					e.printStackTrace();
					req.setAttribute("msg", e.getMessage());
					view = req.getRequestDispatcher("WEB-INF/auxiliar/error.jsp");
				}
			}
		}else {
			res.sendRedirect("/virtualcondo/login");
		}

	}

	protected void doDelete(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
