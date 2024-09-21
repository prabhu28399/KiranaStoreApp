package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import utils.DatabaseUtils;

public class UserDAO {

    // Method to validate user login
    public String validateUser(String usernameOrEmail, String password) {
        String role = null;
        // Prepare SQL query to check user credentials
        String query = "SELECT role FROM users WHERE (uname = ? OR uemail = ?) AND upwd = ?"; 
        // Ensure password is hashed and compared, not in plain text

        try (Connection conn = DatabaseUtils.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            // Set parameters for the prepared statement
            stmt.setString(1, usernameOrEmail);
            stmt.setString(2, usernameOrEmail); // Check both username and email
            stmt.setString(3, password); // This should be the hashed version of the password

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                role = rs.getString("role"); // Retrieve user role
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Consider logging the error or handling it appropriately
        }
        return role;
    }
}
