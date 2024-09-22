<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="java.sql.*" %> <!-- Import necessary SQL classes -->



<%@ page import="java.util.*" %>
<%
// Example of getting username from session (assumes you set username in session after login)
String username = (String) session.getAttribute("username" );
if (username == null) {
    // If the user is not logged in, redirect to login page
    response.sendRedirect("login.jsp");
    return;
}
    String jdbcUrl = "jdbc:mysql://localhost:3306/youtube?useSSL=false&serverTimezone=UTC"; // Update as needed
    String jdbcUsername = "root";
    String jdbcPassword = "root";

    int adminCount = 0;
    int userCount = 0;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        
        try (Connection connection = DriverManager.getConnection(jdbcUrl, jdbcUsername, jdbcPassword);
             PreparedStatement adminStmt = connection.prepareStatement("SELECT COUNT(*) FROM users WHERE role = 'admin'");
             PreparedStatement userStmt = connection.prepareStatement("SELECT COUNT(*) FROM users WHERE role = 'user'")) {

            // Admin count
            ResultSet adminResultSet = adminStmt.executeQuery();
            if (adminResultSet.next()) {
                adminCount = adminResultSet.getInt(1);
            }
            
            // User count
            ResultSet userResultSet = userStmt.executeQuery();
            if (userResultSet.next()) {
                userCount = userResultSet.getInt(1);
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Kirana Store</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <nav class="navbar">
        <h2>Admin Dashboard - <span id="username"><%= username %></span></h2>
        <div class="right-side">
            <div class="nav-links">
                <a href="#">Dashboard</a>
                <a href="AdminUsers.jsp">Manage Users</a>
                <a href="#">Manage Admin's</a>
                <a href="#">Site Settings</a>
            </div>
            <div class="user-profile">
                <img src="https://e7.pngegg.com/pngimages/9/763/png-clipart-computer-icons-login-user-system-administrator-admin-desktop-wallpaper-megaphone-thumbnail.png" alt="User" class="user-image">
                <span class="user-name">Admin</span>
                <div class="dropdown-menu">
                    <a href="#">Edit Profile</a>
                    <a href="index.jsp">Logout</a>
                </div>
            </div>
        </div>
    </nav>

    <div class="card-container">
        <div class="card">
            <div class="card-content">
                <div class="card-text">
                    <h4><%= adminCount %></h4>
                    <p>Total Admin's</p>
                </div>
                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBjcbgqyPpFf9jxc9HsudDZmP7WoO972b6qg&s" alt="Agent" class="card-image">
            </div>
        </div>
        
        <div class="card">
            <div class="card-content">
                <div class="card-text">
                    <h4><%= userCount %></h4>
                    <p>Total Users</p>
                </div>
                <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/User_icon_2.svg/640px-User_icon_2.svg.png" alt="User" class="card-image">
            </div>
        </div>
        
        <div class="card">
            <div class="card-content">
                <div class="card-text">
                    <h4>Site settings</h4>
                    <p></p>
                </div>
                <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/e/ea/Settings_%28iOS%29.png/800px-Settings_%28iOS%29.png" alt="Third Card" class="card-image"> 
            </div>
        </div>
    </div>

    <%@ include file="footer.jsp" %>
</body>
</html>
