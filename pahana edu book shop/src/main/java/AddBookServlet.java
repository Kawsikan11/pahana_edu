import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/AddBookServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024,    // 1MB
                 maxFileSize = 5 * 1024 * 1024,      // 5MB
                 maxRequestSize = 10 * 1024 * 1024)  // 10MB
public class AddBookServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIR = "uploads";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            String bookname = request.getParameter("bookname");
            String authorname = request.getParameter("authorname");
            String edition = request.getParameter("edition");
            String yearStr = request.getParameter("year");
            String quantityStr = request.getParameter("quantity");
            String priceStr = request.getParameter("price");

            int year = 0, quantity = 0;
            double price = 0.0;

            if (yearStr != null && !yearStr.isEmpty()) year = Integer.parseInt(yearStr);
            if (quantityStr != null && !quantityStr.isEmpty()) quantity = Integer.parseInt(quantityStr);
            if (priceStr != null && !priceStr.isEmpty()) price = Double.parseDouble(priceStr);

            // Handle image upload
            Part filePart = request.getPart("image");
            String fileName = filePart != null ? new File(filePart.getSubmittedFileName()).getName() : null;

            String applicationPath = request.getServletContext().getRealPath("");
            String uploadFilePath = applicationPath + File.separator + UPLOAD_DIR;
            File uploadDir = new File(uploadFilePath);
            if (!uploadDir.exists()) uploadDir.mkdir();

            if (fileName != null && !fileName.isEmpty()) {
                filePart.write(uploadFilePath + File.separator + fileName);
            }

            // Connect to database
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pahana_edu", "root", "");

            // Insert into books table
            String sql = "INSERT INTO books (bookname, authorname, edition, year, quantity, price, image) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, bookname);
            ps.setString(2, authorname);
            ps.setString(3, edition);
            ps.setInt(4, year);
            ps.setInt(5, quantity);
            ps.setDouble(6, price);
            ps.setString(7, (fileName != null ? UPLOAD_DIR + "/" + fileName : null));

            int result = ps.executeUpdate();
            if (result > 0) {
                out.println("<h3 style='color:green;'>Book added successfully!</h3>");
            } else {
                out.println("<h3 style='color:red;'>Failed to add book.</h3>");
            }

            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace(out);
            out.println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }
}
