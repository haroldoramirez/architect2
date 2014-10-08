package br.udc.edu.sistemas.ia6.session;

import br.udc.edu.sistemas.ia6.dao.Dao;
import br.udc.edu.sistemas.ia6.dao.daoDatabase.DaoMarca;
import br.udc.edu.sistemas.ia6.entity.Marca;
import br.udc.edu.sistemas.ia6.entity.Modelo;
import br.udc.edu.sistemas.ia6.factory.FactoryDao;

public class SessionModelo extends Session{

	public SessionModelo() throws Exception{
		super(FactoryDao.createDao(new Modelo()));
	}
	
	@Override
	public Object[] find(Object obj) throws Exception {
		Object list[] = super.find(obj);
		DaoMarca daoMarca = new DaoMarca();
		for (int i = 0; i < list.length; i++) {
			Modelo modelo = (Modelo) list[i];
			modelo.setMarca((Marca) daoMarca.findByPrimaryKey(modelo.getMarca()));
		}
		return list;
	}
	
	@Override
	public Object findByPrimaryKey(Object obj) throws Exception {
		Modelo modelo = (Modelo) super.findByPrimaryKey(obj);
		DaoMarca daoMarca = new DaoMarca();
		modelo.setMarca((Marca) daoMarca.findByPrimaryKey(modelo.getMarca()));
		return modelo;
	}
	
	public SessionModelo(Dao dao) {
		super(dao);
	}
}
