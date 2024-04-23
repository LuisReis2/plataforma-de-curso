<!DOCTYPE html>
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
    <meta charset="UTF-8">
     <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Poppins', sans-serif;
            }

            body {
                width: 100vw;
                height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
                background-color: rgba(0,0,0,0.1);
                font-size: 16px;
            }

            table {
                border-collapse: collapse;
                width: 100%;
                margin-top: 20px;
            }

            th, td {
                border: 1px solid #dddddd;
                text-align: left;
                padding: 8px;
            }

            tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            th {
                background-color: #4CAF50;
                color: white;
            }

            button {
                cursor: pointer;
                padding: 5px 10px;
                border-radius: 20px;
                border: none;
                background-color: rgb(57, 57, 226);
                color: white;
            }
        </style>
    <title>Dashboard</title>
</head>
<body>
  <div>
    <h1>Users</h1>
    <table border=1>
        <tr>
            <th>Email</th>
            <th>Name</th>
            <th>Type</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="user" items="${users}">
            <tr>
                <td>${user.userEmail}</td>
                <td>${user.userName}</td>
                <td>${user.userType}</td>
                <td>
                <form action="/delete" method="post">
                                <input type="hidden" id="userEmail" name="userEmail" value="${user.userEmail}">
                                <button type="submit">Delete</button>
                                </form>
                </td>
            </tr>
        </c:forEach>
    </table>
  </div>
</body>
</html>
