package com.virtualcondo.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.virtualcondo.models.Usuario;
import com.virtualcondo.models.Vagas;
import com.virtualcondo.models.Veiculo;
import com.virtualcondo.persistencia.VagasDAO;
import com.virtualcondo.persistencia.VeiculoDAO;

@WebServlet("/cadastrar-veiculo")
public class CadastrarVeiculo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	VagasDAO vagaDao = new VagasDAO();
	VeiculoDAO veiculoDao = new VeiculoDAO();

    public CadastrarVeiculo() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		RequestDispatcher view = request.getRequestDispatcher("WEB-INF/jsp/morador/cadastrar-veiculo.jsp");
		request.setAttribute("vagas", new VagasDAO().listarVagas());
		view.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Usuario user = (Usuario) request.getSession().getAttribute("Usuario");
		String marca = request.getParameter("marca");
		String placa = request.getParameter("placa");
		String v = request.getParameter("vaga");

		Vagas vaga = new VagasDAO().buscarVaga(v);
		vagaDao.setarVagaEmUso(vaga);
		vaga.setEm_uso(true);

		Veiculo veiculo = new Veiculo();
		veiculo.setMarca(marca);
		veiculo.setPlaca(placa);
		veiculo.setVaga(vaga);
		
		if(veiculo != null) {
			veiculoDao.salvarVeiculo(veiculo, user);

			response.sendRedirect("/virtualcondo/veiculo");
//			RequestDispatcher view = request.getRequestDispatcher("/veiculo");
//			view.forward(request, response);
		}
		
		
	}

}
