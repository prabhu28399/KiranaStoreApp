package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/adminLogin")
public class AdminLoginServlet extends HttpServlet {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/youtube?useSSL=false&serverTimezone=UTC"; // Change if needed
    private static final String JDBC_USERNAME = "root";
    private static final String JDBC_PASSWORD = "root";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uname = request.getParameter("username");
        String upwd = request.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Load the JDBC driver

            try (Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
                 PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM users WHERE uname=? AND upwd=? AND role='admin'")) {

                preparedStatement.setString(1, uname);
                preparedStatement.setString(2, upwd);
                ResultSet resultSet = preparedStatement.executeQuery();
                
                if (resultSet.next()) {
                    // Login successful, redirect to admin dashboard
                    response.sendRedirect("adminDashboard");
                } else {
                    // Login failed, set error message and redirect back to login
                    request.setAttribute("message", "Invalid credentials. Please try again.");
                    request.getRequestDispatcher("adminLogin.jsp").forward(request, response);
                }
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            request.setAttribute("message", "JDBC Driver not found: " + e.getMessage());
            request.getRequestDispatcher("adminLogin.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            // Set an error message for debugging
            request.setAttribute("message", "An error occurred: " + e.getMessage());
            request.getRequestDispatcher("adminLogin.jsp").forward(request, response);
        }
    }
}
