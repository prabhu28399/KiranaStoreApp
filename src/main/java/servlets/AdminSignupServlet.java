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
import jakarta.servlet.RequestDispatcher;

@WebServlet("/adminSignup")
public class AdminSignupServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uname = request.getParameter("username");
        String uemail = request.getParameter("email");
        String upwd = request.getParameter("password");
        String umobile = request.getParameter("mobile");

        // Database connection setup
        String jdbcURL = "jdbc:mysql://localhost:3306/youtube";  
        String jdbcUsername = "root";
        String jdbcPassword = "root";
        
        String insertAdminSQL = "INSERT INTO users (uname, uemail, upwd, umobile, role) VALUES (?, ?, ?, ?, ?)";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
            PreparedStatement preparedStatement = connection.prepareStatement(insertAdminSQL);
            preparedStatement.setString(1, uname);
            preparedStatement.setString(2, uemail);
            preparedStatement.setString(3, upwd);
            preparedStatement.setString(4, umobile);
            preparedStatement.setString(5, "admin");  

            int result = preparedStatement.executeUpdate();

            if (result > 0) {
                request.setAttribute("message", "Admin registration successful! You can now log in.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("adminLogin.jsp");
                dispatcher.forward(request, response);
            } else {
                response.getWriter().println("Admin signup failed! Please try again.");
            }

            preparedStatement.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
