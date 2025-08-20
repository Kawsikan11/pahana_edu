<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Pahana Edu Book Shop</title>
    <link rel="stylesheet" href="home.css?v=1.3">

</head>
<body>

    <!-- Navbar -->
    <nav class="navbar">
        <div class="logo">📚 Pahana Edu Book Shop</div>
        <div class="nav-links">
            <a href="#">Home</a>
            <a href="#">Books</a>
            <a href="#">About</a>
            <a href="#">Contact</a>
            <button class="cart-btn" onclick="location.href='viewcart.jsp'">🛒 View Cart</button>
            <button class="login-btn" onclick="location.href='customer.jsp'">Dash</button>
        </div>
    </nav>

    <!-- Main Content -->
    <section class="content">
        <h1>Welcome to Pahana Edu Book Shop</h1>
        <p>Find your favorite books at the best prices. Quality service guaranteed!</p>
    </section>



</body>
</html>