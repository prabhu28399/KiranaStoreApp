



<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>



<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
</head>
<body>
    <h2>Admin Login</h2>
    
    <!-- Display message -->
    <c:if test="${not empty message}">
        <div>${message}</div>
    </c:if>

    <form action="adminLogin" method="post">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required autocomplete="off"><br>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required autocomplete="off"><br>

        <input type="submit" value="Login">
    </form>
</body>
</html>
