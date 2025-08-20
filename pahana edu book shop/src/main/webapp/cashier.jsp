<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    // Database connection
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/pahana_edu","root","");

    Statement st = con.createStatement();

    // Total Sales (number of sales)
    ResultSet rsTotalSales = st.executeQuery("SELECT COUNT(*) AS totalSales FROM sales");
    rsTotalSales.next();
    int totalSales = rsTotalSales.getInt("totalSales");

    // Total Customers
    ResultSet rsTotalCustomers = st.executeQuery("SELECT COUNT(*) AS totalCustomers FROM users");
    rsTotalCustomers.next();
    int totalCustomers = rsTotalCustomers.getInt("totalCustomers");

    // Total Revenue (sum of total column)
    ResultSet rsTotalRevenue = st.executeQuery("SELECT SUM(total) AS totalRevenue FROM sales");
    rsTotalRevenue.next();
    double totalRevenue = rsTotalRevenue.getDouble("totalRevenue");

    // Last 5 sales
    ResultSet rsRecentSales = st.executeQuery(
        "SELECT s.id, u.name AS customerName, s.bookName, s.quantity, s.total, s.sale_date " +
        "FROM sales s JOIN users u ON s.customerId = u.id " +
        "ORDER BY s.sale_date DESC LIMIT 5"
    );
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Cashier Panel - Pahana Edu</title>
  <link rel="stylesheet" href="cashier.css?v=1.1" />
</head>
<body>
  <aside class="sidebar">
    <div class="sidebar-header">
      <img src="logo.png" alt="Logo" class="logo" />
      <h2>Pahana Edu</h2>
    </div>
    <nav class="sidebar-nav">
      <a href="cashier.jsp" class="nav-link active">Dashboard</a>
      <a href="cashieracc.jsp" class="nav-link">Accounts</a>
      <a href="cashiersale.jsp" class="nav-link">Sales</a>
      <a href="cashieritem.jsp" class="nav-link">Items</a>
      <a href="cashierrep.jsp" class="nav-link">Reports</a>
      <a href="cashbilling.jsp" class="nav-link">Billing</a>
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
        <h3>Total Sales</h3>
        <p> <%= totalSales %></p>
      </div>
      <div class="card">
        <h3>Total Customers</h3>
        <p><%= totalCustomers %></p>
      </div>
      <div class="card">
        <h3>Total Revenue</h3>
        <p>₹ <%= totalRevenue %></p>
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
            <th>Quantity</th>
            <th>Amount</th>
            <th>Date</th>
          </tr>
        </thead>
        <tbody>
          <%
            while(rsRecentSales.next()) {
          %>
          <tr>
            <td><%= rsRecentSales.getInt("id") %></td>
            <td><%= rsRecentSales.getString("customerName") %></td>
            <td><%= rsRecentSales.getString("bookName") %></td>
            <td><%= rsRecentSales.getInt("quantity") %></td>
            <td>₹ <%= rsRecentSales.getDouble("total") %></td>
            <td><%= rsRecentSales.getTimestamp("sale_date") %></td>
          </tr>
          <% } %>
        </tbody>
      </table>
    </section>

    <section>
      <p>Welcome to the Admin Panel. Select a section from the sidebar to get started.</p>
    </section>
  </main>
</body>
</html>

<%
    rsTotalSales.close();
    rsTotalCustomers.close();
    rsTotalRevenue.close();
    rsRecentSales.close();
    st.close();
    con.close();
%>
