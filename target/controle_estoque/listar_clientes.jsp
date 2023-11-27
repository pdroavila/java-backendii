<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Cliente" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Lista de Clientes</title>
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
            display: flex;
            flex-direction:column;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
        }

        th {
            background-color: #4caf50;
            color: #fff;
        }

        tr:hover {
            background-color: #f5f5f5;
        }

        i{
            cursor: pointer;
        }

        button {
            margin-bottom: 15px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            background-color: #4caf50;
            color: #fff;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }
</style>
</head>
<body>

    <div class="container">
        <h2>Lista de Clientes</h2>
        <button onclick="window.location.href = 'mvc?a=Home'">Voltar</button>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Contato</th>
                    <th>Endereço</th>
                    <th>Editar</th>
                    <th>Excluir</th>
                </tr>
            </thead>
            <tbody>
               <% 
                    ArrayList<Cliente> listaClientes = (ArrayList<Cliente>) request.getAttribute("listaClientes");
                    for (Cliente cliente : listaClientes) {
                %>
                    <tr>
                        <td><%= cliente.getId() %></td>
                        <td><%= cliente.getNome() %></td>
                        <td><%= cliente.getContato() %></td>
                        <td><%= cliente.getEndereco() %></td>
                        <td onclick="window.location.href = 'mvc?a=AlterarCliente&id=<%= cliente.getId() %>'"><i class="fa-solid fa-user-pen"></i></td>
                        <td onclick="window.location.href = 'mvc?a=ExcluirCliente&id=<%= cliente.getId() %>'"><i class="fa-solid fa-trash"></i></td>
                    </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>

</body>
</html>
