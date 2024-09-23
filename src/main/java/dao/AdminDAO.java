package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Shop;
import utils.DatabaseUtils;

public class AdminDAO {
    
    // Retrieve all shops from the database
    public List<Shop> getAllShops() {
        List<Shop> shops = new ArrayList<>();
        String query = "SELECT shop_name FROM shops"; // Ensure your SQL matches your schema

        try (Connection conn = DatabaseUtils.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Shop shop = new Shop();
                shop.setShopName(rs.getString("shop_name")); // Ensure setShopName method exists
                shops.add(shop);
            }
        } catch (Exception e) {
            e.printStackTrace(); // Consider logging this exception
        }
        return shops;
    }

    // Get the total number of users
    public int getTotalUsers() {
        int totalUsers = 0;
        String query = "SELECT COUNT(*) FROM users";

        try (Connection conn = DatabaseUtils.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            if (rs.next()) {
                totalUsers = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace(); // Consider logging this exception
        }
        return totalUsers;
    }

    // Get the total number of shops
    public int getTotalShops() {
        int totalShops = 0;
        String query = "SELECT COUNT(*) FROM shops";

        try (Connection conn = DatabaseUtils.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            if (rs.next()) {
                totalShops = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace(); // Consider logging this exception
        }
        return totalShops;
    }
}
