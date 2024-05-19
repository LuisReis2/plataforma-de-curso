<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.Locale" %>
<%
    Locale.setDefault(new Locale("pt", "BR"));
%>

<html lang="pt-br">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>Cadastro de Aulas</title>
    <link rel="stylesheet" href="style/menu.css">
    <style>
        body {
            margin: 0;
            font-family: 'Roboto', sans-serif;
            background-color: #E4D6FF;
            color: rgb(211, 255, 253);
        }

        h2 {
            text-align: center;
            color: #402D65;
            font-weight: bold;
            margin-top: 20px;
        }

        form {
            background-color: #FFFFFF;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 400px;
            margin: 20px auto;
            transition: background-color 0.3s;
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #402D65;
        }

        input[type="text"],
        select {
            width: 100%;
            padding: 10px;
            margin: 5px 0 20px;
            box-sizing: border-box;
            border: 1px solid #6D5A93;
            border-radius: 4px;
            font-size: 16px;
        }

        input[type="submit"] {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            border: none;
            border-radius: 4px;
            background-color: #402D65;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #6D5A93;
        }
    </style>
</head>
<body>

<header class="header">
    <div class="logo-container">
        <a href="menu.jsp"><img src="Images/logo.png" alt="Logo" class="logo"></a>
    </div>
     <div class="profile-tab" onclick="toggleProfile()">
            <img src="Images/perfil.png" alt="Perfil" class="profile-icon">
     </div>

</header>
 <a href="/find-aulas?id=${sessionScope.idCursoAtual}"><img src="Images/back.png" alt="Perfil" class="profile-icon"></a>
 <c:if test="${sessionScope.UserLog.getUserType() eq 'ADM' || sessionScope.UserLog.getUserType() eq 'PROFESSOR'}">
<form action="/create-aula" id="aula-form" method="post">
    <h2>Cadastrar/Atualizar aula </h2>
    <label for="idAula">ID Aula:</label>
    <input id="idAula" name="idAula" type="text" value="${param.idAula}" >

    <label for="aula-name">Título da aula:</label>
    <input id="aulaName" name="aulaName" type="text" required value="${param.aulaName}">

    <label for="aula-content">Conteúdo da aula:</label>
    <input id="aulaContent" name="aulaContent" type="text" required required value="${param.aulaContent}">

    <label for="fkCurso">ID do curso:</label>
    <input id="fkCurso" name="fkCurso" type="text" required value="${param.fkCurso}">

    <input type="submit" value="Cadastrar">
</form>
       </c:if>


  <c:if test="${sessionScope.UserLog.getUserType() eq 'STUDENT'}">
            <h2>VOCÊ NÃO TEM PERMISSÃO A ISSO </h1>
         </c:if>
<footer class="footer">

</footer>

<div class="profile-sidebar" id="profileSidebar">
    <div class="profile-header">
        <h2>Meu Perfil</h2>
        <button class="close-btn" onclick="toggleProfile()">Fechar</button>
    </div>
    <div class="profile-body">
        <c:if test="${sessionScope.UserLog != null}">
                <p>Nome: ${sessionScope.UserLog.userName}</p>
                <p>Email: ${sessionScope.UserLog.userEmail}</p>
            </c:if>
             <form action="/logout" method="get">
                         <button class="action-button logout-button" type="submit">Logout</button>
                     </form>
    </div>
</div>

<script src="scripts/sidebar.js"></script>

</body>
</html>
