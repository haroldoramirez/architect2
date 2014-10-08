<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="br.udc.edu.sistemas.ia6.entity.Produto" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="./css/style.css">
<title>Manter Produto</title>

<script type="text/javascript">

	function save() {
		document.getElementById("newAction").value = "save";
		document.getElementById("frm").submit();		
	}
	
	function clean() {
		window.location.href = "manterProduto.jsp";	
	}
	
	function remover() {
		if ((document.getElementById("idproduto").value != "") && 
		    (confirm("Deseja apagar o registro?"))) {
			document.getElementById("id").value = document.getElementById("idproduto").value;
			document.getElementById("newAction").value = "delete";
			document.getElementById("frm").action = "consultarProduto.jsp";
			document.getElementById("frm").submit();
		}
	}
	
	function goFind() {
		document.getElementById("newAction").value = "goFind";
		document.getElementById("frm").submit();
	}
	
</script>

<%
	Produto produto = (Produto) request.getAttribute("object");
	if (produto == null) {
		produto = new Produto();
	}
%>


</head>
<body>

	<div class="title">Manter Produto</div>
		<form name="frm" id="frm" method="post" action="./dispatcher">
			<input type="hidden" name="newAction" id="newAction"/>
			<input type="hidden" name="entityName" id="entityName" value="Produto"/>
			<input type="hidden" name="id" id="id"/>&nbsp;
			<div class="label">Código</div>	
			<div><input class="fieldDisabled" readonly type="text" name="idproduto" id="idproduto" value="<%=(produto.getIdProduto() == null) ? "" : produto.getIdProduto()%>"/></div>
			<div class="label">Descrição</div>	
			<div><input class="field" type="text" name="descricao" id="descricao" maxlength="100" value="<%=(produto.getDescricao() == null) ? "" : produto.getDescricao()%>"/></div>
			<div class="label">Marca</div>
			<div><input class="field" type="text" name="marca" id="marca" value="<%=(produto.getMarca() == null) ? "" : produto.getMarca()%>"/></div>
			<div class="label">Modelo</div>
			<div><input class="field" type="text" name="modelo" id="modelo" value="<%=(produto.getModelo() == null) ? "" : produto.getModelo()%>"/></div>
			<div class="label">Quantidade</div>
			<div><input class="field" type="text" name="quantidade" id="quantidade" value="<%=(produto.getQuantidade() == null) ? "" : produto.getQuantidade()%>"/></div>
			<div class="label">Valor $</div>
			<div><input class="field" type="text" name="valor" id="valor" value="<%=(produto.getValor() == null) ? "" : produto.getValor()%>"/></div>
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