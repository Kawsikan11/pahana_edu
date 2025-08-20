<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Reports - Pahana Edu</title>
  <link rel="stylesheet" href="cashieracc.css?v=1.1" /> <!-- Cache bust -->
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
      <a href="cashieritem.jsp" class="nav-link">Items</a>
      <a href="cashiersrep.jsp" class="nav-link active ">Reports</a>
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



    <section>
      <p>Welcome to the Admin Panel. Select a section from the sidebar to get started.</p>
    </section>
  </main>
</body>
</html>
