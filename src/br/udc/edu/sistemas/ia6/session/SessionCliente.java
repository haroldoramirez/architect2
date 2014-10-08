package br.udc.edu.sistemas.ia6.session;

import br.udc.edu.sistemas.ia6.dao.Dao;
import br.udc.edu.sistemas.ia6.entity.Cliente;
import br.udc.edu.sistemas.ia6.factory.FactoryDao;

public class SessionCliente extends Session{
	
	public SessionCliente() throws Exception{
		super(FactoryDao.createDao(new Cliente()));
	}
	
	public SessionCliente(Dao dao) {
		super(dao);
	}

}
