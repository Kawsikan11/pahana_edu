<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    // Database connection
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/pahana_edu","root","");

    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM books");
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Books - Pahana Edu</title>
  <link rel="stylesheet" href="cashieritem.css?v=1.3" />
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
      <a href="cashiersale.jsp" class="nav-link">Sales</a>
      <a href="cashieritem.jsp" class="nav-link active">Items</a>
      <a href="cashierrep.jsp" class="nav-link">Reports</a>
      <a href="cashbilling.jsp" class="nav-link">Billing</a>
    </nav>
    <div class="logout-container">
      <a href="index.jsp" class="logout-btn">Logout</a>
    </div>
  </aside>

  <main class="main-content">
    <header>
      <h1>Books Management</h1>
    </header>

    <!-- Add Book Button -->
    <div class="button-container">
      <a href="addbook.jsp" class="btn-primary">+ Add Book</a>
    </div>

    <!-- Books Table -->
    <section class="table-section">
      <h2>Books List</h2>
      <table class="book-table">
        <thead>
          <tr>
            <th>Name</th>
            <th>Author</th>
            <th>Edition</th>
            <th>Year</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          <%
            while(rs.next()) {
                 // assuming you have an ID column
                String bookName = rs.getString("bookname");
                String author = rs.getString("authorname");
                String edition = rs.getString("edition");
                String year = rs.getString("year");
                String price = rs.getString("price");
                String quantity = rs.getString("quantity");
          %>
          <tr>
            <td><%= bookName %></td>
            <td><%= author %></td>
            <td><%= edition %></td>
            <td><%= year %></td>
            <td>Rs. <%= price %></td>
            <td><%= quantity %></td>
            <td>
              <a href="EditBookServlet?id=<%= bookName %>" class="btn-edit">Edit</a>
             
            </td>
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
