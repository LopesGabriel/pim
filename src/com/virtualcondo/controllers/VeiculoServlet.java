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

		if(acao != null && user.getTipoUsu().getNivelAcesso().equals("Morador")) {
			if(acao.equals("edit")) {
				Integer idV = Integer.parseInt(idVeiculo);
				request.setAttribute("veiculo", new VeiculoDAO().buscarVeiculo(idV));
				request.setAttribute("vagas", new VagasDAO().listarVagas());
				RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/jsp/morador/editar-veiculo.jsp");
				dispatcher.forward(request, response);
				return;
			}else if(acao.equals("listar")) {
				request.setAttribute("veiculosMorador", new VeiculoDAO().listarVeiculoMorador(user.getId()));
				RequestDispatcher view = request.getRequestDispatcher("WEB-INF/jsp/morador/veiculo-lista.jsp");
				view.forward(request, response);
				return;
			}else if(acao.equals("cadastrar")) {
				RequestDispatcher view = request.getRequestDispatcher("WEB-INF/jsp/morador/cadastrar-veiculo.jsp");
				request.setAttribute("vagas", new VagasDAO().listarVagas());
				view.forward(request, response);
				return;
			}
		} else if(acao != null && user.getTipoUsu().getNivelAcesso().equals("Síndico")) {
			
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Usuario user = (Usuario) request.getSession().getAttribute("Usuario");
		String id = request.getParameter("idVeiculo");
		Integer idVeiculo = Integer.parseInt(id);
		Vagas vagaV = new VagasDAO().buscarVaga(request.getParameter("vaga"));
		Veiculo veiculo = null;

		if (id == null) {
			new VagasDAO().setarVagaEmUso(vagaV);
			vagaV.setEm_uso(true);
			veiculo = new Veiculo(null, request.getParameter("marca"), request.getParameter("placa"), vagaV);
			if(veiculo != null) {
				new VeiculoDAO().salvarVeiculo(veiculo, user);
				user.setVeiculo(veiculo);
			}
		}else {
			veiculo = new Veiculo(idVeiculo, request.getParameter("marca"), request.getParameter("placa"), vagaV);
			new VeiculoDAO().editarVeiculo(veiculo);
		}

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
