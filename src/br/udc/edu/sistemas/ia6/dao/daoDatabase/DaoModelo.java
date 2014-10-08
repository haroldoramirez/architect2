package br.udc.edu.sistemas.ia6.dao.daoDatabase;

import java.sql.Connection;

public class DaoModelo extends DaoDatabase{

	public DaoModelo() throws Exception {
		super();
	}
	
	public DaoModelo(Connection con) throws Exception {
		super(con);
	}

}
