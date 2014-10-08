package br.udc.edu.sistemas.ia6.entity;

import br.udc.edu.sistemas.ia6.annotation.Column;
import br.udc.edu.sistemas.ia6.annotation.Entity;
import br.udc.edu.sistemas.ia6.annotation.GeneratedValue;
import br.udc.edu.sistemas.ia6.annotation.Id;
import br.udc.edu.sistemas.ia6.annotation.Table;

@Entity
@Table(name="OrdemServico")

public class OrdemServico {

	@Id
	@GeneratedValue
	@Column(name = "idordemservico", type = Column.INTEGER, nullable = false, insertable = false, updatable = false, unique = true)
	private Integer idOrdemServico;
	
	@Column(name = "dataabertura", type = Column.STRING, length = 50, nullable = false)
	private String dataAbertura;
	
	@Column(name = "datafechamento", type = Column.STRING, length = 50, nullable = false)
	private String dataFechamento;
	
	@Column(name = "descricao", type = Column.STRING, length = 100, nullable = false)
	private String descricao;
	
	@Column(name = "cliente", type = Column.OBJECT, nullable = false)
	private Cliente cliente;
	
	@Column(name = "veiculo", type = Column.OBJECT, nullable = false)
	private Veiculo veiculo;
	
	@Column(name = "produto", type = Column.OBJECT, nullable = false)
	private Produto produto;
	
	@Column(name = "servico", type = Column.OBJECT, nullable = false)
	private Servico servico;
	
	@Column(name = "valorsubtotal", type = Column.FLOAT, nullable = false)
	private Float valorSubTotal;
	
	@Column(name = "valortotal", type = Column.FLOAT, nullable = false)
	private Float valorTotal;

	public Integer getIdOrdemServico() {
		return idOrdemServico;
	}

	public void setIdOrdemServico(Integer idOrdemServico) {
		this.idOrdemServico = idOrdemServico;
	}

	public String getDataAbertura() {
		return dataAbertura;
	}

	public void setDataAbertura(String dataAbertura) {
		this.dataAbertura = dataAbertura;
	}

	public String getDataFechamento() {
		return dataFechamento;
	}

	public void setDataFechamento(String dataFechamento) {
		this.dataFechamento = dataFechamento;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	public Veiculo getVeiculo() {
		return veiculo;
	}

	public void setVeiculo(Veiculo veiculo) {
		this.veiculo = veiculo;
	}

	public Produto getProduto() {
		return produto;
	}

	public void setProduto(Produto produto) {
		this.produto = produto;
	}

	public Servico getServico() {
		return servico;
	}

	public void setServico(Servico servico) {
		this.servico = servico;
	}

	public Float getValorSubTotal() {
		return valorSubTotal;
	}

	public void setValorSubTotal(Float valorSubTotal) {
		this.valorSubTotal = valorSubTotal;
	}

	public Float getValorTotal() {
		return valorTotal;
	}

	public void setValorTotal(Float valorTotal) {
		this.valorTotal = valorTotal;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		OrdemServico other = (OrdemServico) obj;
		if (cliente == null) {
			if (other.cliente != null)
				return false;
		} else if (!cliente.equals(other.cliente))
			return false;
		if (dataAbertura == null) {
			if (other.dataAbertura != null)
				return false;
		} else if (!dataAbertura.equals(other.dataAbertura))
			return false;
		if (dataFechamento == null) {
			if (other.dataFechamento != null)
				return false;
		} else if (!dataFechamento.equals(other.dataFechamento))
			return false;
		if (descricao == null) {
			if (other.descricao != null)
				return false;
		} else if (!descricao.equals(other.descricao))
			return false;
		if (idOrdemServico == null) {
			if (other.idOrdemServico != null)
				return false;
		} else if (!idOrdemServico.equals(other.idOrdemServico))
			return false;
		if (produto == null) {
			if (other.produto != null)
				return false;
		} else if (!produto.equals(other.produto))
			return false;
		if (servico == null) {
			if (other.servico != null)
				return false;
		} else if (!servico.equals(other.servico))
			return false;
		if (valorSubTotal == null) {
			if (other.valorSubTotal != null)
				return false;
		} else if (!valorSubTotal.equals(other.valorSubTotal))
			return false;
		if (valorTotal == null) {
			if (other.valorTotal != null)
				return false;
		} else if (!valorTotal.equals(other.valorTotal))
			return false;
		if (veiculo == null) {
			if (other.veiculo != null)
				return false;
		} else if (!veiculo.equals(other.veiculo))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "OrdemServico [idOrdemServico=" + this.idOrdemServico
				+ ", dataAbertura=" + this.dataAbertura + ", dataFechamento="
				+ this.dataFechamento + ", descricao=" + this.descricao + ", cliente="
				+ this.cliente + ", veiculo=" + this.veiculo + ", produto=" + this.produto
				+ ", servico=" + this.servico + ", valorSubTotal=" + this.valorSubTotal
				+ ", valorTotal=" + this.valorTotal + "]";
	} 
		
}
