<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Sales - Pahana Edu</title>
  <link rel="stylesheet" href="cashiersale.css?v=1.1" /> 
  <style>
      /* Table styles */
      .purchase-table {
          width: 90%;
          margin: 20px auto;
          border-collapse: collapse;
          box-shadow: 0 2px 10px rgba(0,0,0,0.1);
          font-family: Arial, sans-serif;
      }
      .purchase-table th, .purchase-table td {
          border: 1px solid #ddd;
          padding: 12px 15px;
          text-align: center;
      }
      .purchase-table th {
          background-color: #4CAF50;
          color: white;
          font-weight: bold;
      }
      .purchase-table tr:nth-child(even) {
          background-color: #f9f9f9;
      }
      .purchase-table tr:hover {
          background-color: #f1f1f1;
      }
      .purchase-header {
          text-align: center;
          margin-top: 20px;
          font-family: Arial, sans-serif;
      }
  </style>
</head>
<body>
  <aside class="sidebar">
    <div class="sidebar-header">
      <img src="logo.png" alt="Logo" class="logo" />
      <h2>Pahana Edu</h2>
    </div>
    <nav class="sidebar-nav">
      <a href="customer.jsp" class="nav-link">Dashboard</a>
      <a href="custpur.jsp" class="nav-link active">Purchases</a>
      
      <a href="custum.jsp" class="nav-link">User Manual</a>
    </nav>
    <div class="logout-container">
      <a href="index.jsp" class="logout-btn">Logout</a>
    </div>
  </aside>

  <div class="main-content">
<%
    // Get username from session
    String username = (String) session.getAttribute("username");

    if(username != null && !username.isEmpty()) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pahana_edu", "root", ""); // Update DB info

            String sql = "SELECT id, bookname, authorname, edition, quantity, price, purchase_date, purchase_time " +
                         "FROM purchase WHERE customer_name = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();
%>
      <h2 class="purchase-header">Purchases for <%= username %></h2>
      <table class="purchase-table">
          <tr>
              <th>ID</th>
              <th>Book Name</th>
              <th>Author</th>
              <th>Edition</th>
              <th>Quantity</th>
              <th>Price</th>
              <th>Purchase Date</th>
              <th>Purchase Time</th>
          </tr>
<%
            while(rs.next()) {
%>
          <tr>
              <td><%= rs.getInt("id") %></td>
              <td><%= rs.getString("bookname") %></td>
              <td><%= rs.getString("authorname") %></td>
              <td><%= rs.getString("edition") %></td>
              <td><%= rs.getInt("quantity") %></td>
              <td><%= rs.getDouble("price") %></td>
              <td><%= rs.getDate("purchase_date") %></td>
              <td><%= rs.getTime("purchase_time") %></td>
          </tr>
<%
            }
        } catch(Exception e) {
            out.println("<p style='color:red; text-align:center;'>Error: " + e.getMessage() + "</p>");
        } finally {
            try { if(rs != null) rs.close(); } catch(Exception e) {}
            try { if(ps != null) ps.close(); } catch(Exception e) {}
            try { if(con != null) con.close(); } catch(Exception e) {}
        }
    } else {
        out.println("<p style='text-align:center; margin-top:20px;'>Please login to view your purchases.</p>");
    }
%>
      </table>
  </div>
</body>
</html>
