import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/BillingServlet")
public class BillingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String customerId = request.getParameter("customerId");
        String bookName = request.getParameter("bookName");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        double total = Double.parseDouble(request.getParameter("total"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/pahana_edu", "root", "");

            String sql = "INSERT INTO sales (customerId, bookName, price, quantity, total) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, customerId);
            ps.setString(2, bookName);
            ps.setDouble(3, price);
            ps.setInt(4, quantity);
            ps.setDouble(5, total);

            int result = ps.executeUpdate();

            if (result > 0) {
                out.println("<h3 style='color:green;'>Bill generated successfully!</h3>");
            } else {
                out.println("<h3 style='color:red;'>Failed to generate bill.</h3>");
            }

            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace(out);
            out.println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");
        }
    }
}
