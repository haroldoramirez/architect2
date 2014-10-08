package br.udc.edu.sistemas.ia6.session;

import br.udc.edu.sistemas.ia6.dao.Dao;
import br.udc.edu.sistemas.ia6.entity.OrdemServico;
import br.udc.edu.sistemas.ia6.factory.FactoryDao;

public class SessionOrdemServico extends Session{
	
	public SessionOrdemServico() throws Exception{
		super(FactoryDao.createDao(new OrdemServico()));
	}
	
	public SessionOrdemServico(Dao dao) {
		super(dao);
	}

}
