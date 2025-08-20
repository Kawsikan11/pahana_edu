<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    // Connect to database
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/pahana_edu","root","");
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT customerId, bookName, quantity, total, sale_date FROM sales ORDER BY sale_date DESC");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Sales - Pahana Edu</title>
  <link rel="stylesheet" href="cashiersale.css?v=1.1" /> 
</head>
<body>
  <aside class="sidebar">
    <div class="sidebar-header">
      <img src="logo.png" alt="Logo" class="logo" />
      <h2>Pahana Edu</h2>
    </div>
    <nav class="sidebar-nav">
      <a href="cashier.jsp" class="nav-link">Dashboard</a>
      <a href="cashieracc.jsp" class="nav-link">Accounts</a>
      <a href="cashiersale.jsp" class="nav-link active">Sales</a>
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
      <h1>Sales</h1>
    </header>

    <!-- Sales Table Section -->
    <section class="table-section">
      <h2>Recent Sales</h2>
      <table class="sales-table">
        <thead>
          <tr>
            <th>Customer No</th>
            <th>Book Name</th>
            <th>Quantity</th>
            <th>Amount (Rs.)</th>
            <th>Date</th>
          </tr>
        </thead>
        <tbody>
          <%
            while(rs.next()) {
          %>
          <tr>
            <td><%= rs.getString("customerId") %></td>
            <td><%= rs.getString("bookName") %></td>
            <td><%= rs.getInt("quantity") %></td>
            <td><%= rs.getDouble("total") %></td>
            <td><%= rs.getTimestamp("sale_date") %></td>
          </tr>
          <% } %>
        </tbody>
      </table>
    </section>
  </main>
</body>
</html>
<%
    rs.close();
    st.close();
    con.close();
%>
