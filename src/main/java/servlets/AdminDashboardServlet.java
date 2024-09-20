package servlets;

import dao.AdminDAO;
import model.Shop;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import java.io.IOException;
import java.util.List;

@WebServlet("/adminDashboard")
public class AdminDashboardServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AdminDAO adminDAO = new AdminDAO();
        int totalUsers = adminDAO.getTotalUsers();
        int totalShops = adminDAO.getTotalShops();
        List<Shop> shopList = adminDAO.getAllShops();

        request.setAttribute("totalUsers", totalUsers);
        request.setAttribute("totalShops", totalShops);
        request.setAttribute("shopList", shopList);

        RequestDispatcher dispatcher = request.getRequestDispatcher("admin_dashboard.jsp");
        dispatcher.forward(request, response);
    }
}
