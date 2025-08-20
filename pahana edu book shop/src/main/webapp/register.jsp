<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Registration</title>
<link rel="stylesheet" href="register.css">
</head>
<body>
    <div class="form-container">
        <h2>Register</h2>
        <form action="${pageContext.request.contextPath}/RegisterServlet" method="post">
            
            <label>Username:</label>
            <input type="text" name="username" required><br>

            <label>Password:</label>
            <input type="password" name="password" required><br>

            <label>Full Name:</label>
            <input type="text" name="name" required><br>

            <label>Address:</label>
            <input type="text" name="address"><br>

            <label>Telephone Number:</label>
            <input type="text" name="telephone_number"><br>

            <label>Role:</label>
            <input type="text" name="roll"><br>

            <input type="submit" value="Register">
        </form>
    </div>
</body>
</html>
