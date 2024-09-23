package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uname = request.getParameter("username"); // Update to match your input name
        String uemail = request.getParameter("email"); // Update to match your input name
        String upwd = request.getParameter("password"); // Update to match your input name
        String umobile = request.getParameter("mobile"); // Update to match your input name

        // Database connection setup
        String jdbcURL = "jdbc:mysql://localhost:3306/youtube";  // Change database if needed
        String jdbcUsername = "root";
        String jdbcPassword = "root";
        
        // Insert statement with role set to 'user'
        String insertUserSQL = "INSERT INTO users (uname, uemail, upwd, umobile, role) VALUES (?, ?, ?, ?, 'user')";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
            PreparedStatement preparedStatement = connection.prepareStatement(insertUserSQL);
            preparedStatement.setString(1, uname);
            preparedStatement.setString(2, uemail);
            preparedStatement.setString(3, upwd);
            preparedStatement.setString(4, umobile);

            int result = preparedStatement.executeUpdate();

            if (result > 0) {
                request.setAttribute("successMessage", "Registration successful! You can now log in.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                response.getWriter().println("Signup failed! Please try again.");
            }

            preparedStatement.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
