package com.virtualcondo.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.virtualcondo.models.Mensagem;
import com.virtualcondo.models.Usuario;
import com.virtualcondo.persistencia.MensagemDAO;
import com.virtualcondo.persistencia.UsuarioDAO;
import com.virtualcondo.utils.GerarJson;

@WebServlet("/mensagem")
public class MensagemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MensagemServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Usuario user = (Usuario) request.getSession().getAttribute("Usuario");
		String acao = request.getParameter("acao");
		String id = request.getParameter("id");
		
		if(acao != null) {
			if(user.getTipoUsu().getId() == 1) {
				if(acao.equals("visualizar")) {
					new MensagemDAO().setVisualizada(Integer.parseInt(id));
					request.setAttribute("mensagem", new MensagemDAO().buscarPorId(Integer.parseInt(id)));
					RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/jsp/morador/mensagem-visualizar.jsp");
					dispatcher.forward(request, response);
					return;
				}else if (acao.equals("enviar")) {
					RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/jsp/morador/enviar-mensagem.jsp");
					request.setAttribute("moradores", new UsuarioDAO().listarMoradores());
					dispatcher.forward(request, response);
					return;
				}
			}else if(user.getTipoUsu().getId() == 2) {
				if(acao.equals("visualizar")){
					new MensagemDAO().setVisualizada(Integer.parseInt(id));
					request.setAttribute("mensagem", new MensagemDAO().buscarPorId(Integer.parseInt(id)));
					RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/jsp/admin/visualizar-mensagem.jsp");
					dispatcher.forward(request, response);
					return;
				}else if(acao.equals("enviar")) {
					RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/jsp/admin/enviar-mensagem.jsp");
					request.setAttribute("moradores", new UsuarioDAO().listarMoradores());
					dispatcher.forward(request, response);
					return;
				}
			}
			
		}
		
		
		if(user.getTipoUsu().getId() == 1) {
			request.setAttribute("qtdMensagem", new MensagemDAO().quantidadeDeMensagens(user));
			request.setAttribute("mensagens", new MensagemDAO().listarMensagemDoUsuario(user));
			RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/jsp/morador/mensagem-lista.jsp");
			dispatcher.forward(request, response);
			return;
		}else if(user.getTipoUsu().getId() == 2) {
			request.setAttribute("qtdMensagem", new MensagemDAO().quantidadeDeMensagens(user));
			request.setAttribute("mensagens", new MensagemDAO().listarMensagemDoUsuario(user));
			RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/jsp/admin/lista-mensagens.jsp");
			dispatcher.forward(request, response);
			return;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		Usuario user = (Usuario) request.getSession().getAttribute("Usuario");
		String assunto = request.getParameter("assunto");
		String idDestinatario = request.getParameter("destinatario");
		String mensagemF = request.getParameter("mensagem");
		Usuario destinatario = new UsuarioDAO().buscarPorId(Integer.parseInt(idDestinatario));
		
		Mensagem mensagem = new Mensagem(assunto, mensagemF, destinatario, user);
		new MensagemDAO().enviarMensagem(mensagem);
		
		response.sendRedirect("mensagem");
	}
	
	@Override
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {

			response.setContentType("json");
			response.setCharacterEncoding("utf-8");
			Integer id = Integer.parseInt(request.getParameter("id"));
			boolean op = new MensagemDAO().deletarMensagemPorId(id);

			if(op) {

				response.getWriter().write(GerarJson.sucesso("Mensagem deletada com sucesso!"));

			}
			else {

				response.getWriter().write(GerarJson.erro("Não foi possível deletar a mensagem!", null));

			}

		}catch(Exception e) {
			e.printStackTrace();
			response.getWriter().write(GerarJson.erro("Não foi possível deletar a mensagem!", e.getMessage()));
		}
	}

}
