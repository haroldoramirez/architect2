package br.udc.edu.sistemas.ia6.controller;

import br.udc.edu.sistemas.ia6.entity.Cliente;
import br.udc.edu.sistemas.ia6.entity.Produto;
import br.udc.edu.sistemas.ia6.entity.Servico;
import br.udc.edu.sistemas.ia6.entity.Veiculo;
import br.udc.edu.sistemas.ia6.session.SessionCliente;
import br.udc.edu.sistemas.ia6.session.SessionProduto;
import br.udc.edu.sistemas.ia6.session.SessionServico;
import br.udc.edu.sistemas.ia6.session.SessionVeiculo;

public class ControllerOrdemServico extends Controller{
	
	public ControllerOrdemServico() throws Exception {
		super("OrdemServico");
	}

	@Override
	public void goNew() throws Exception {
		SessionCliente sessionCliente = new SessionCliente();
		SessionVeiculo sessionVeiculo = new SessionVeiculo();
		SessionProduto sessionProduto = new SessionProduto();
		SessionServico sessionServico = new SessionServico();
		Object listCliente[] = sessionCliente.find(new Cliente());
		Object listVeiculo[] = sessionVeiculo.find(new Veiculo());
		Object listProduto[] = sessionProduto.find(new Produto());
		Object listServico[] = sessionServico.find(new Servico());
		request.setAttribute("listCliente",listCliente);
		request.setAttribute("listVeiculo",listVeiculo);
		request.setAttribute("listProduto",listProduto);
		request.setAttribute("listServico",listServico);
		request.setAttribute("nextPage","./ordemservico/manterOrdemServico.jsp");
	}

	@Override
	public void goFind() throws Exception {
		SessionCliente sessionCliente = new SessionCliente();
		SessionVeiculo sessionVeiculo = new SessionVeiculo();
		SessionProduto sessionProduto = new SessionProduto();
		SessionServico sessionServico = new SessionServico();
		Object listCliente[] = sessionCliente.find(new Cliente());
		Object listVeiculo[] = sessionVeiculo.find(new Veiculo());
		Object listProduto[] = sessionProduto.find(new Produto());
		Object listServico[] = sessionServico.find(new Servico());
		request.setAttribute("listCliente",listCliente);
		request.setAttribute("listVeiculo",listVeiculo);
		request.setAttribute("listProduto",listProduto);
		request.setAttribute("listServico",listServico);
		request.setAttribute("nextPage","./ordemservico/consultarOrdemServico.jsp");
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
