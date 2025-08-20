<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Customer Panel - Pahana Edu</title>
    <link rel="stylesheet" href="customer.css?v=1.2" />
</head>
<body>
<%
    // Get the username input or from session
    String username = request.getParameter("username");
    if (username == null) {
        username = (String) session.getAttribute("username"); // if stored in session
    }

    // Database connection parameters
    String url = "jdbc:mysql://localhost:3306/pahana_edu";
    String dbUser = "root";  // change if needed
    String dbPass = "";      // change if needed

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    List<Map<String, String>> purchases = new ArrayList<>();

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection(url, dbUser, dbPass);

        // Fetch last 5 purchases for the logged-in user
        String sql = "SELECT id, bookname, price, purchase_date, purchase_time, quantity " +
                     "FROM purchase WHERE customer_name=? ORDER BY purchase_date DESC, purchase_time DESC LIMIT 5";
        ps = con.prepareStatement(sql);
        ps.setString(1, username);
        rs = ps.executeQuery();

        while (rs.next()) {
            Map<String, String> purchase = new HashMap<>();
            purchase.put("id", rs.getString("id"));
            purchase.put("bookname", rs.getString("bookname"));
            purchase.put("price", rs.getString("price"));
            purchase.put("purchase_date", rs.getString("purchase_date"));
            purchase.put("purchase_time", rs.getString("purchase_time"));
            purchase.put("quantity", rs.getString("quantity"));
            purchases.add(purchase);
        }

    } catch (Exception e) {
        out.println("Database error: " + e.getMessage());
    } finally {
        try { if (rs != null) rs.close(); } catch (Exception e) {}
        try { if (ps != null) ps.close(); } catch (Exception e) {}
        try { if (con != null) con.close(); } catch (Exception e) {}
    }
%>

<aside class="sidebar">
    <div class="sidebar-header">
        <img src="logo.png" alt="Logo" class="logo" />
        <h2>Pahana Edu</h2>
    </div>
    <nav class="sidebar-nav">
        <a href="customer.jsp" class="nav-link active">Dashboard</a>
        
        <a href="custpur.jsp" class="nav-link">Purchases</a>
       
        <a href="custum.jsp" class="nav-link">User Manual</a>
    </nav>
    <div class="logout-container">
        <a href="index.jsp" class="logout-btn">Logout</a>
    </div>
</aside>

<main class="main-content">
    <header>
        <h1>Dashboard</h1>
    </header>
    
    <section class="table-section">
        <h2>Last 5 Purchases</h2>
        <table class="sales-table">
            <thead>
                <tr>
                    <th>Item ID</th>
                    <th>Item Name</th>
                    <th>Quantity</th>
                    <th>Date</th>
                    <th>Time</th>
                    <th>Amount</th>
                </tr>
            </thead>
            <tbody>
            <%
                if (!purchases.isEmpty()) {
                    for (Map<String, String> purchase : purchases) {
            %>
                <tr>
                    <td><%= purchase.get("id") %></td>
                    <td><%= purchase.get("bookname") %></td>
                    <td><%= purchase.get("quantity") %></td>
                    <td><%= purchase.get("purchase_date") %></td>
                    <td><%= purchase.get("purchase_time") %></td>
                    <td>₹ <%= purchase.get("price") %></td>
                </tr>
            <%
                    }
                } else {
            %>
                <tr>
                    <td colspan="6">No purchases found.</td>
                </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </section>
    
    <section>
        <p>Welcome <strong><%= username %></strong> to the Customer Panel. Use the sidebar to navigate your profile, purchases, and cart.</p>
    </section>
</main>
</body>
</html>
