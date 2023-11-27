<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro de Cliente</title>
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
        }

        h2 {
            text-align: center;
        }

        .customer-form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-top: 10px;
        }

        input, textarea, button {
            margin-bottom: 15px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"], button {
            background-color: #4caf50;
            color: #fff;
            cursor: pointer;
        }

        input[type="submit"]:hover, button:hover {
            background-color: #45a049;
        }

        p{
            margin: 0px;
            font-size: 12px;            
        }
    </style>
</head>
<body>
  <% String mensagem = (String) request.getAttribute("message"); %>
    <div class="container">
        <h2>Cadastro de Cliente</h2>
        <form action="" class="customer-form" method="post">
            <label for="nome">Nome:</label>
            <input type="text" id="nome" name="nome" required>

            <label for="contato">Contato:</label>
            <input type="text" id="contato" name="contato" required>

            <label for="endereco">Endereço:</label>
            <textarea id="endereco" name="endereco" rows="4" required></textarea>

            <input type="submit" value="Cadastrar Cliente">
            <button onclick="window.location.href = 'mvc?a=Home'">Voltar</button>
            <p>
                <%= mensagem != null ? mensagem : "" %>
            </p>
        </form>
    </div>

</body>
</html>
