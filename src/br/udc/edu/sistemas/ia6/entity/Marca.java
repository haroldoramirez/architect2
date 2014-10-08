package br.udc.edu.sistemas.ia6.entity;

import br.udc.edu.sistemas.ia6.annotation.Column;
import br.udc.edu.sistemas.ia6.annotation.Entity;
import br.udc.edu.sistemas.ia6.annotation.GeneratedValue;
import br.udc.edu.sistemas.ia6.annotation.Id;
import br.udc.edu.sistemas.ia6.annotation.Table;

@Entity
@Table(name="marca")

public class Marca {
	
	@Id
	@GeneratedValue
	@Column(name = "idmarca", type=Column.INTEGER, nullable=false, insertable=false, updatable=false, unique=true)
	private Integer idMarca;
	
	@Column(name = "descricao", type=Column.STRING, length=150, nullable=false)
	private String descricao;

	
	public Integer getIdMarca() {
		return idMarca;
	}

	public void setIdMarca(Integer idMarca) {
		this.idMarca = idMarca;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Marca other = (Marca) obj;
		if (descricao == null) {
			if (other.descricao != null)
				return false;
		} else if (!descricao.equals(other.descricao))
			return false;
		if (idMarca == null) {
			if (other.idMarca != null)
				return false;
		} else if (!idMarca.equals(other.idMarca))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Marca [idMarca=" + this.idMarca + ", descricao=" + this.descricao + "]";
	}
}
