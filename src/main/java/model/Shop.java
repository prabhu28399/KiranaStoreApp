package model;

public class Shop {
    private int id;          // Assuming you'll have an ID for each shop
    private String shopName; // Name of the shop

    // Constructor
    public Shop() {}

    // Getters and setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getShopName() {
        return shopName;
    }

    public void setShopName(String shopName) {
        this.shopName = shopName;
    }
}
