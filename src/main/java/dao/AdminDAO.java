package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Shop;
import utils.DatabaseUtils;

public class AdminDAO {
    public List<Shop> getAllShops() {
        List<Shop> shops = new ArrayList<>();
        try (Connection conn = DatabaseUtils.getConnection();
             PreparedStatement stmt = conn.prepareStatement("SELECT shop_name FROM shops")) {

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Shop shop = new Shop();
                shop.setShopName(rs.getString("shop_name"));
                shops.add(shop);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return shops;
    }

    public int getTotalUsers() {
        int totalUsers = 0;
        try (Connection conn = DatabaseUtils.getConnection();
             PreparedStatement stmt = conn.prepareStatement("SELECT COUNT(*) FROM users")) {

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                totalUsers = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return totalUsers;
    }

    public int getTotalShops() {
        int totalShops = 0;
        try (Connection conn = DatabaseUtils.getConnection();
             PreparedStatement stmt = conn.prepareStatement("SELECT COUNT(*) FROM shops")) {

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                totalShops = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return totalShops;
    }
}
