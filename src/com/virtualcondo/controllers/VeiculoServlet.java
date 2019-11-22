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
import com.virtualcondo.models.Vagas;
import com.virtualcondo.models.Veiculo;
import com.virtualcondo.persistencia.UsuarioDAO;
import com.virtualcondo.persistencia.VagasDAO;
import com.virtualcondo.persistencia.VeiculoDAO;

@WebServlet("/veiculo")
public class VeiculoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public VeiculoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Usuario user = (Usuario) request.getSession().getAttribute("Usuario");
		String acao = request.getParameter("acao");
		String idVeiculo = request.getParameter("idVeiculo");

		if(acao != null && acao.equals("edit")) {
			Integer idV = Integer.parseInt(idVeiculo);
			
			request.setAttribute("veiculo", new VeiculoDAO().buscarVeiculo(idV));
			request.setAttribute("vagas", new VagasDAO().listarVagas());
			RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/jsp/morador/editar-veiculo.jsp");
			dispatcher.forward(request, response);
			return;
		}else if(acao != null && acao.equals("listar")) {
			request.setAttribute("veiculosMorador", new VeiculoDAO().listarVeiculoMorador(user.getId()));
			RequestDispatcher view = request.getRequestDispatcher("WEB-INF/jsp/morador/veiculo-lista.jsp");
			view.forward(request, response);
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String idVeiculo = request.getParameter("idVeiculo");
		String marca = request.getParameter("marca");
		String placa = request.getParameter("placa");
		String vaga = request.getParameter("vaga");

		Vagas vagaV = new VagasDAO().buscarVaga(vaga);
		Veiculo veiculo = new Veiculo(Integer.parseInt(idVeiculo), marca, placa, vagaV);

		new VeiculoDAO().editarVeiculo(veiculo);
		
		response.sendRedirect("/virtualcondo/veiculo?acao=listar");
	}
	
	@Override
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Usuario user = (Usuario) request.getSession().getAttribute("Usuario");
		Integer vaga_id = user.getVeiculo().getVaga().getId();
		Integer id = Integer.parseInt(request.getParameter("id"));

		new VagasDAO().removerVagaEmUso(vaga_id);
		new VeiculoDAO().deletarVeiculoMorador(id, user);
		
		HttpSession session = request.getSession();
		session.setAttribute("Usuario", new UsuarioDAO().buscarPorId(user.getId()));
	}

}
