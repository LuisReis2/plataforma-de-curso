<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.Locale" %>
<%
    Locale.setDefault(new Locale("pt", "BR"));
%>

<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
    <meta charset="UTF-8">
    <title>Aula</title>
</head>
<body>
<a href="/find-aulas?id=${aula.getFkCurso()}"><img src="Images/home.png" alt="Perfil" class="profile-icon"></a>
<iframe width="420" height="345" src="${aula.getContentAula()}">
</iframe>
</body>
</html>