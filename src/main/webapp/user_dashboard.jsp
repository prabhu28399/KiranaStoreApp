<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>





<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard - Kirana Store</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
    
</head>
<body>
    

       <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="#">Kirana Store</a>

    <!-- Toggler for mobile view -->
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon">dsd</span>
    </button>

    <div class="collapse navbar-collapse navbar-list" id="navbarNav" >
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="#">Billing</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Inventory</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Location</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">KathaBook</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Out of Stock</a>
            </li>
        </ul>

        <div class="ml-3 d-flex align-items-center">
            <!-- Profile Name and Image Dropdown -->
            <div class="dropdown">
                <img src="https://static.vecteezy.com/system/resources/thumbnails/019/879/186/small_2x/user-icon-on-transparent-background-free-png.png" 
                     alt="User Profile" 
                     class="rounded-circle profile-img dropdown-toggle" 
                     id="profileDropdown" 
                     data-toggle="dropdown" 
                     aria-haspopup="true" 
                     aria-expanded="false">
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="profileDropdown">
                    <a class="dropdown-item" href="#">Edit Profile</a>
                    <a class="dropdown-item" href="index.jsp">Logout</a>
                </div>
            </div>
            &nbsp;
            <span class="navbar-text text-white mr-3">User Profile</span> <!-- User Name -->
        </div>
    </div>
</nav>
       
    
   <div class="product-grid">
    <div class="product-row">
        <div class="product-card">
            <img src="https://us.123rf.com/450wm/volodymyrvoronov/volodymyrvoronov2302/volodymyrvoronov230200175/198723414-supermarket-cashier-and-customers-vector-illustration-in-flat-style.jpg?ver=6" alt="Headphones">
            <h3>Billing</h3>
            <!-- <div class="rating">★★★★★</div>
            <p class="price">$19.99</p> -->
        </div>
        <div class="product-card">
            <img src="https://adynamics.com.my/wp-content/uploads/what-is-inventory-control-benefits-best-practices.png" alt="Heels">
            <h3>Inventory</h3>
            <!-- <div class="rating">★★★★★</div>
            <p class="price">$24.99</p> -->
        </div>
        <div class="product-card">
            <img src="https://madan.org.il/sites/default/files/field/image/scan-and-go-app-1024x428.jpeg" alt="Dress Shoes">
            <h3>Location</h3>
            <!-- <div class="rating">★★★★★</div>
            <p class="price">$39.99</p> -->
        </div>
    </div>
    <div class="product-row">
        <div class="product-card">
            <img src="https://merchant.id/wp-content/uploads/2018/07/L6_How-to-Remove-a-Late-Payment-from-Your-Credit-Card.jpg" alt="Sports Shoes">
            <h3>KathaBook</h3>
            <!-- <div class="rating">★★★★★</div>
            <p class="price">$12.99</p> -->
        </div>
        <div class="product-card">
            <img src="https://media.datawiz.io/dw-cms/articles/social-backorder.webp?AWSAccessKeyId=cms_user&Signature=ZND%2BHiLVeG2kT9c6zTn4o7VNUaA%3D&Expires=2356114053" alt="Watch">
            <h3>Out of Stock</h3>
            <!-- <div class="rating">★★★★★</div>
            <p class="price">$9.99</p> -->
        </div>
        <div class="product-card">
            <img src="https://www.simplilearn.com/ice9/free_resources_article_thumb/Future_Of_Artificial_Intelligence.jpg" alt="Perfume">
            <h3>Future Updates</h3>
            <!-- <div class="rating">★★★★★</div>
            <p class="price">$29.99</p> -->
        </div>
    </div>
</div>

    <%@ include file="footer.jsp" %>
    
</body>
</html>
