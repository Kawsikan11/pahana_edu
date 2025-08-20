<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Book</title>
<link rel="stylesheet" href="addbook.css">
</head>
<body>
    <h2>Add Book Details</h2>
    <form action="AddBookServlet" method="post" enctype="multipart/form-data">
        <label>Book Name:</label>
        <input type="text" name="bookname" required><br><br>

        <label>Author Name:</label>
        <input type="text" name="authorname" required><br><br>

        <label>Edition:</label>
        <input type="text" name="edition"><br><br>

        <label>Year:</label>
        <input type="number" name="year"><br><br>

        <label>Price (Rs.):</label>
        <input type="number" name="price" step="0.01" required><br><br>

        <label>Quantity:</label>
        <input type="number" name="quantity" required><br><br>

        <label>Image:</label>
        <input type="file" name="image" accept="image/*"><br><br>

        <input type="submit" value="Add Book">
    </form>
</body>
</html>
