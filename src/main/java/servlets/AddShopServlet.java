package servlets;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dao.ShopDAO;
import model.Shop;

@WebServlet("/addShop")
public class AddShopServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String shopName = request.getParameter("shopName");

        Shop shop = new Shop();
        shop.setShopName(shopName);  // Assuming you have a setter for shopName

        ShopDAO shopDAO = new ShopDAO();
        shopDAO.addShop(shop);  // This method should handle adding the shop to the database

        response.sendRedirect("adminDashboard");  // Redirect to the admin dashboard or another page
    }
}
