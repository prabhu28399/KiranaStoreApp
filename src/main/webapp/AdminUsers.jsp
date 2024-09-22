<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="model.User" %>

<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<User> users = (List<User>) request.getAttribute("users");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Kirana Store</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-dark">
        <h2>Admin Dashboard - <span id="username"><%= username %></span></h2>
        <div class="right-side ml-auto">
            <div class="nav-links">
                <a href="#">Dashboard</a>
                <a href="#">Manage Users</a>
                <a href="#">Manage Admin's</a>
                <a href="#">Site Settings</a>
            </div>
            <div class="user-profile ml-3">
                <img src="https://e7.pngegg.com/pngimages/9/763/png-clipart-computer-icons-login-user-system-administrator-admin-desktop-wallpaper-megaphone-thumbnail.png" alt="User" class="user-image" style="width: 40px; height: 40px;">
                <span class="user-name">Admin</span>
                <div class="dropdown-menu">
                    <a href="#">Edit Profile</a>
                    <a href="index.jsp">Logout</a>
                </div>
            </div>
        </div>
    </nav>

    <div class="admin_user">
        <h5>Users List</h5>
        
        <% if (request.getAttribute("errorMessage") != null) { %>
            <div class="alert alert-danger"><%= request.getAttribute("errorMessage") %></div>
        <% } %>

        <div class="table-container">
            <table class="table">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>UserName</th>
                        <th>Email</th>
                        <th>Mobile</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <% if (users != null && !users.isEmpty()) { %>
                        <% for (User user : users) { %>
                            <tr>
                                <td></td>
                                <td><%= user.getUserName() %></td>
                                <td><%= user.getEmail() %></td>
                                <td><%= user.getMobile() %></td>
                                <td class="action-icons">
                                    <button class="delete">Delete</button>
                                    <button class="edit">Edit</button>
                                </td>
                            </tr>
                        <% } %>
                    <% } else { %>
                        <tr>
                            <td colspan="5" class="text-center">No users found.</td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>

    <%@ include file="footer.jsp" %>

</body>
</html>
