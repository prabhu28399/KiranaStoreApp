<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
    
    
    
    <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Kirana Store</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="#">Kirana Store Admin</a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="#">Welcome, Admin</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="logout.jsp">Logout</a>
                </li>
            </ul>
        </div>
    </nav>

    <div class="container mt-5">
        <h2>Admin Dashboard</h2>
        <div class="row">
            <div class="col-md-3">
                <ul class="list-group">
                    <li class="list-group-item"><a href="#">Dashboard Overview</a></li>
                    <li class="list-group-item"><a href="#">Manage Users</a></li>
                    <li class="list-group-item"><a href="#">View Reports</a></li>
                    <li class="list-group-item"><a href="#">Inventory Management</a></li>
                    <li class="list-group-item"><a href="#">Site Settings</a></li>
                </ul>
            </div>
            <div class="col-md-9">
                <h4>Overview</h4>
                <p>This is the admin dashboard. You can manage users, view reports, and control system settings from here.</p>
            </div>
        </div>
    </div>

    <footer class="mt-5">
        <div class="container text-center">
            <p>&copy; 2024 Kirana Store. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>
