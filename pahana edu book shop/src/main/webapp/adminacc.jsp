<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    // Database connection
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/pahana_edu","root","");

    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT id, name, address, telephone_number, roll FROM users");
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Accounts - Pahana Edu</title>
  <link rel="stylesheet" href="adminacc.css?v=1.3" />
</head>
<body>
  <aside class="sidebar">
    <div class="sidebar-header">
      <img src="logo.png" alt="Logo" class="logo" />
      <h2>Pahana Edu</h2>
    </div>
    <nav class="sidebar-nav">
      <a href="admin.jsp" class="nav-link">Dashboard</a>
      <a href="adminacc.jsp" class="nav-link active">Accounts</a>
      <a href="adminsale.jsp" class="nav-link">Sales</a>
      <a href="adminitem.jsp" class="nav-link">Items</a>
      <a href="adminrep.jsp" class="nav-link">Reports</a>
      <a href="billing.jsp" class="nav-link">Billing</a>
    </nav>
    <div class="logout-container">
      <a href="index.jsp" class="logout-btn">Logout</a>
    </div>
  </aside>

  <main class="main-content">
    <header>
      <h1>Accounts</h1>
    </header>

    <!-- Register Button -->
    <div class="button-container">
      <a href="register.jsp" class="btn-primary">+ Register User</a>
    </div>

    <!-- Users Table -->
    <section class="table-section">
      <h2>Registered Users</h2>
      <table class="user-table">
        <thead>
          <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Address</th>
            <th>Telephone</th>
            <th>Role</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          <%
            while(rs.next()) {
                int userId = rs.getInt("id");
                String name = rs.getString("name");
                String address = rs.getString("address");
                String phone = rs.getString("telephone_number");
                String role = rs.getString("roll");

                // Disable edit/delete for Admin
                boolean isAdmin = "Admin".equalsIgnoreCase(role);
          %>
          <tr>
            <td><%= userId %></td>
            <td><%= name %></td>
            <td><%= address %></td>
            <td><%= phone %></td>
            <td><%= role %></td>
            <td>
              <% if(!isAdmin) { %>
                <a href="EditUserServlet?id=<%= userId %>" class="btn-edit">Edit</a>
                <a href="DeleteUserServlet?id=<%= userId %>" class="btn-delete" onclick="return confirm('Are you sure?')">Delete</a>
              <% } else { %>
                <span style="color:gray;">N/A</span>
              <% } %>
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
