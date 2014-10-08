package br.udc.edu.sistemas.ia6.entity;

import br.udc.edu.sistemas.ia6.annotation.Column;
import br.udc.edu.sistemas.ia6.annotation.Entity;
import br.udc.edu.sistemas.ia6.annotation.GeneratedValue;
import br.udc.edu.sistemas.ia6.annotation.Id;
import br.udc.edu.sistemas.ia6.annotation.Table;

@Entity
@Table(name="Cliente")

public class Cliente {
	
	@Id
	@GeneratedValue
	@Column(name = "idcliente", type=Column.INTEGER, nullable=false, insertable=false, updatable=false, unique=true)
	private Integer idCliente;
	
	@Column(name = "nome", type=Column.STRING, length=100, nullable=false)
	private String nome;
	
	@Column(name = "rg", type=Column.STRING, length=18, nullable=false)
	private String rg;
	
	@Column(name = "cpf", type=Column.STRING, length=25, nullable=false)
	private String cpf;
	
	@Column(name = "endereco", type=Column.STRING, length=400, nullable=false)
	private String endereco;
	
	public Integer getIdCliente() {
		return idCliente;
	}

	public void setIdCliente(Integer idCliente) {
		this.idCliente = idCliente;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getRg() {
		return rg;
	}

	public void setRg(String rg) {
		this.rg = rg;
	}

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public String getEndereco() {
		return endereco;
	}

	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Cliente other = (Cliente) obj;
		if (cpf == null) {
			if (other.cpf != null)
				return false;
		} else if (!cpf.equals(other.cpf))
			return false;
		if (endereco == null) {
			if (other.endereco != null)
				return false;
		} else if (!endereco.equals(other.endereco))
			return false;
		if (idCliente == null) {
			if (other.idCliente != null)
				return false;
		} else if (!idCliente.equals(other.idCliente))
			return false;
		if (nome == null) {
			if (other.nome != null)
				return false;
		} else if (!nome.equals(other.nome))
			return false;
		if (rg == null) {
			if (other.rg != null)
				return false;
		} else if (!rg.equals(other.rg))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Cliente [idCliente=" + this.idCliente + ", nome=" + this.nome + ", rg=" + this.rg + ", cpf=" + this.cpf + ", endereco=" + this.endereco + "]";
	}
	
}
