<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="br.udc.edu.sistemas.ia6.entity.Cliente"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="./css/style.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Consultar Cliente</title>

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
	Cliente clienteFilter = (Cliente) request.getSession().getAttribute("filterCliente");
	if (clienteFilter == null) {
		clienteFilter = new Cliente();
	}
	Object list[] = (Object[]) request.getAttribute("list");
%>

</head>
<body>
<div class="title">Consultar Cliente</div>
	<form name="frm" id="frm" method="post" action="./dispatcher">
		<input type="hidden" name="newAction" id="newAction"/>
		<input type="hidden" name="entityName" id="entityName" value="Cliente"/>
		<input type="hidden" name="id" id="id"/>&nbsp;
		<div class="label">Cliente:</div>	
		<div><input class="field" type="text" name="nome" id="nome" maxlength="100" value=""/></div>
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
					<th style="width:165px;">Nome</th>
					<th style="width:135px;">RG</th>
					<th style="width:155px;">CPF</th>
					<th style="width:220px;">Endereço</th>
					<th></th>
				</tr>
<%
	if (list != null) {			
		for(int i=0; i<list.length; i++) {
			Cliente clienteAux = (Cliente) list[i];
%>
				<tr>
					<td><%=clienteAux.getIdCliente()%></td>
					<td><%=clienteAux.getNome()%></td>
					<td><%=clienteAux.getRg()%></td>
					<td><%=clienteAux.getCpf()%></td>
					<td><%=clienteAux.getEndereco()%></td>
					<td style="text-align:center;">
						<a class="link" href="javascript:detail(<%=clienteAux.getIdCliente()%>);"><img src="./img/edit.png"></a>&nbsp;
						<a class="link" href="javascript:deleteList(<%=clienteAux.getIdCliente()%>);"><img src="./img/delete.png"></a>
					</td>
				</tr>

<%
		}
	}
%>
			</table>
		</div>		
	</form>

</body>
</html>