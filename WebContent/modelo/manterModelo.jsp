<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="br.udc.edu.sistemas.ia6.entity.Modelo,br.udc.edu.sistemas.ia6.entity.Marca" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="./css/style.css">
<title>Consultar Modelo</title>

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
		if ((document.getElementById("idmodelo").value != "") && 
		    (confirm("Deseja apagar o registro?"))) {
			document.getElementById("id").value = document.getElementById("idmodelo").value;
			document.getElementById("newAction").value = "delete";
			document.getElementById("frm").submit();
		}
	}
	
	function goFind() {
		document.getElementById("newAction").value = "goFind";
		document.getElementById("frm").submit();
	}
	
</script>

<%
	Modelo modelo = (Modelo) request.getAttribute("object");
	if (modelo == null) {
		modelo = new Modelo();
		modelo.setMarca(new Marca());
	}
	Object listMarca[] = (Object[]) request.getAttribute("listMarca");
%>

</head>
<body>
	<div class="title">Manter Modelo</div>
	<form name="frm" id="frm" method="post" action="./dispatcher">
		<input type="hidden" name="newAction" id="newAction"/>
		<input type="hidden" name="entityName" id="entityName" value="Modelo"/>
		<input type="hidden" name="id" id="id"/>
		<div class="label">Código</div>	
		<div><input class="fieldDisabled" readonly type="text" name="idmodelo" id="idmodelo" value="<%=(modelo.getIdModelo() == null) ? "" : modelo.getIdModelo()%>"/></div>
		<div class="label">Modelo</div>	
		<div><input class="field" type="text" name="descricao" id="descricao" maxlength="100" value="<%=(modelo.getDescricao() == null) ? "" : modelo.getDescricao()%>"/></div>
		<div class="label">Marca</div>			
		<div>
			<select class="field" name="marca" id="marca">
				<option value="">&nbsp;</option>
<%
	if (listMarca != null) {			
		for(int i=0; i<listMarca.length; i++) {
			Marca marca = (Marca) listMarca[i];
			boolean bSelected = modelo.getMarca().getIdMarca() == marca.getIdMarca(); 
%>
				<option <%=bSelected ? "selected" : "" %> value="<%=marca.getIdMarca()%>"><%=marca.getDescricao()%></option>
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