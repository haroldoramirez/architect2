<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="br.udc.edu.sistemas.ia6.entity.Marca" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="./css/style.css">
<title>Manter Marca</title>

<script type="text/javascript">

	function save() {
		document.getElementById("newAction").value = "save";
		document.getElementById("frm").submit();		
	}

	function clean() {
		window.location.href = "manterMarca.jsp";		
	}
	
	function remover() {
		if ((document.getElementById("idmarca").value != "") && 
		    (confirm("Deseja apagar o registro?"))) {
			document.getElementById("id").value = document.getElementById("idmarca").value;
			document.getElementById("newAction").value = "delete";
			document.getElementById("frm").action = "consultarMarca.jsp";
			document.getElementById("frm").submit();
		}
	}
	
	function goFind() {
		document.getElementById("newAction").value = "goFind";
		document.getElementById("frm").submit();
	}
	
</script>

<%
	Marca marca = (Marca) request.getAttribute("object");
	if (marca == null) {
		marca = new Marca();
	}
%>

</head>
<body>
	<div class="title">Manter Marca</div>
	<form name="frm" id="frm" method="post" action="./dispatcher">
		<input type="hidden" name="newAction" id="newAction"/>
		<input type="hidden" name="entityName" id="entityName" value="Marca"/>
		<input type="hidden" name="id" id="id"/>&nbsp;
		<div class="label">Código</div>	
		<div><input class="fieldDisabled" readonly type="text" name="idmarca" id="idmarca" value="<%=(marca.getIdMarca() == null) ? "" : marca.getIdMarca()%>"/></div>
		<div class="label">Marca</div>	
		<div><input class="field" type="text" name="descricao" id="descricao" maxlength="100" value="<%=(marca.getDescricao() == null) ? "" : marca.getDescricao()%>"/></div>
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