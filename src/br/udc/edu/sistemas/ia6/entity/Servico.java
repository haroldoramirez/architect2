package br.udc.edu.sistemas.ia6.entity;

import br.udc.edu.sistemas.ia6.annotation.Column;
import br.udc.edu.sistemas.ia6.annotation.Entity;
import br.udc.edu.sistemas.ia6.annotation.GeneratedValue;
import br.udc.edu.sistemas.ia6.annotation.Id;
import br.udc.edu.sistemas.ia6.annotation.Table;


@Entity
@Table(name="Servico")

public class Servico {

	@Id
	@GeneratedValue
	@Column(name = "idservico", type = Column.INTEGER, nullable = false, insertable = false, updatable = false, unique = true)
	private Integer idServico;
	
	@Column(name = "descricao", type = Column.STRING, length = 100, nullable = false)
	private String descricao;
	
	@Column(name = "valorhora", type = Column.FLOAT, nullable = false)
	private Float valorHora;
	
	@Column(name = "produto", type = Column.OBJECT, nullable = false)
	private Produto produto;

	public Integer getIdServico() {
		return idServico;
	}

	public void setIdServico(Integer idServico) {
		this.idServico = idServico;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Float getValorHora() {
		return valorHora;
	}

	public void setValorHora(Float valorHora) {
		this.valorHora = valorHora;
	}

	public Produto getProduto() {
		return produto;
	}

	public void setProduto(Produto produto) {
		this.produto = produto;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Servico other = (Servico) obj;
		if (descricao == null) {
			if (other.descricao != null)
				return false;
		} else if (!descricao.equals(other.descricao))
			return false;
		if (idServico == null) {
			if (other.idServico != null)
				return false;
		} else if (!idServico.equals(other.idServico))
			return false;
		if (produto == null) {
			if (other.produto != null)
				return false;
		} else if (!produto.equals(other.produto))
			return false;
		if (valorHora == null) {
			if (other.valorHora != null)
				return false;
		} else if (!valorHora.equals(other.valorHora))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Servico [idServico=" + this.idServico + ", descricao=" + this.descricao
				+ ", valorHora=" + this.valorHora + ", produto=" + this.produto + "]";
	}
	
}
