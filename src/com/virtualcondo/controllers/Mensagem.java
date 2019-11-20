package com.virtualcondo.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.virtualcondo.models.Usuario;
import com.virtualcondo.persistencia.MensagemDAO;
import com.virtualcondo.persistencia.UsuarioDAO;

@WebServlet("/mensagem")
public class Mensagem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Mensagem() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Usuario user = (Usuario) request.getSession().getAttribute("Usuario");
		String acao = request.getParameter("acao");
		
		if(acao != null) {
			
			if(acao.equals("visualizar")) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/jsp/morador/mensagem-visualizar.jsp");
				dispatcher.forward(request, response);
				return;
			}else if (acao.equals("enviar")) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/jsp/morador/enviar-mensagem.jsp");
				request.setAttribute("moradores", new UsuarioDAO().listarMoradores());
				dispatcher.forward(request, response);
				return;
			}
			
		}
		
		
		if(user.getTipoUsu().getNivelAcesso().equals("Morador")) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/jsp/morador/mensagem-lista.jsp");
			dispatcher.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Usuario user = (Usuario) request.getSession().getAttribute("Usuario");
		String assunto = request.getParameter("assunto");
		String idDestinatario = request.getParameter("destinatario");
		String mensagemF = request.getParameter("mensagem");
		Usuario destinatario = new UsuarioDAO().buscarPorId(Integer.parseInt(idDestinatario));
		
		com.virtualcondo.models.Mensagem mensagem = new com.virtualcondo.models.Mensagem(assunto, mensagemF, destinatario, user);
		new MensagemDAO().enviarMensagem(mensagem);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/jsp/morador/mensagem-lista.jsp");
		dispatcher.forward(request, response);
	}

}
