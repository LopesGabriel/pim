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

import com.virtualcondo.models.TipoUsu;
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
    	String acao = req.getParameter("acao");
    	if(acao == null) acao = "listar";

    	try {

        	// Usuário é Síndico
        	if(u.getTipoUsu().getId() == 2) {

    			if(acao.equalsIgnoreCase("listar")) {

    				List<Usuario> moradores = new UsuarioDAO().listarMoradores();

    				req.setAttribute("moradores", moradores);
    				RequestDispatcher view = req.getRequestDispatcher("WEB-INF/jsp/admin/lista-moradores.jsp");
    				view.forward(req, res);

    			}
    			else if(acao.equalsIgnoreCase("cadastrar")) {

    				RequestDispatcher view = req.getRequestDispatcher("WEB-INF/jsp/admin/cadastro-morador.jsp");
    				view.forward(req, res);

    			}
    			else {

    				Usuario user = new UsuarioDAO().buscarPorId(Integer.parseInt(id));
    				req.setAttribute("user", user);
    				RequestDispatcher view = req.getRequestDispatcher("WEB-INF/jsp/admin/editar-morador.jsp");
    				view.forward(req, res);

    			}

        	}

    	}catch(RuntimeException e) {

    		e.printStackTrace();
    		req.setAttribute("msg", e.getMessage());
    		RequestDispatcher view = req.getRequestDispatcher("WEB-INF/jsp/auxiliar/erro.jsp");
    		view.forward(req, res);

    	}

	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("utf-8");

		String nome = req.getParameter("nome");
		String cpf = req.getParameter("cpf");
		String rg = req.getParameter("rg");
		String email = req.getParameter("email");
		String senha = req.getParameter("senha");
		String tipoUsu = req.getParameter("tpMorador");
		String acao = req.getParameter("acao");

		if(acao == null) {

			TipoUsu tU = new TipoUsu();
			tU.setId(Integer.parseInt(tipoUsu));
			
			Usuario u = new Usuario();
			u.setNome(nome);
			u.setCpf(cpf);
			u.setRg(rg);
			u.setEmail(email);
			u.setSenha(senha);
			u.setTipoUsu(tU);
			
			boolean op = false;
			try {
				op = new UsuarioDAO().salvarUsuario(u);
			}catch(RuntimeException e) {
				req.setAttribute("msg", "Não foi possível cadastrar o morador! " + e.getMessage());
				RequestDispatcher view = req.getRequestDispatcher("WEB-INF/jsp/auxiliar/erro.jsp");
				view.forward(req, res);
			}
			
			if(op) {
				
				req.setAttribute("msg", "Morador cadastrado com sucesso!");
				RequestDispatcher view = req.getRequestDispatcher("WEB-INF/jsp/admin/cadastro-morador.jsp");
				view.forward(req, res);
				
			}
			else {
				
				req.setAttribute("msg", "Não foi possível cadastrar o morador!");
				RequestDispatcher view = req.getRequestDispatcher("WEB-INF/jsp/admin/cadastro-morador.jsp");
				view.forward(req, res);
				
			}

			return;
		}
		else {

			TipoUsu tU = new TipoUsu();
			tU.setId(Integer.parseInt(tipoUsu));
			
			Usuario u = new Usuario();
			u.setId(Integer.parseInt(req.getParameter("uId")));
			u.setNome(nome);
			u.setCpf(cpf);
			u.setRg(rg);
			u.setEmail(email);
			u.setTipoUsu(tU);

			boolean op = new UsuarioDAO().EditarMorador(u);

			if(op) {
				req.setAttribute("msg", u.getNome() + ", foi editado com sucesso!");
				req.setAttribute("user", u);
				RequestDispatcher view = req.getRequestDispatcher("WEB-INF/jsp/admin/editar-morador.jsp");
				view.forward(req, res);
			}
			else {
				req.setAttribute("msg", "Não foi possível editar o morador.");
				RequestDispatcher view = req.getRequestDispatcher("WEB-INF/jsp/auxiliar/erro.jsp");
	    		view.forward(req, res);
			}

		}

	}

	protected void doPut(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String nome = req.getParameter("nome");
		System.out.println("Method Put, Nome: " + nome);
	}

	protected void doDelete(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
