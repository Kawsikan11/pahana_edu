<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    // Connect to DB to fetch book names and prices
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pahana_edu","root","");
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT bookname, price FROM books");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Billing - Pahana Edu</title>
  <link rel="stylesheet" href="billing.css?v=1.1" /> 
</head>
<body>
  <aside class="sidebar">
    <div class="sidebar-header">
      <img src="logo.png" alt="Logo" class="logo" />
      <h2>Pahana Edu</h2>
    </div>
    <nav class="sidebar-nav">
      <a href="admin.jsp" class="nav-link">Dashboard</a>
      <a href="adminacc.jsp" class="nav-link">Accounts</a>
      <a href="adminsale.jsp" class="nav-link">Sales</a>
      <a href="adminitem.jsp" class="nav-link">Items</a>
      <a href="adminrep.jsp" class="nav-link">Reports</a>
      <a href="billing.jsp" class="nav-link active">Billing</a>
    </nav>
    <div class="logout-container">
       <a href="index.jsp" class="logout-btn">Logout</a>
    </div>
  </aside>

  <main class="main-content">
    <header>
      <h1>Billing</h1>
    </header>

    <!-- Billing Form -->
    <section class="billing-section">
      <h2>Create Bill</h2>
      <form class="billing-form" action="${pageContext.request.contextPath}/BillingServlet" method="post">
        <!-- Customer ID -->
        <div class="form-group">
          <label for="customerId">Customer ID:</label>
          <input type="text" id="customerId" name="customerId" required>
        </div>

        <!-- Book Selection -->
        <div class="form-group">
          <label for="bookName">Book Name:</label>
          <select id="bookName" name="bookName" onchange="updatePrice()" required>
            <option value="">-- Select Book --</option>
            <%
              while(rs.next()) {
            %>
              <option value="<%= rs.getString("bookname") %>" data-price="<%= rs.getDouble("price") %>">
                <%= rs.getString("bookname") %>
              </option>
            <% } %>
          </select>
        </div>

        <!-- Book Price (auto-filled) -->
        <div class="form-group">
          <label for="price">Price (Rs.):</label>
          <input type="text" id="price" name="price" readonly>
        </div>

        <!-- Quantity -->
        <div class="form-group">
          <label for="quantity">Quantity:</label>
          <input type="number" id="quantity" name="quantity" min="1" value="1" onchange="calculateTotal()" required>
        </div>

        <!-- Total Amount -->
        <div class="form-group">
          <label for="total">Total (Rs.):</label>
          <input type="text" id="total" name="total" readonly>
        </div>

        <!-- Submit -->
        <button type="submit" class="submit-btn">Generate Bill</button>
      </form>
    </section>
  </main>

  <script>
    function updatePrice() {
      const bookSelect = document.getElementById("bookName");
      const priceField = document.getElementById("price");
      const selectedOption = bookSelect.options[bookSelect.selectedIndex];

      if (selectedOption.value !== "") {
        priceField.value = selectedOption.getAttribute("data-price");
      } else {
        priceField.value = "";
      }
      calculateTotal();
    }

    function calculateTotal() {
      const price = parseFloat(document.getElementById("price").value) || 0;
      const quantity = parseInt(document.getElementById("quantity").value) || 0;
      document.getElementById("total").value = price * quantity;
    }
  </script>
</body>
</html>
<%
   rs.close();
   st.close();
   con.close();
%>

