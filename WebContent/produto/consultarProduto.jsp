<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="br.udc.edu.sistemas.ia6.entity.Produto"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="./css/style.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Consultar Produto</title>

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
	Produto produtoFilter = (Produto) request.getSession().getAttribute("filterProduto");
	if (produtoFilter == null) {
		produtoFilter = new Produto();
	}
	Object list[] = (Object[]) request.getAttribute("list");
%>

</head>
<body>
	<div class="title">Consultar Produto</div>
	<form name="frm" id="frm" method="post" action="./dispatcher">
		<input type="hidden" name="newAction" id="newAction"/>
		<input type="hidden" name="entityName" id="entityName" value="Produto"/>
		<input type="hidden" name="id" id="id"/>&nbsp;
		<div class="label">Produto:</div>	
		<div><input class="field" type="text" name="descricao" id="descricao" maxlength="100" value=""/></div>
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
					<th style="width:150px;">Descrição</th>
					<th style="width:135px;">Marca</th>
					<th style="width:135px;">Modelo</th>
					<th style="width:120px;">Quantidade</th>
					<th style="width:135px;">Valor $</th>
					<th></th>
				</tr>
<%
	if (list != null) {			
		for(int i=0; i<list.length; i++) {
			Produto produtoAux = (Produto) list[i];
%>
				<tr>
					<td><%=produtoAux.getIdProduto()%></td>
					<td><%=produtoAux.getDescricao()%></td>
					<td><%=produtoAux.getMarca()%></td>
					<td><%=produtoAux.getModelo()%></td>
					<td><%=produtoAux.getQuantidade()%></td>
					<td><%=produtoAux.getValor()%></td>
					<td style="text-align:center;">
						<a class="link" href="javascript:detail(<%=produtoAux.getIdProduto()%>);"><img src="./img/edit.png"></a>&nbsp;
						<a class="link" href="javascript:deleteList(<%=produtoAux.getIdProduto()%>);"><img src="./img/delete.png"></a>
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