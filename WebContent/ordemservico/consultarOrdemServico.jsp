<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="br.udc.edu.sistemas.ia6.entity.OrdemServico"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="./css/style.css">
<title>Consultar Ordem de Serviço</title>

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
	Object list[] = (Object[]) request.getAttribute("list");
%>

</head>
<body>

	<div class="title">Consultar Ordem de Serviço</div>
	<form name="frm" id="frm" method="post" action="./dispatcher">
		<input type="hidden" name="newAction" id="newAction"/>
		<input type="hidden" name="entityName" id="entityName" value="OrdemServico"/>
		<input type="hidden" name="id" id="id"/>&nbsp;
		<div class="label">Ordem de Serviço:</div>	
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
					<th style="width:80px;">Código</th>
					<th style="width:80px;">Descrição</th>
					<th style="width:80px;">Data Abertura</th>
					<th style="width:80px;">Data Fechamento</th>
					<th style="width:80px;">Cliente</th>
					<th style="width:80px;">Veículo</th>
					<th style="width:80px;">Produto</th>
					<th style="width:80px;">Serviço</th>
					<th style="width:80px;">Valor SubTotal</th>
					<th style="width:80px;">Valor Total</th>
					<th></th>
				</tr>
<%
	if (list != null) {			
		for(int i=0; i<list.length; i++) {
			OrdemServico ordemServicoAux = (OrdemServico) list[i];
%>
				<tr>
					<td><%=ordemServicoAux.getIdOrdemServico()%></td>
					<td><%=ordemServicoAux.getDescricao()%></td>
					<td><%=ordemServicoAux.getDataAbertura()%></td>
					<td><%=ordemServicoAux.getDataFechamento()%></td>
					<td><%=ordemServicoAux.getCliente()%></td>
					<td><%=ordemServicoAux.getProduto()%></td>
					<td><%=ordemServicoAux.getServico()%></td>
					<td><%=ordemServicoAux.getValorSubTotal()%></td>
					<td><%=ordemServicoAux.getValorTotal()%></td>
					<td style="text-align:center;">
						<a class="link" href="javascript:detail(<%=ordemServicoAux.getIdOrdemServico()%>);"><img src="./img/edit.png"></a>&nbsp;
						<a class="link" href="javascript:deleteList(<%=ordemServicoAux.getIdOrdemServico()%>);"><img src="./img/delete.png"></a>
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