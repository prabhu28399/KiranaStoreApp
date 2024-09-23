<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
    <!DOCTYPE html>
<html>
<head>
    <title>Add Shop</title>
</head>
<body>
    <h2>Add a New Shop</h2>
    <form action="addShop" method="post">
        <label for="shopName">Shop Name:</label>
        <input type="text" id="shopName" name="shopName" required>
        <input type="submit" value="Add Shop">
    </form>
</body>
</html>
