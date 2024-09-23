<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <!DOCTYPE html>
<html>
<head>
    <title>User Signup</title>
</head>
<body>
    <h2>User Signup</h2>
   <form action="register" method="post">
    <label for="username">Username:</label>
    <input type="text" id="username" name="username" required><br>

    <label for="email">Email:</label>
    <input type="email" id="email" name="email" required><br>

    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required><br>

    <label for="mobile">Mobile:</label>
    <input type="text" id="mobile" name="mobile" required><br>

    <input type="submit" value="Signup">
</form>

</body>
</html>
    