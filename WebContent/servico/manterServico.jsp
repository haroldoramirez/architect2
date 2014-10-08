<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="br.udc.edu.sistemas.ia6.entity.Servico, br.udc.edu.sistemas.ia6.entity.Produto" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="./css/style.css">
<title>Manter Serviço</title>

<script type="text/javascript">

	function save() {
		document.getElementById("newAction").value = "save";
		document.getElementById("frm").submit();		
	}
	
	function add() {
		
	}
	
	function clean() {
		window.location.href = "manterServico.jsp";		
	}
	
	function remover() {
		if ((document.getElementById("idservico").value != "") && 
		    (confirm("Deseja apagar o registro?"))) {
			document.getElementById("id").value = document.getElementById("idservico").value;
			document.getElementById("newAction").value = "delete";
			document.getElementById("frm").action = "consultarServico.jsp";
			document.getElementById("frm").submit();
		}
	}
	
	function goFind() {
		document.getElementById("newAction").value = "goFind";
		document.getElementById("frm").submit();
	}
	
</script>

<%
	Servico servico = (Servico) request.getAttribute("object");
	if (servico == null) {
		servico = new Servico();
		servico.setProduto(new Produto());
	}
	Object listProduto[] = (Object[]) request.getAttribute("listProduto");
%>

</head>
<body>
	<div class="title">Manter Serviço</div>
		<form name="frm" id="frm" method="post" action="./dispatcher">
			<input type="hidden" name="newAction" id="newAction"/>
			<input type="hidden" name="entityName" id="entityName" value="Servico"/>
			<input type="hidden" name="id" id="id"/>&nbsp;
			<div class="label">Código</div>	
			<div><input class="fieldDisabled" readonly type="text" name="idservico" id="idservico" value="<%=(servico.getIdServico() == null) ? "" : servico.getIdServico()%>"/></div>
			<div class="label">Descrição</div>	
			<div><input class="field" type="text" name="descricao" id="descricao" maxlength="100" value="<%=(servico.getDescricao() == null) ? "" : servico.getDescricao()%>"/></div>
			<div class="label">Valor Hora</div>
			<div><input class="field" type="text" name="valorhora" id="valorhora" value="<%=(servico.getValorHora() == null) ? "" : servico.getValorHora()%>"/></div>&nbsp;
		<div class="label">Produto</div>		
		<div>
		<select class="field" name="produto" id="produto">
		<option value="">&nbsp;</option>
<%
	if (listProduto != null) {			
		for(int i=0; i<listProduto.length; i++) {
			Produto produto = (Produto) listProduto[i];
			boolean bSelected = servico.getProduto().getIdProduto() == produto.getIdProduto(); 
%>
				<option <%=bSelected ? "selected" : "" %> value="<%=produto.getIdProduto()%>"><%=produto.getDescricao()%></option>
<%
		}
	}
%>
			</select>
		</div>	
		<br/>
		<div class="label">Quantidade</div>
		<div><input class="field" type="text" name="quantidade" id="quantidade" maxlength="100" value="<%=(servico.getDescricao() == null) ? "" : servico.getDescricao()%>"/></div>&nbsp;
		<div>
			<input class="button" type="button" value="Adicionar" onclick="add();">
		</div>
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