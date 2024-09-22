<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>




<%@ page session="true" %>
<%@ page import="java.util.*" %>
<%
// Example of getting username from session (assumes you set username in session after login)
String username = (String) session.getAttribute("username");
if (username == null) {
    // If the user is not logged in, redirect to login page
    response.sendRedirect("login.jsp");
}
%>

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
    

       <nav class="navbar">
   <h2>Kirana Store - <span id="username"><%= username %></span></h2>
  <div class="right-side">
    <div class="nav-links">
      <a href="#">Billing</a>
      <a href="#">Inventory</a>
      <a href="#">Location</a>
      <a href="#">KathaBook</a>
      <a href="#">Out of Stock</a>
    </div>
    <div class="user-profile">
      
      <img src="data:image/png;base64,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" alt="User" class="user-image">
      <span class="user-name">User</span>
      <div class="dropdown-menu">
        <a href="#">Edit Profile</a>
        <a href="index.jsp">Logout</a>
      </div>
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
