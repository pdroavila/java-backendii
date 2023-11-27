<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            justify-content: center;
            flex-direction: column;
        }

        .section {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin: 10px;
            border-radius: 4px;
            padding: 10px;
            gap: 10px;
        }

        button {
            padding: 10px;
            background-color: #4caf50;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }

        #sair{
            background-color: indianred;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="section">
            <button onclick="window.location.href = 'mvc?a=CadastrarCliente'">Cadastrar Cliente</button>
            <button onclick="window.location.href = 'mvc?a=ListarClientes'">Listar Clientes</button>
        </div>

        <div class="section">
            <button onclick="window.location.href = 'mvc?a=CadastrarProduto'">Cadastrar Produto</button>
            <button onclick="window.location.href = 'mvc?a=ListarProdutos'">Listar Produtos</button>
        </div>

        <div class="section">
            <button onclick="window.location.href = 'mvc?a=CadastrarPedido'">Cadastrar Pedido</button>
            <button onclick="window.location.href = 'mvc?a=ListarPedidos'">Listar Pedidos</button>
        </div>
        
        <div class="section">
            <button id="sair" onclick="window.location.href = 'mvc?a=Sair'">Sair</button>
        </div>
    </div>
</body>
</html>