package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Shop;
import utils.DatabaseUtils;

public class ShopDAO {

    // Retrieve all shops from the database
    public List<Shop> getAllShops() {
        List<Shop> shops = new ArrayList<>();
        String query = "SELECT id, shop_name FROM shops";  // Adjust this query if you have more fields

        try (Connection conn = DatabaseUtils.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Shop shop = new Shop();
                shop.setId(rs.getInt("id")); // Assuming you have an ID column
                shop.setShopName(rs.getString("shop_name"));
                // Add other fields if necessary
                shops.add(shop);
            }
        } catch (Exception e) {
            e.printStackTrace(); // Consider using a logger for better error tracking
        }
        return shops;
    }

    // Add a new shop to the database
    public void addShop(Shop shop) {
        String insertSQL = "INSERT INTO shops (shop_name) VALUES (?)"; // Add more fields if necessary

        try (Connection conn = DatabaseUtils.getConnection();
             PreparedStatement stmt = conn.prepareStatement(insertSQL)) {

            stmt.setString(1, shop.getShopName());
            // Set other fields if needed
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace(); // Consider using a logger
        }
    }

    // Update shop details
    public void updateShop(Shop shop) {
        String updateSQL = "UPDATE shops SET shop_name = ? WHERE id = ?"; // Modify based on table structure

        try (Connection conn = DatabaseUtils.getConnection();
             PreparedStatement stmt = conn.prepareStatement(updateSQL)) {

            stmt.setString(1, shop.getShopName());
            stmt.setInt(2, shop.getId()); // Assuming `id` is the primary key
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace(); // Consider using a logger
        }
    }

    // Delete a shop by ID
    public void deleteShop(int shopId) {
        String deleteSQL = "DELETE FROM shops WHERE id = ?";

        try (Connection conn = DatabaseUtils.getConnection();
             PreparedStatement stmt = conn.prepareStatement(deleteSQL)) {

            stmt.setInt(1, shopId);
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace(); // Consider using a logger
        }
    }
}
