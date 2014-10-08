package br.udc.edu.sistemas.ia6.session;

import br.udc.edu.sistemas.ia6.dao.Dao;
import br.udc.edu.sistemas.ia6.dao.daoDatabase.DaoCliente;
import br.udc.edu.sistemas.ia6.dao.daoDatabase.DaoModelo;
import br.udc.edu.sistemas.ia6.entity.Cliente;
import br.udc.edu.sistemas.ia6.entity.Modelo;
import br.udc.edu.sistemas.ia6.entity.Veiculo;
import br.udc.edu.sistemas.ia6.factory.FactoryDao;

public class SessionVeiculo extends Session{
	
	public SessionVeiculo() throws Exception{
		super(FactoryDao.createDao(new Veiculo()));
	}
	
	@Override
	public Object[] find(Object obj) throws Exception {
		Object list[] = super.find(obj);
		DaoModelo daoModelo = new DaoModelo();
		DaoCliente daoCliente = new DaoCliente();
		for (int i = 0; i < list.length; i++) {
			Veiculo veiculo = (Veiculo) list[i];
			veiculo.setModelo((Modelo) daoModelo.findByPrimaryKey(veiculo.getModelo()));
			veiculo.setCliente((Cliente) daoCliente.findByPrimaryKey(veiculo.getCliente()));
		}
		return list;
	}
	
	@Override
	public Object findByPrimaryKey(Object obj) throws Exception {
		Veiculo veiculo = (Veiculo) super.findByPrimaryKey(obj);
		DaoModelo daoModelo = new DaoModelo();
		DaoCliente daoCliente = new DaoCliente();
		veiculo.setModelo((Modelo) daoModelo.findByPrimaryKey(veiculo.getModelo()));
		veiculo.setCliente((Cliente) daoCliente.findByPrimaryKey(veiculo.getCliente()));
		return veiculo;
	}
	
	public SessionVeiculo(Dao dao) {
		super(dao);
	}

}
