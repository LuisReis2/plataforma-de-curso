<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>Login</title>
    <link href="style/login.css" rel="stylesheet">
</head>
<body>

<header class="header">
    <div class="logo-container">
        <img alt="Logo" class="logo" src="Images/logo.png">
    </div>
</header>

<div class="main-login">

    <div class="left-login">
        <h1>Faça seu login <br> e acesse nossa plataforma</h1>
        <img alt="Apresentação" class="leftImage" src="Images/presentation-animate.svg">
    </div>

    <div class="right-login">
        <div class="card-login">

            <form action="/login" method="post">

                <div class="textfield">
                    <label for="email">Email: </label>
                    <input id="email" name="email" placeholder="Email" type="email">
                </div>
                <div class="textfield">
                    <label for="senha">Senha: </label>
                    <input id="senha" name="senha" placeholder="Senha" type="password">
                </div>

                <button class="btn-login">Login</button>

            </form>
            <br>
               <span class="error">${requestScope.message}<span>
        </div>

    </div>

</div>

<footer class="footer">

</footer>

</body>
</html>
