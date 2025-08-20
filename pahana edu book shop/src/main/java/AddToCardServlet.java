import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet("/AddToCardServlet")
public class AddToCardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // Get book details from form
        String bookname = request.getParameter("bookname");
        String authorname = request.getParameter("authorname");
        String edition = request.getParameter("edition");
        String yearStr = request.getParameter("year");
        String qtyStr = request.getParameter("quantity");
        String priceStr = request.getParameter("price");
        String image = request.getParameter("image");

        int year = 0;
        int quantity = 1;
        double price = 0;

        try {
            if (yearStr != null && !yearStr.isEmpty()) {
                year = Integer.parseInt(yearStr);
            }
            if (qtyStr != null && !qtyStr.isEmpty()) {
                quantity = Integer.parseInt(qtyStr);
            }
            if (priceStr != null && !priceStr.isEmpty()) {
                price = Double.parseDouble(priceStr);
            }
        } catch (NumberFormatException e) {
            out.println("<h3 style='color:red;'>Invalid number format!</h3>");
            return;
        }

        try {
            // Connect to database
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/pahana_edu","root","");

            // Insert into addtocard table
            String sql = "INSERT INTO addtocard (bookname, authorname, edition, year, quantity, price, image) " +
                         "VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, bookname);
            ps.setString(2, authorname);
            ps.setString(3, edition);
            ps.setInt(4, year);
            ps.setInt(5, quantity);
            ps.setDouble(6, price);
            ps.setString(7, image);

            int result = ps.executeUpdate();

            if(result > 0) {
                out.println("<script>alert('Book added to cart successfully!'); window.location='home.jsp';</script>");
            } else {
                out.println("<script>alert('Failed to add book to cart.'); window.location='home.jsp';</script>");
            }

            ps.close();
            con.close();
        } catch(Exception e) {
            out.println("<h3 style='color:red;'>Database Error: " + e.getMessage() + "</h3>");
            e.printStackTrace(out);
        }
    }
}
