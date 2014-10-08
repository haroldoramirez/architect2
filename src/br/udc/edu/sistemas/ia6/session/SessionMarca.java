package br.udc.edu.sistemas.ia6.session;

import br.udc.edu.sistemas.ia6.dao.Dao;
import br.udc.edu.sistemas.ia6.entity.Marca;
import br.udc.edu.sistemas.ia6.factory.FactoryDao;

public class SessionMarca extends Session{

	public SessionMarca() throws Exception{
		super(FactoryDao.createDao(new Marca()));
	}
	
	public SessionMarca(Dao dao) {
		super(dao);
	}
}
