package br.udc.edu.sistemas.ia6.controller;

import br.udc.edu.sistemas.ia6.entity.Marca;
import br.udc.edu.sistemas.ia6.session.SessionMarca;

public class ControllerModelo extends Controller {
	
	public ControllerModelo() throws Exception {
		super("Modelo");
	}

	@Override
	public void goNew() throws Exception {
		SessionMarca sessionMarca = new SessionMarca();
		Object listMarca[] = sessionMarca.find(new Marca());
		request.setAttribute("listMarca",listMarca);
		request.setAttribute("nextPage","./modelo/manterModelo.jsp");
	}

	@Override
	public void goFind() throws Exception {
		SessionMarca sessionMarca = new SessionMarca();
		Object listMarca[] = sessionMarca.find(new Marca());
		request.setAttribute("listMarca",listMarca);
		request.setAttribute("nextPage","./modelo/consultarModelo.jsp");
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
