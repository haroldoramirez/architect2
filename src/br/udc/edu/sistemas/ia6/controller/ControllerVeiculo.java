package br.udc.edu.sistemas.ia6.controller;

import br.udc.edu.sistemas.ia6.entity.Cliente;
import br.udc.edu.sistemas.ia6.entity.Modelo;
import br.udc.edu.sistemas.ia6.session.SessionCliente;
import br.udc.edu.sistemas.ia6.session.SessionModelo;

public class ControllerVeiculo extends Controller{
	
	public ControllerVeiculo() throws Exception {
		super("Veiculo");
	}

	@Override
	public void goNew() throws Exception {
		SessionModelo sessionModelo = new SessionModelo();
		SessionCliente sessionCliente = new SessionCliente();
		Object listModelo[] = sessionModelo.find(new Modelo());
		Object listCliente[] = sessionCliente.find(new Cliente());
		request.setAttribute("listModelo",listModelo);
		request.setAttribute("listCliente",listCliente);
		request.setAttribute("nextPage","./veiculo/manterVeiculo.jsp");
	}

	@Override
	public void goFind() throws Exception {
		SessionModelo sessionModelo = new SessionModelo();
		SessionCliente sessionCliente = new SessionCliente();
		Object listModelo[] = sessionModelo.find(new Modelo());
		Object listCliente[] = sessionCliente.find(new Cliente());
		request.setAttribute("listModelo",listModelo);
		request.setAttribute("listCliente",listCliente);
		request.setAttribute("nextPage","./veiculo/consultarVeiculo.jsp");
	}

	@Override
	public void save(Object obj) throws Exception {
		this.goNew();
	}

	@Override
	public void delete(Object obj) throws Exception {
		this.goFind();
	}

	@Override
	public void deleteList(Object obj) throws Exception {
		this.find(obj);
	}

	@Override
	public void detail(Object obj) throws Exception {
		request.setAttribute("object",obj);
		this.goNew();
	}
	
	@Override
	public void find(Object obj) throws Exception {
		request.setAttribute("list",obj);
		this.goFind();
	}

	@Override
	public void findByPrimary(Object obj) throws Exception {
		
	}

}
