<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="br.udc.edu.sistemas.ia6.entity.Cliente" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="./css/style.css">
<title>Manter Cliente</title>

<script type="text/javascript">

	function save() {
		document.getElementById("newAction").value = "save";
		document.getElementById("frm").submit();		
	}
	
	function clean() {
		window.location.href = "manterCliente.jsp";		
	}
	
	function remover() {
		if ((document.getElementById("idcliente").value != "") && 
		    (confirm("Deseja apagar o registro?"))) {
			document.getElementById("id").value = document.getElementById("idcliente").value;
			document.getElementById("newAction").value = "delete";
			document.getElementById("frm").action = "consultarCliente.jsp";
			document.getElementById("frm").submit();
		}
	}
	
	function goFind() {
		document.getElementById("newAction").value = "goFind";
		document.getElementById("frm").submit();
	}
	
</script>

<%
	Cliente cliente = (Cliente) request.getAttribute("object");
	if (cliente == null) {
		cliente = new Cliente();
	}
%>

</head>

<body>
	<div class="title">Manter Cliente</div>
	<form name="frm" id="frm" method="post" action="./dispatcher">
		<input type="hidden" name="newAction" id="newAction"/>
		<input type="hidden" name="entityName" id="entityName" value="Cliente"/>
		<input type="hidden" name="id" id="id"/>&nbsp;
		<div class="label">Código</div>	
		<div><input class="fieldDisabled" readonly type="text" name="idcliente" id="idcliente" value="<%=(cliente.getIdCliente() == null) ? "" : cliente.getIdCliente()%>"/></div>
		<div class="label">Nome</div>	
		<div><input class="field" type="text" name="nome" id="nome" maxlength="100" value="<%=(cliente.getNome() == null) ? "" : cliente.getNome()%>"/></div>
		<div class="label">RG</div>
		<div><input class="field" type="text" name="rg" id="rg" maxlength="18" value="<%=(cliente.getRg() == null) ? "" : cliente.getRg()%>"/></div>
		<div class="label">CPF</div>
		<div><input class="field" type="text" name="cpf" id="cpf" maxlength="25" value="<%=(cliente.getCpf() == null) ? "" : cliente.getCpf()%>"/></div>
		<div class="label">Endereço</div>
		<div><input class="field" type="text" name="endereco" id="endereco" maxlength="400" value="<%=(cliente.getEndereco() == null) ? "" : cliente.getEndereco()%>"/></div>
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