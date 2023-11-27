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
    </style>
</head>
<body>

<%-- <%
    // int id = request.getAttribute("id");
    // String nome = request.getAttribute("nome");
    // String contato = request.getAttribute("contato");
    // String endereco = request.getAttribute("endereco");
%> --%>

<h1>Detalhes do Cliente</h1>
<form action="/atualizarCliente" method="post">
    <table>
        <tr>
            <th>ID</th>
            <%-- <td><%= id != null ? id : "" %></td> --%>
        </tr>
        <tr>
            <th>Nome</th>
            <%-- <td><input type="text" name="nome" value="<td><%= nome != null ? nome : "" %></td>"></td> --%>
        </tr>
        <tr>
            <th>Contato</th>
            <%-- <td><input type="text" name="contato" value="<%= contato != null ? contato : "" %>"></td> --%>
        </tr>
        <tr>
            <th>Endereço</th>
            <%-- <td><input type="text" name="endereco" value="<%= endereco != null ? endereco : "" %>"></td> --%>
        </tr>
    </table>
    <button type="submit">Atualizar Cliente</button>
</form>

</body>
</html>
