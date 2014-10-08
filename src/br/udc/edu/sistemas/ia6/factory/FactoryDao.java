package br.udc.edu.sistemas.ia6.factory;

import br.udc.edu.sistemas.ia6.dao.Dao;

public class FactoryDao {
	
	public static Dao createDao(Object obj) throws Exception {
		String daoClassName = "br.udc.edu.sistemas.ia6.dao.daoDatabase.Dao" + obj.getClass().getSimpleName(); 
		return (Dao) Class.forName(daoClassName).newInstance();
	}

}
