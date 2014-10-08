package br.udc.edu.sistemas.ia6.controller;

import br.udc.edu.sistemas.ia6.entity.Produto;
import br.udc.edu.sistemas.ia6.session.SessionProduto;

public class ControllerServico extends Controller{
	
	public ControllerServico() throws Exception {
		super("Servico");
	}

	@Override
	public void goNew() throws Exception {
		SessionProduto sessionProduto = new SessionProduto();
		Object listProduto[] = sessionProduto.find(new Produto());
		request.setAttribute("listProduto",listProduto);
		request.setAttribute("nextPage","./servico/manterServico.jsp");
	}

	@Override
	public void goFind() throws Exception {
		SessionProduto sessionProduto = new SessionProduto();
		Object listProduto[] = sessionProduto.find(new Produto());
		request.setAttribute("listProduto",listProduto);
		request.setAttribute("nextPage","./servico/consultarServico.jsp");
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
