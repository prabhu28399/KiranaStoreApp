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

@WebServlet("/adminDashboard")
public class AdminDashboardServlet extends HttpServlet {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/youtube?useSSL=false&serverTimezone=UTC"; // Adjust if needed
    private static final String JDBC_USERNAME = "root";
    private static final String JDBC_PASSWORD = "root";

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int adminCount = 0;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
                 PreparedStatement preparedStatement = connection.prepareStatement("SELECT COUNT(*) FROM users WHERE role = 'admin'")) {
                 
                ResultSet resultSet = preparedStatement.executeQuery();
                if (resultSet.next()) {
                    adminCount = resultSet.getInt(1); // Get the count of admins
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Set the admin count as a request attribute and forward to the JSP
        request.setAttribute("adminCount", adminCount);
        request.getRequestDispatcher("adminDashboard.jsp").forward(request, response);
    }
}
