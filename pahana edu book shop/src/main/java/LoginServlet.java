import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Connect to database
            Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/pahana_edu", "root", "");

            // Prepare SQL query to check user
            PreparedStatement stmt = conn.prepareStatement(
                    "SELECT roll FROM users WHERE username=? AND password=?");
            stmt.setString(1, username);
            stmt.setString(2, password);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String role = rs.getString("roll");

                // Store username in session
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                session.setAttribute("roll", role);

                // Redirect based on role
                if ("admin".equalsIgnoreCase(role)) {
                    response.sendRedirect("admin.jsp");
                } else if ("cashier".equalsIgnoreCase(role)) {
                    response.sendRedirect("cashier.jsp");
                } else {
                    response.sendRedirect("customer.jsp");
                }

            } else {
                // Invalid login credentials
                out.println("<html><head><title>Login Failed</title></head><body>");
                out.println("<h2>Invalid username or password!</h2>");
                out.println("<a href='login.jsp'>Try Again</a>");
                out.println("</body></html>");
            }

            // Close connections
            rs.close();
            stmt.close();
            conn.close();

        } catch (Exception e) {
            out.println("<html><head><title>Error</title></head><body>");
            out.println("Database error: " + e.getMessage());
            e.printStackTrace(out);
            out.println("</body></html>");
        }
    }
}
