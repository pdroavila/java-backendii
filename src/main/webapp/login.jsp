<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
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

        form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        input {
            margin-bottom: 15px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"] {
            background-color: #4caf50;
            color: #fff;
            cursor: pointer;
            width: 100%
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
        #erro{
            margin: 0px;
            color: red;
            font-size: 12px;
        }
    </style>
</head>
<body>
  <% String mensagem = (String) request.getAttribute("message"); %>
    <div class="container">
        <form action="" method="post">
            <input type="text" name="usuario" id="usuario" placeholder="Usuario">
            <input type="password" name="senha" id="senha" placeholder="Senha">
            <input type="submit" value="Enviar">
            <div>
                <p id="erro">
                  <%= mensagem != null ? mensagem : "" %>
                </p>
            </div>
        </form>  
    </div>
</body>
</html>