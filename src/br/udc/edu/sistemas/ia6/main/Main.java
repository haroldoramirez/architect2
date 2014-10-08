package br.udc.edu.sistemas.ia6.main;

import br.udc.edu.sistemas.ia6.dao.daoDatabase.DaoMarca;
import br.udc.edu.sistemas.ia6.entity.Marca;

public class Main {

	public static void main(String[] args) throws Exception {
		DaoMarca daoMarca = new DaoMarca();
		
		Marca marca = new Marca();
		marca.setDescricao("");
		
		daoMarca.commit();
		
		System.out.println(marca);
	}
}
