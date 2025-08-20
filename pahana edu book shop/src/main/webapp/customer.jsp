<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Customer Panel - Pahana Edu</title>
  <link rel="stylesheet" href="customer.css?v=1.2" />
</head>
<body>
  <aside class="sidebar">
    <div class="sidebar-header">
      <img src="logo.png" alt="Logo" class="logo" />
      <h2>Pahana Edu</h2>
    </div>
    <nav class="sidebar-nav">
      <a href="#" class="nav-link active">Dashboard</a>
      <a href="#" class="nav-link">Profile</a>
      <a href="#" class="nav-link">Purchases</a>
      <a href="#" class="nav-link">Cart</a>
      <a href="#" class="nav-link">User Manual</a>
    </nav>
    <div class="logout-container">
       <a href="index.jsp" class="logout-btn">Logout</a>
    </div>
  </aside>

  <main class="main-content">
    <header>
      <h1>Dashboard</h1>
    </header>

    <!-- Cards Section -->
    <section class="cards-container">
      <div class="card">
        <h3>Total Purchases</h3>
        <p>₹ 15,500</p>
      </div>
      <div class="card">
        <h3>Items in Cart</h3>
        <p>8</p>
      </div>
    </section>

    <!-- Recent Purchases / Cart Table -->
    <section class="table-section">
      <h2>Recent Purchases / Cart Items</h2>
      <table class="sales-table">
        <thead>
          <tr>
            <th>Item ID</th>
            <th>Item Name</th>
            <th>Status</th>
            <th>Date</th>
            <th>Amount</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>#201</td>
            <td>Book - Java Basics</td>
            <td>Purchased</td>
            <td>2025-08-15</td>
            <td>₹ 1,200</td>
          </tr>
          <tr>
            <td>#202</td>
            <td>Notebook</td>
            <td>Purchased</td>
            <td>2025-08-15</td>
            <td>₹ 300</td>
          </tr>
          <tr>
            <td>#203</td>
            <td>Book - AI Concepts</td>
            <td>Purchased</td>
            <td>2025-08-14</td>
            <td>₹ 2,500</td>
          </tr>
          <tr>
            <td>#204</td>
            <td>Pen Set</td>
            <td>Cart</td>
            <td>-</td>
            <td>₹ 450</td>
          </tr>
          <tr>
            <td>#205</td>
            <td>Notebook</td>
            <td>Cart</td>
            <td>-</td>
            <td>₹ 250</td>
          </tr>
        </tbody>
      </table>
    </section>

    <section>
      <p>Welcome to the Customer Panel. Use the sidebar to navigate your profile, purchases, and cart.</p>
    </section>
  </main>
</body>
</html>
