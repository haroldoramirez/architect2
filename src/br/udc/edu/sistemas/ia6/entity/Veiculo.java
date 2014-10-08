package br.udc.edu.sistemas.ia6.entity;

import br.udc.edu.sistemas.ia6.annotation.Column;
import br.udc.edu.sistemas.ia6.annotation.Entity;
import br.udc.edu.sistemas.ia6.annotation.GeneratedValue;
import br.udc.edu.sistemas.ia6.annotation.Id;
import br.udc.edu.sistemas.ia6.annotation.Table;

@Entity
@Table(name="Veiculo")

public class Veiculo {
	
	@Id
	@GeneratedValue
	@Column(name = "idveiculo", type = Column.INTEGER, nullable = false, insertable = false, updatable = false, unique = true)
	private Integer idVeiculo;
	
	@Column(name = "placa", type = Column.STRING, length = 15, nullable = false)
	private String placa;
	
	@Column(name = "chassi", type = Column.STRING, length = 100, nullable = false)
	private String chassi;
	
	@Column(name = "modelo", type = Column.OBJECT, nullable = false)
	private Modelo modelo;
	
	@Column(name = "cliente", type = Column.OBJECT, nullable = false)
	private Cliente cliente;

	public Integer getIdVeiculo() {
		return idVeiculo;
	}

	public void setIdVeiculo(Integer idVeiculo) {
		this.idVeiculo = idVeiculo;
	}

	public String getPlaca() {
		return placa;
	}

	public void setPlaca(String placa) {
		this.placa = placa;
	}

	public String getChassi() {
		return chassi;
	}

	public void setChassi(String chassi) {
		this.chassi = chassi;
	}

	public Modelo getModelo() {
		return modelo;
	}

	public void setModelo(Modelo modelo) {
		this.modelo = modelo;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Veiculo other = (Veiculo) obj;
		if (chassi == null) {
			if (other.chassi != null)
				return false;
		} else if (!chassi.equals(other.chassi))
			return false;
		if (cliente == null) {
			if (other.cliente != null)
				return false;
		} else if (!cliente.equals(other.cliente))
			return false;
		if (idVeiculo == null) {
			if (other.idVeiculo != null)
				return false;
		} else if (!idVeiculo.equals(other.idVeiculo))
			return false;
		if (modelo == null) {
			if (other.modelo != null)
				return false;
		} else if (!modelo.equals(other.modelo))
			return false;
		if (placa == null) {
			if (other.placa != null)
				return false;
		} else if (!placa.equals(other.placa))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Veiculo [idVeiculo=" + this.idVeiculo + ", placa=" + this.placa
				+ ", chassi=" + this.chassi + ", modelo=" + this.modelo + ", cliente="
				+ this.cliente + "]";
	}
}
