<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="br.udc.edu.sistemas.ia6.entity.Veiculo,br.udc.edu.sistemas.ia6.entity.Modelo,br.udc.edu.sistemas.ia6.entity.Cliente"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="./css/style.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Consultar Veículo</title>

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
	Veiculo veiculoFilter = (Veiculo) request.getSession().getAttribute("filterVeiculo");
	if (veiculoFilter == null) {
		veiculoFilter = new Veiculo();
		veiculoFilter.setModelo(new Modelo());
		veiculoFilter.setCliente(new Cliente());
	} else if (veiculoFilter.getModelo() == null) {
		veiculoFilter.setModelo(new Modelo());
	} else if (veiculoFilter.getCliente() == null) {
		veiculoFilter.setCliente(new Cliente());
	}
	
	Object list[] = (Object[]) request.getAttribute("list");
	Object listModelo[] = (Object[]) request.getAttribute("listModelo");
	Object listCliente[] = (Object[]) request.getAttribute("listCliente");
%>

</head>
<body>
<div class="title">Consultar Veículo</div>
	<form name="frm" id="frm" method="post" action="./dispatcher">
		<input type="hidden" name="newAction" id="newAction"/>
		<input type="hidden" name="entityName" id="entityName" value="Veiculo"/>
		<input type="hidden" name="id" id="id"/>&nbsp;
		<div class="label">Chassi:</div>
		<div><input class="field" type="text" name="chassi" id="chassi" maxlength="100" value="<%=(veiculoFilter.getChassi() != null) ? veiculoFilter.getChassi() : ""%>"/></div>&nbsp;
		<div class="label">Modelo:</div>			
		<div>
		<select class="field" name="modelo" id="modelo">
			<option value="">&nbsp;</option>
<%
			if (listModelo != null) {			
				for(int i=0; i<listModelo.length; i++) {
					Modelo modelo = (Modelo) listModelo[i];
					boolean bSelected = veiculoFilter.getModelo().getIdModelo() == modelo.getIdModelo(); 
%>
			<option <%=bSelected ? "selected" : "" %> value="<%=modelo.getIdModelo()%>"><%=modelo.getDescricao()%></option>
<%
				}
			}
%>
		</select>
		</div>
		<br/>
		<div class="label">Cliente:</div>			
		<div>
		<select class="field" name="cliente" id="cliente">
			<option value="">&nbsp;</option>
<%
			if (listCliente != null) {			
				for(int i=0; i<listCliente.length; i++) {
					Cliente cliente = (Cliente) listCliente[i];
					boolean bSelected = veiculoFilter.getCliente().getIdCliente() == cliente.getIdCliente(); 
%>
			<option <%=bSelected ? "selected" : "" %> value="<%=cliente.getIdCliente()%>"><%=cliente.getNome()%></option>
<%
				}
			}
%>
		</select>
		</div>
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
					<th style="width:90px;">Placa</th>
					<th style="width:385px;">Chassi</th>
					<th style="width:100px;">Modelo</th>
					<th style="width:100px;">Cliente</th>
					<th></th>
				</tr>
<%
	if (list != null) {			
		for(int i=0; i<list.length; i++) {
			Veiculo veiculoAux = (Veiculo) list[i];
%>
				<tr>
					<td><%=veiculoAux.getIdVeiculo()%></td>
					<td><%=veiculoAux.getPlaca()%></td>
					<td><%=veiculoAux.getChassi()%></td>
					<td><%=veiculoAux.getModelo().getDescricao()%></td>
					<td><%=veiculoAux.getCliente().getNome()%></td>
					<td style="text-align:center;">
						<a class="link" href="javascript:detail(<%=veiculoAux.getIdVeiculo()%>);"><img src="./img/edit.png"></a>&nbsp;
						<a class="link" href="javascript:deleteList(<%=veiculoAux.getIdVeiculo()%>);"><img src="./img/delete.png"></a>
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