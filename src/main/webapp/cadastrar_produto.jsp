<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro de Produto</title>
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

        .product-form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-top: 10px;
        }

        input, textarea {
            margin-bottom: 15px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"] {
            background-color: #4caf50;
            color: #fff;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Cadastro de Produto</h2>
        <form action="" class="product-form">
            <label for="nome">Nome:</label>
            <input type="text" id="nome" name="nome" required>

            <label for="descricao">Descrição:</label>
            <textarea id="descricao" name="descricao" rows="4" required></textarea>

            <label for="preco">Preço:</label>
            <input type="number" id="preco" name="preco" step="0.01" required>

            <label for="quantidade">Quantidade em Estoque:</label>
            <input type="number" id="quantidade" name="quantidade" required>

            <input type="submit" value="Cadastrar Produto">
        </form>
    </div>

</body>
</html>
