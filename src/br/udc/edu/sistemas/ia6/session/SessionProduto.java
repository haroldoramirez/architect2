package br.udc.edu.sistemas.ia6.session;

import br.udc.edu.sistemas.ia6.dao.Dao;
import br.udc.edu.sistemas.ia6.entity.Produto;
import br.udc.edu.sistemas.ia6.factory.FactoryDao;

public class SessionProduto extends Session{
	
	public SessionProduto() throws Exception{
		super(FactoryDao.createDao(new Produto()));
	}
	
	public SessionProduto(Dao dao) {
		super(dao);
	}

}
