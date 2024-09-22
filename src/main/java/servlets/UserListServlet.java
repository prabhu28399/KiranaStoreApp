package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

@WebServlet("/adminUsers")
public class UserListServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> users = new ArrayList<>();
        String jdbcUrl = "jdbc:mysql://localhost:3306/youtube";
        String jdbcUsername = "root";
        String jdbcPassword = "root";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection connection = DriverManager.getConnection(jdbcUrl, jdbcUsername, jdbcPassword);
                 PreparedStatement userStmt = connection.prepareStatement("SELECT id, uname, uemail, umobile FROM users")) {

                ResultSet userResultSet = userStmt.executeQuery();
                while (userResultSet.next()) {
                    int id = userResultSet.getInt("id");
                    String userName = userResultSet.getString("uname");
                    String email = userResultSet.getString("uemail");
                    String mobile = userResultSet.getString("umobile");
                    users.add(new User(id, userName, email, mobile));
                }
            }
        } catch (Exception e) {
            e.printStackTrace(); // Print stack trace for debugging
        }

        request.setAttribute("users", users);
        request.getRequestDispatcher("AdminUsers.jsp").forward(request, response);
    }
}
