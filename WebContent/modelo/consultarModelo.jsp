<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="br.udc.edu.sistemas.ia6.entity.Modelo,br.udc.edu.sistemas.ia6.entity.Marca"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="./css/style.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Consultar Modelo</title>

<script type="text/javascript">

	function find() {
		document.getElementById("newAction").value = "find";
		document.getElementById("frm").submit();		
	}
	
	function clean() {
		document.getElementById("newAction").value = "goFind";
		document.getElementById("frm").submit();
	}
	
	function deleteList(id) {
		if (confirm("Deseja apagar o registro?")) {
			document.getElementById("id").value = id;
			document.getElementById("newAction").value = "deleteList";
			document.getElementById("frm").submit();
		}		
	}
	
	function detail(id) {
		document.getElementById("id").value = id;
		document.getElementById("newAction").value = "detail";
		document.getElementById("frm").submit();
	}
	
	function goNew() {
		document.getElementById("newAction").value = "goNew";
		document.getElementById("frm").submit();
	}
	
</script>

<%
	Modelo modeloFilter = (Modelo) request.getSession().getAttribute("filterModelo");
	if (modeloFilter == null) {
		modeloFilter = new Modelo();
		modeloFilter.setMarca(new Marca());
	} else if (modeloFilter.getMarca() == null) {
		modeloFilter.setMarca(new Marca());
	}
	Object list[] = (Object[]) request.getAttribute("list");
%>

</head>
<body>
	<div class="title">Consultar Modelo</div>
	<Form name="frm" id="frm" method="post" action="./dispatcher">
		<input type="hidden" name="newAction" id="newAction"/>
		<input type="hidden" name="entityName" id="entityName" value="Modelo"/>
		<input type="hidden" name="id" id="id"/>&nbsp;
		<div class="label">Modelo:</div>
		<div><input class="field" type="text" name="descricao" id="descricao" maxlength="100" value="<%=(modeloFilter.getDescricao() != null) ? modeloFilter.getDescricao() : ""%>"/></div>
		<br/>
		<div>
			<input class="button" type="button" value="Consultar" onclick="find();">
			<input class="button" type="button" value="Limpar" onclick="clean();">
			<input class="button" type="button" value="Novo" onclick="goNew();">
		</div>
		<br/>
		<div>
			<table class="table" cellspacing="0" cellpadding="0">
				<tr>
					<th style="width:50px;">Código</th>
					<th style="width:350px;">Modelo</th>
					<th style="width:330px;">Marca</th>
					<th></th>
				</tr>			
<%
	if (list != null) {			
		for(int i=0; i<list.length; i++) {
			Modelo modeloAux = (Modelo) list[i];
%>	
				<tr>
					<td><%=modeloAux.getIdModelo()%></td>
					<td><%=modeloAux.getDescricao()%></td>
					<td><%=modeloAux.getMarca().getDescricao()%></td>
					<td style="text-align:center;">
						<a class="link" href="javascript:detail(<%=modeloAux.getIdModelo()%>);"><img src="./img/edit.png"></a>&nbsp;
						<a class="link" href="javascript:detelelist(<%=modeloAux.getIdModelo()%>);"><img src="./img/delete.png"></a>
					</td>
				</tr>
<%
		}
	}
%>		
			</table>
		</div>
	</Form>
</body>
</html>