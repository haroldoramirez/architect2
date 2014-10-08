package br.udc.edu.sistemas.ia6.controller;

public class ControllerMarca extends Controller{
	
	public ControllerMarca() throws Exception {
		super("Marca");
	}

	@Override
	public void goNew() throws Exception {
		request.setAttribute("nextPage","./marca/manterMarca.jsp");
	}

	@Override
	public void goFind() throws Exception {
		request.setAttribute("nextPage","./marca/consultarMarca.jsp");
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
