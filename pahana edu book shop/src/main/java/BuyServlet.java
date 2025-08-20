import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet("/BuyServlet")
public class BuyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // Get logged-in username from session
        HttpSession session = request.getSession(false);
        String customerName = null;
        if (session != null) {
            customerName = (String) session.getAttribute("username");
        }
        if (customerName == null) {
            out.println("<script>alert('Please login first!'); window.location='login.jsp';</script>");
            return;
        }

        // Get book details from hidden inputs
        int id = Integer.parseInt(request.getParameter("id"));
        String bookname = request.getParameter("bookname");
        String authorname = request.getParameter("authorname");
        String edition = request.getParameter("edition");
        int year = Integer.parseInt(request.getParameter("year"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        double price = Double.parseDouble(request.getParameter("price"));
        String image = request.getParameter("image");

        // Current date and time
        LocalDateTime now = LocalDateTime.now();
        String date = now.toLocalDate().toString();
        String time = now.toLocalTime().format(DateTimeFormatter.ofPattern("HH:mm:ss"));

        Connection con = null;
        PreparedStatement ps = null;
        PreparedStatement ps2 = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/pahana_edu","root","");

            // Insert into purchase table including customer_name
            String sql = "INSERT INTO purchase (bookname, authorname, edition, year, quantity, price, image, customer_name, purchase_date, purchase_time) " +
                         "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            ps = con.prepareStatement(sql);
            ps.setString(1, bookname);
            ps.setString(2, authorname);
            ps.setString(3, edition);
            ps.setInt(4, year);
            ps.setInt(5, quantity);
            ps.setDouble(6, price);
            ps.setString(7, image);
            ps.setString(8, customerName);
            ps.setString(9, date);
            ps.setString(10, time);

            int result = ps.executeUpdate();

            if(result > 0) {
                out.println("<script>alert('Purchase successful!'); window.location='viewcards.jsp';</script>");
            } else {
                out.println("<script>alert('Purchase failed.'); window.location='viewcards.jsp';</script>");
            }

            // Remove from addtocard table after purchase
            ps2 = con.prepareStatement("DELETE FROM addtocard WHERE id=?");
            ps2.setInt(1, id);
            ps2.executeUpdate();

        } catch(Exception e) {
            out.println("<h3 style='color:red;'>Database Error: " + e.getMessage() + "</h3>");
            e.printStackTrace(out);
        } finally {
            try { if (ps != null) ps.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (ps2 != null) ps2.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (con != null) con.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    }
}
