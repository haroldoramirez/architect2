package br.udc.edu.sistemas.ia6.session;

import br.udc.edu.sistemas.ia6.dao.Dao;
import br.udc.edu.sistemas.ia6.entity.Servico;
import br.udc.edu.sistemas.ia6.factory.FactoryDao;

public class SessionServico extends Session{
	
	public SessionServico() throws Exception{
		super(FactoryDao.createDao(new Servico()));
	}
	
	public SessionServico(Dao dao) {
		super(dao);
	}

}
