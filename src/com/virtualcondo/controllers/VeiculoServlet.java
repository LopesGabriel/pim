package com.virtualcondo.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.virtualcondo.models.Usuario;
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
		request.setAttribute("veiculosMorador", new VeiculoDAO().listarVeiculoMorador(user.getId()));
		RequestDispatcher view = request.getRequestDispatcher("WEB-INF/jsp/morador/veiculo-lista.jsp");
		view.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	@Override
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Usuario user = (Usuario) request.getSession().getAttribute("Usuario");
		Integer vaga_id = user.getVeiculo().getVaga().getId();
		String payload = request.getParameter("id");
		Integer id = Integer.parseInt(payload);

		new VagasDAO().removerVagaEmUso(vaga_id);
		new VeiculoDAO().deletarVeiculoMorador(id, user);
	}

}
