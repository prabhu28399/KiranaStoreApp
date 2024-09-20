<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    
    <!DOCTYPE html>
<html>
<head>
    <title>Login</title>
</head>
<body>
    <h2>Login</h2>
    <form action="login" method="POST">
        <label>Username: </label>
        <input type="text" name="username" required><br><br>
        <label>Password: </label>
        <input type="password" name="password" required><br><br>
        <input type="submit" value="Login">
    </form>
    <c:if test="${param.error}">
        <p style="color:red;">Invalid username or password!</p>
    </c:if>
</body>
</html>
    