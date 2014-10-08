<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="br.udc.edu.sistemas.ia6.entity.OrdemServico, br.udc.edu.sistemas.ia6.entity.Cliente, br.udc.edu.sistemas.ia6.entity.Veiculo, br.udc.edu.sistemas.ia6.entity.Produto, br.udc.edu.sistemas.ia6.entity.Servico" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="./css/style.css">
<title>Manter Ordem de Serviço</title>

<script type="text/javascript">
	
	function save() {
		document.getElementById("newAction").value = "save";
		document.getElementById("frm").submit();		
	}
	
	function clean() {
		document.getElementById("newAction").value = "goNew";
		document.getElementById("frm").submit();		
	}
	
	function remover() {
		if ((document.getElementById("idordemservico").value != "") && 
		    (confirm("Deseja apagar o registro?"))) {
			document.getElementById("id").value = document.getElementById("idordemservico").value;
			document.getElementById("newAction").value = "delete";
			document.getElementById("frm").action = "consultarOrdemServico.jsp";
			document.getElementById("frm").submit();
		}
	}
	
	function goFind() {
		document.getElementById("newAction").value = "goFind";
		document.getElementById("frm").submit();
	}
	
</script>

<%
	OrdemServico ordemServico = (OrdemServico) request.getAttribute("object");
	if (ordemServico == null) {
		ordemServico = new OrdemServico();
		ordemServico.setCliente(new Cliente());
		ordemServico.setVeiculo(new Veiculo());
		ordemServico.setProduto(new Produto());
		ordemServico.setServico(new Servico());
	}
	Object listCliente[] = (Object[]) request.getAttribute("listCliente");
	Object listVeiculo[] = (Object[]) request.getAttribute("listVeiculo");
	Object listProduto[] = (Object[]) request.getAttribute("listProduto");
	Object listServico[] = (Object[]) request.getAttribute("listServico");
%>

</head>
<body>

<div class="title">Manter Ordem de Serviço</div>
	<form name="frm" id="frm" method="post" action="./dispatcher">
		<input type="hidden" name="newAction" id="newAction"/>
		<input type="hidden" name="entityName" id="entityName" value="OrdemServico"/>
		<input type="hidden" name="id" id="id"/>&nbsp;
		<div class="label">Código</div>	
		<div><input class="fieldDisabled" readonly type="text" name="idordemservico" id="idordemservico" value="<%=(ordemServico.getIdOrdemServico() == null) ? "" : ordemServico.getIdOrdemServico()%>"/></div>
		<div class="label">Data de Abertura</div>	
		<div><input class="field" type="text" name="dataabertura" id="dataabertura" maxlength="50" value="<%=(ordemServico.getDataAbertura() == null) ? "" : ordemServico.getDataAbertura()%>"/></div>
		<div class="label">Data de Fechamento</div>	
		<div><input class="field" type="text" name="datafechamento" id="datafechamento" maxlength="50" value="<%=(ordemServico.getDataFechamento() == null) ? "" : ordemServico.getDataFechamento()%>"/></div>
		<div class="label">Descrição</div>
		<div><input class="field" type="text" name="descricao" id="descricao" maxlength="100" value="<%=(ordemServico.getDescricao() == null) ? "" : ordemServico.getDescricao()%>"/></div>&nbsp;
		<div class="label">Cliente</div>		
		<div>
			<select class="field" name="cliente" id="cliente">
				<option value="">&nbsp;</option>
<%
	if (listCliente != null) {			
		for(int i=0; i<listCliente.length; i++) {
			Cliente cliente = (Cliente) listCliente[i];
			boolean bSelected = ordemServico.getCliente().getIdCliente() == cliente.getIdCliente(); 
%>
				<option <%=bSelected ? "selected" : "" %> value="<%=cliente.getIdCliente()%>"><%=cliente.getNome()%></option>
<%
		}
	}
%>
			</select>
		</div>	
		<div class="label">Veículo</div>		
		<div>
			<select class="field" name="veiculo" id="veiculo">
				<option value="">&nbsp;</option>
<%
	if (listVeiculo != null) {			
		for(int i=0; i<listVeiculo.length; i++) {
			Veiculo veiculo = (Veiculo) listVeiculo[i];
			boolean bSelected = ordemServico.getVeiculo().getIdVeiculo() == veiculo.getIdVeiculo(); 
%>
				<option <%=bSelected ? "selected" : "" %> value="<%=veiculo.getIdVeiculo()%>"><%=veiculo.getModelo().getDescricao()%></option>
<%
		}
	}
%>
			</select>
		</div>	
		<div class="label">Produto</div>		
		<div>
			<select class="field" name="produto" id="produto">
				<option value="">&nbsp;</option>
<%
	if (listProduto != null) {			
		for(int i=0; i<listProduto.length; i++) {
			Produto produto = (Produto) listProduto[i];
			boolean bSelected = ordemServico.getProduto().getIdProduto() == produto.getIdProduto(); 
%>
				<option <%=bSelected ? "selected" : "" %> value="<%=produto.getIdProduto()%>"><%=produto.getDescricao()%></option>
<%
		}
	}
%>
			</select>
		</div>	
				<div class="label">Serviço</div>		
		<div>
			<select class="field" name="servico" id="servico">
				<option value="">&nbsp;</option>
<%
	if (listServico != null) {			
		for(int i=0; i<listServico.length; i++) {
			Servico servico = (Servico) listServico[i];
			boolean bSelected = ordemServico.getServico().getIdServico() == servico.getIdServico(); 
%>
				<option <%=bSelected ? "selected" : "" %> value="<%=servico.getIdServico()%>"><%=servico.getIdServico()%></option>
<%
		}
	}
%>
			</select>
		</div>	
		<br/>
		<div>
			<input class="button" type="button" value="Salvar" onclick="save();">
			<input class="button" type="button" value="Limpar" onclick="clean();">
			<input class="button" type="button" value="Excluir" onclick="remover();">
			<input class="button" type="button" value="Voltar" onclick="goFind();">
		</div>
		<br/>
	</form>

</body>
</html>