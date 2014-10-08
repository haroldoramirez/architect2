<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="br.udc.edu.sistemas.ia6.entity.Veiculo, br.udc.edu.sistemas.ia6.entity.Modelo, br.udc.edu.sistemas.ia6.entity.Cliente" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="./css/style.css">
<title>Manter Veículo</title>

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
		if ((document.getElementById("idveiculo").value != "") && 
		    (confirm("Deseja apagar o registro?"))) {
			document.getElementById("id").value = document.getElementById("idveiculo").value;
			document.getElementById("newAction").value = "delete";
			document.getElementById("frm").action = "consultarVeiculo.jsp";
			document.getElementById("frm").submit();
		}
	}
	
	function goFind() {
		document.getElementById("newAction").value = "goFind";
		document.getElementById("frm").submit();
	}
	
</script>

<%
	Veiculo veiculo = (Veiculo) request.getAttribute("object");
	if (veiculo == null) {
		veiculo = new Veiculo();
		veiculo.setModelo(new Modelo());
		veiculo.setCliente(new Cliente());
	}
	Object listModelo[] = (Object[]) request.getAttribute("listModelo");
	Object listCliente[] = (Object[]) request.getAttribute("listCliente");
%>

</head>
<body>
	<div class="title">Manter Veículo</div>
	<form name="frm" id="frm" method="post" action="./dispatcher">
		<input type="hidden" name="newAction" id="newAction"/>
		<input type="hidden" name="entityName" id="entityName" value="Veiculo"/>
		<input type="hidden" name="id" id="id"/>&nbsp;
		<div class="label">Código</div>	
		<div><input class="fieldDisabled" readonly type="text" name="idveiculo" id="idveiculo" value="<%=(veiculo.getIdVeiculo() == null) ? "" : veiculo.getIdVeiculo()%>"/></div>
		<div class="label">Placa</div>	
		<div><input class="field" type="text" name="placa" id="placa" maxlength="15" value="<%=(veiculo.getPlaca() == null) ? "" : veiculo.getPlaca()%>"/></div>
		<div class="label">Chassi</div>	
		<div><input class="field" type="text" name="chassi" id="chassi" maxlength="100" value="<%=(veiculo.getChassi() == null) ? "" : veiculo.getChassi()%>"/></div>
		<div class="label">Cliente</div>		
		<div>
			<select class="field" name="cliente" id="cliente">
				<option value="">&nbsp;</option>
<%
	if (listCliente != null) {			
		for(int i=0; i<listCliente.length; i++) {
			Cliente cliente = (Cliente) listCliente[i];
			boolean bSelected = veiculo.getCliente().getIdCliente() == cliente.getIdCliente(); 
%>
				<option <%=bSelected ? "selected" : "" %> value="<%=cliente.getIdCliente()%>"><%=cliente.getNome()%></option>
<%
		}
	}
%>
			</select>
		</div>	
		<div class="label">Modelo</div>		
		<div>
			<select class="field" name="modelo" id="modelo">
				<option value="">&nbsp;</option>
<%
	if (listModelo != null) {			
		for(int i=0; i<listModelo.length; i++) {
			Modelo modelo = (Modelo) listModelo[i];
			boolean bSelected = veiculo.getModelo().getIdModelo() == modelo.getIdModelo(); 
%>
				<option <%=bSelected ? "selected" : "" %> value="<%=modelo.getIdModelo()%>"><%=modelo.getDescricao()%></option>
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