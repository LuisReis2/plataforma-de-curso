<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.Locale" %>
<%
    Locale.setDefault(new Locale("pt", "BR"));
%>

<!DOCTYPE html>
<html lang="pt-br">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
    <meta charset="UTF-8">
    <title>Criando curso</title>
    <link rel="stylesheet" href="style/menu.css">
    <link rel="stylesheet" type="text/css" href="style/createCurso.css">
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
<main>
<c:if test="${sessionScope.UserLog.getUserType() eq 'ADM' || sessionScope.UserLog.getUserType() eq 'PROFESSOR'}">
    <h2>Adicionar participante ao curso</h2>
    <form id="cursoForm" action="/create-participantes" method="post">
        <label for="idParticipante">ID do Participante</label>
        <input id="idParticipante" name="idParticipante" type="text" value="${param.idParticipante}" >

        <label for="idUserFk">Email do usuario</label>
        <input id="idUserFk" name="idUserFk" type="text" value="${param.idUserFk}" >

        <label for="idCursoFk">ID do curso</label>
        <input id="idCursoFk" name="idCursoFk" type="text" value="${param.idCursoFk}" >

        <input type="submit" value="CRIAR">
    </form>
           </c:if>
    <div id="errorMessages"></div>

      <c:if test="${sessionScope.UserLog.getUserType() eq 'STUDENT'}">
                <h2>VOCÊ NÃO TEM PERMISSÃO A ISSO </h1>
             </c:if>
</main>

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

<script>
    function toggleProfile() {
        var sidebar = document.getElementById("profileSidebar");
        if (sidebar.style.right === "-300px") {
            sidebar.style.right = "0";
        } else {
            sidebar.style.right = "-300px";
        }
    }
</script>
</body>
</html>
