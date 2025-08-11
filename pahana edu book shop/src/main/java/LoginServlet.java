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
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pahana_edu", "root", "");

            // Prepare SQL query to check user
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM users WHERE username=? AND password=?");
            stmt.setString(1, username);
            stmt.setString(2, password);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                // User found, check if admin
                if ("admin".equalsIgnoreCase(username)) {
                    // Redirect admin user to admin.jsp
                    response.sendRedirect("admin.jsp");
                } else {
                    // For other users, display welcome message
                    out.println("<html><head><title>Login Successful</title></head><body>");
                    out.println("<h2>Login Successful! Welcome, " + username + "</h2>");
                    out.println("</body></html>");
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
