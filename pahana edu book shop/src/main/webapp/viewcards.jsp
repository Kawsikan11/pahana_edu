<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.time.LocalDateTime, java.time.format.DateTimeFormatter" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Cart - Pahana Edu</title>
<link rel="stylesheet" href="home.css?v=1.5">
<style>
table { width: 90%; margin: 20px auto; border-collapse: collapse; background-color: #fff; }
th, td { padding: 10px; text-align: center; border-bottom: 1px solid #ddd; }
th { background-color: #007BFF; color: white; }
img { width: 80px; height: 100px; object-fit: cover; border-radius: 6px; }
button { padding: 6px 12px; background-color: #28a745; color: white; border: none; border-radius: 6px; cursor: pointer; }
button:hover { background-color: #218838; }
</style>
</head>
<body>

<h2 style="text-align:center;">My Cart</h2>

<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Book</th>
            <th>Author</th>
            <th>Edition</th>
            <th>Year</th>
            <th>Quantity</th>
            <th>Price (Rs.)</th>
            <th>Image</th>
            <th>Added On</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
    <%
        // Get logged-in username from session
        String customerName = (String) session.getAttribute("username");
        if(customerName == null){
            out.println("<tr><td colspan='10' style='color:red;'>Please login first!</td></tr>");
        } else {
            Connection con = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pahana_edu","root","");
                
                // Select only items added by the logged-in customer
                String sql = "SELECT * FROM addtocard WHERE customer_name = ?";
                ps = con.prepareStatement(sql);
                ps.setString(1, customerName);
                rs = ps.executeQuery();
                
                while(rs.next()) {
    %>
        <tr>
            <td><%=rs.getInt("id")%></td>
            <td><%=rs.getString("bookname")%></td>
            <td><%=rs.getString("authorname")%></td>
            <td><%=rs.getString("edition")%></td>
            <td><%=rs.getInt("year")%></td>
            <td><%=rs.getInt("quantity")%></td>
            <td><%=rs.getDouble("price")%></td>
            <td><img src="<%=rs.getString("image")%>" alt="Book"></td>
            <td><%=rs.getTimestamp("addtocard_date")%></td>
            <td>
                <form action="BuyServlet" method="post">
                    <input type="hidden" name="id" value="<%=rs.getInt("id")%>">
                    <input type="hidden" name="bookname" value="<%=rs.getString("bookname")%>">
                    <input type="hidden" name="authorname" value="<%=rs.getString("authorname")%>">
                    <input type="hidden" name="edition" value="<%=rs.getString("edition")%>">
                    <input type="hidden" name="year" value="<%=rs.getInt("year")%>">
                    <input type="hidden" name="quantity" value="<%=rs.getInt("quantity")%>">
                    <input type="hidden" name="price" value="<%=rs.getDouble("price")%>">
                    <input type="hidden" name="image" value="<%=rs.getString("image")%>">
                    <!-- Pass customer name to BuyServlet -->
                    <input type="hidden" name="customer_name" value="<%=customerName%>">
                    <button type="submit">Buy</button>
                </form>
            </td>
        </tr>
    <%
                }
            } catch(Exception e){
                out.println("<tr><td colspan='10' style='color:red;'>Error: " + e.getMessage() + "</td></tr>");
            } finally {
                if(rs != null) rs.close();
                if(ps != null) ps.close();
                if(con != null) con.close();
            }
        }
    %>
    </tbody>
</table>

</body>
</html>
