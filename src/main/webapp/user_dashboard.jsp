<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard - Kirana Store</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="#">Kirana Store</a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="#">Welcome, User</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="logout.jsp">Logout</a>
                </li>
            </ul>
        </div>
    </nav>

    <div class="container mt-5">
        <h2>User Dashboard</h2>
        <div class="row">
            <div class="col-md-3">
                <ul class="list-group">
                    <li class="list-group-item"><a href="inventoryManagement.jsp">Inventory Management</a></li>
                    <li class="list-group-item"><a href="locationManagement.jsp">Product Location Management</a></li>
                    <li class="list-group-item"><a href="kathabook.jsp">Kathabook (Dues)</a></li>
                    <li class="list-group-item"><a href="userProfile.jsp">User Profile</a></li>
                    <li class="list-group-item"><a href="contact.jsp">Contact Support</a></li>
                </ul>
            </div>
            <div class="col-md-9">
                <h4>Overview</h4>
                <p>Welcome to your dashboard! Here you can manage your store's inventory, track dues, and more.</p>

                <h5>Main Content</h5>
                <ul>
                    <li><strong>Total Products:</strong> [Display total products here]</li>
                    <li><strong>Total Dues:</strong> [Display total dues here]</li>
                    <li><strong>Out-of-Stock Notifications:</strong> [Display out-of-stock products here]</li>
                    <li><strong>Product Availability:</strong> [Display product availability during purchases]</li>
                </ul>
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
