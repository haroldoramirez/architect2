<script type='text/javascript'>
	function execute(entityName, newAction) {
		document.getElementById('newAction').value = newAction;
		document.getElementById('entityName').value = entityName;
		document.getElementById('form').submit();
	}
</script>

<link rel="stylesheet" type="text/css" href="./css/style.css">
<form name="form" id="form" action="./dispatcher" method="post" target="main">
	<input type="hidden" name="newAction" id="newAction">
	<input type="hidden" name="entityName" id="entityName">
</form>

<div class="pure-menu">
    <a class="pure-menu-heading">MENU</a>
    <ul>
        <li><a href="javascript:execute('Marca','goFind');">Marca</a></li>
        <li><a href="javascript:execute('Modelo','goFind');">Modelo</a></li>
        <li><a href="javascript:execute('Veiculo','goFind');">Veículo</a></li>
        <li><a href="javascript:execute('Cliente','goFind');">Cliente</a></li>
        <li><a href="javascript:execute('Produto','goFind');">Produto</a></li>
        <li><a href="javascript:execute('Servico','goFind');">Serviço</a></li>
        <li><a href="javascript:execute('OrdemServico','goFind');">Ordem de Serviço</a></li>
        <li><a href="">Sair</a></li>
    </ul>
</div>