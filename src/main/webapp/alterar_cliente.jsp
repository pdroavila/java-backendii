<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Detalhes do Cliente</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        h1 {
            color: #333;
        }

        table {
            width: 50%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        input[type="text"] {
            width: 100%;
            padding: 8px;
            margin: 5px 0 22px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        form{
            display: flex; 
            flex-direction: column; 
            align-items: center;
            width: 100%;
        }

        h1{
            text-align: center;
        }

        input[type="submit"], button {
            background-color: #4caf50;
            color: #fff;
            cursor: pointer;
            margin-bottom: 15px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-top: 10px;
        }

    </style>
</head>
<body>

<%
    Integer idObject = (Integer) request.getAttribute("id");
    int id = (idObject != null) ? idObject.intValue() : 0;
    String nome = (String) request.getAttribute("nome");
    String contato = (String) request.getAttribute("contato");
    String endereco = (String) request.getAttribute("endereco");
    String mensagem = (String) request.getAttribute("message"); 
%>

<h1>Detalhes do Cliente</h1>
<form action="mvc?a=AlterarCliente&id=<%= id %>" method="post">
    <table>
        <tr>
            <th>ID</th>
            <td><%= id %></td>
        </tr>
        <tr>
            <th>Nome</th>
            <td><input type="text" name="nome" value="<%= nome != null ? nome : "" %>"></td>
        </tr>
        <tr>
            <th>Contato</th>
            <td><input type="text" name="contato" value="<%= contato != null ? contato : "" %>"></td>
        </tr>
        <tr>
            <th>Endereço</th>
            <td><input type="text" name="endereco" value="<%= endereco != null ? endereco : "" %>"></td>
        </tr>
    </table>
    <input type="submit" value="Atualizar Cliente"/>
    <p> 
        <%= mensagem != null ? mensagem : "" %>
    </p>
</form>
    <button onclick="window.location.href = 'mvc?a=ListarClientes'">Voltar</button>
</body>
</html>
