<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Admin Panel - Pahana Edu</title>
  <link rel="stylesheet" href="admin.css?v=1.1" /> <!-- Cache bust -->
</head>
<body>
  <aside class="sidebar">
    <div class="sidebar-header">
      <img src="logo.png" alt="Logo" class="logo" />
      <h2>Pahana Edu</h2>
    </div>
    <nav class="sidebar-nav">
      <a href="#" class="nav-link active">Dashboard</a>
      <a href="#" class="nav-link">Accounts</a>
      <a href="#" class="nav-link">Sales</a>
      <a href="#" class="nav-link">Items</a>
      <a href="#" class="nav-link">Reports</a>
      <a href="#" class="nav-link">User Manual</a>
    </nav>
    <div class="logout-container">
      <a href="logout.jsp" class="logout-btn">Logout</a>
    </div>
  </aside>

  <main class="main-content">
    <header>
      <h1>Dashboard</h1>
    </header>

    <!-- Cards Section -->
    <section class="cards-container">
      <div class="card">
        <h3>Total Sales</h3>
        <p>₹ 1,50,000</p>
      </div>
      <div class="card">
        <h3>Total Customers</h3>
        <p>320</p>
      </div>
      <div class="card">
        <h3>Total Revenue</h3>
        <p>₹ 4,80,000</p>
      </div>
    </section>

    <!-- Recent Sales Table -->
    <section class="table-section">
      <h2>Recent Sales</h2>
      <table class="sales-table">
        <thead>
          <tr>
            <th>Sale ID</th>
            <th>Customer Name</th>
            <th>Item</th>
            <th>Date</th>
            <th>Amount</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>#101</td>
            <td>John Doe</td>
            <td>Book - Java Basics</td>
            <td>2025-08-15</td>
            <td>₹ 1,200</td>
          </tr>
          <tr>
            <td>#102</td>
            <td>Mary Smith</td>
            <td>Notebook</td>
            <td>2025-08-15</td>
            <td>₹ 300</td>
          </tr>
          <tr>
            <td>#103</td>
            <td>Arun Kumar</td>
            <td>Book - AI Concepts</td>
            <td>2025-08-14</td>
            <td>₹ 2,500</td>
          </tr>
          <tr>
            <td>#104</td>
            <td>Sara Lee</td>
            <td>Pen Set</td>
            <td>2025-08-13</td>
            <td>₹ 450</td>
          </tr>
        </tbody>
      </table>
    </section>

    <section>
      <p>Welcome to the Admin Panel. Select a section from the sidebar to get started.</p>
    </section>
  </main>
</body>
</html>
