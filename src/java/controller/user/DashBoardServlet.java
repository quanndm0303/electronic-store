/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

import constant.CommonConst;
import dal.implement.OrderDAO;
import dal.implement.OrderDetailsDAO;
import dal.implement.ProductDAO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;
import model.Orders;
import model.OrderDetails;
import model.Product;

/**
 *
 * @author Acer
 */
public class DashBoardServlet extends HttpServlet {

    OrderDAO oDAO = new OrderDAO();
    OrderDetailsDAO odDAO = new OrderDetailsDAO();
    ProductDAO pDAO = new ProductDAO();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        int accountId = ((Account) session.getAttribute(CommonConst.SESSION_ACCOUNT)).getId();
        //get ra order = accountID va get vao session
        List<Orders> cart = oDAO.findCartByAccountId(accountId);
        session.setAttribute("cartUser", cart);
        List<OrderDetails> odlist = new ArrayList<>();
        // Duyệt qua mỗi Orders trong cart
        for (Orders order : cart) {
            // Tìm và thêm tất cả OrderDetails tương ứng với Orders hiện tại vào odlist
            odlist.addAll(odDAO.findODByOrderId(order.getId()));
        }
        // Lưu odlist vào session
        session.setAttribute("orderUser", odlist);

        //get ra product theo orderDetailsID
        List<Product> listProduct = new ArrayList<>();
        for (OrderDetails obj : odlist) {
            listProduct.add(pDAO.findProductById(obj.getProductId()));
        }
        session.setAttribute("productUser", listProduct);
        request.getRequestDispatcher("view/user/dashboard/dashboard.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
