<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Pahana Edu Book Shop</title>
    <link rel="stylesheet" href="home.css?v=1.3">
    <style>
        /* Book Cards */
        .cards-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
            padding: 20px;
        }

        .book-card {
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            width: 220px;
            text-align: center;
            padding: 15px;
            transition: transform 0.3s;
        }

        .book-card:hover {
            transform: translateY(-5px);
        }

        .book-card img {
            width: 150px;
            height: 200px;
            object-fit: cover;
            border-radius: 8px;
        }

        .book-card h3 {
            font-size: 18px;
            margin: 10px 0 5px 0;
        }

        .book-card p {
            font-size: 14px;
            margin: 3px 0;
        }

        .book-card input[type="number"] {
            width: 50px;
            padding: 4px;
            margin-top: 5px;
        }

        .book-card button {
            margin-top: 8px;
            padding: 6px 12px;
            background-color: #007BFF;
            color: #fff;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: 0.3s;
        }

        .book-card button:hover {
            background-color: #0056b3;
        }
    </style>
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
            <button class="cart-btn" onclick="location.href='viewcards.jsp'">🛒 View Cart</button>
            <button class="login-btn" onclick="location.href='customer.jsp'">Dash</button>
        </div>
    </nav>

    <!-- Main Content -->
    <section class="content">
        <h1>Welcome to Pahana Edu Book Shop</h1>
        <p>Find your favorite books at the best prices. Quality service guaranteed!</p>
    </section>

    <!-- Book Cards -->
    <div class="cards-container">
    <%
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pahana_edu","root","");
            String sql = "SELECT * FROM books";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()) {
    %>
        <div class="book-card">
            <img src="<%=rs.getString("image")%>" alt="Book Image">
            <h3><%=rs.getString("bookname")%></h3>
            <p>Author: <%=rs.getString("authorname")%></p>
            <p>Edition: <%=rs.getString("edition")%></p>
            <p>Year: <%=rs.getInt("year")%></p>
            <p>Price: Rs. <%=rs.getDouble("price")%></p>

            <form action="AddToCardServlet" method="post">
                <input type="hidden" name="bookname" value="<%=rs.getString("bookname")%>">
                <input type="hidden" name="authorname" value="<%=rs.getString("authorname")%>">
                <input type="hidden" name="edition" value="<%=rs.getString("edition")%>">
                <input type="hidden" name="year" value="<%=rs.getInt("year")%>">
                <input type="hidden" name="price" value="<%=rs.getDouble("price")%>">
                <input type="hidden" name="image" value="<%=rs.getString("image")%>">
                Quantity: <input type="number" name="quantity" value="<%=rs.getString("quantity")%>">
                <br>
                <button type="submit">🛒 Add to Cart</button>
            </form>
        </div>
    <%
            }
        } catch(Exception e){
            out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
        } finally {
            if(rs != null) rs.close();
            if(ps != null) ps.close();
            if(con != null) con.close();
        }
    %>
    </div>

</body>
</html>
