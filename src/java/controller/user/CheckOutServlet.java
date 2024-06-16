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
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.time.LocalDateTime;
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
public class CheckOutServlet extends HttpServlet {

    ProductDAO pDao = new ProductDAO();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CheckOutServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckOutServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

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
         
        request.getRequestDispatcher("view/user/payment/cart.jsp").forward(request, response);
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
        String action = request.getParameter("action") == null
                ? ""
                : request.getParameter("action");
        switch (action) {

            case "check-out":
                checkOut(request, response);
                break;
            default:
                throw new AssertionError();
        }
        response.sendRedirect("checkout");
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

    private void checkOut(HttpServletRequest request, HttpServletResponse response) {
        //lay ve  cart
        HttpSession session = request.getSession();
//        Orders cart = (Orders) session.getAttribute("cart");

        //add
        //get ve id
        int id = (int) session.getAttribute("idProduct");
        //get ve quantity
        int quantity = (int) session.getAttribute("quantityProduct");

        //lay ve cart o tren session
        Orders cart = (Orders) session.getAttribute("cart");

        if (cart == null) {
            cart = new Orders();
        }
        OrderDetails od = new OrderDetails();
        od.setProductId(id);
        od.setQuantity(quantity);

//        //them orderdetails vao trong cart
//        addOrderDetailsToOrder(od, cart);
        session.setAttribute("cart", cart);
//        //end add

        //lay ve account id
        int accountId = ((Account) session.getAttribute(CommonConst.SESSION_ACCOUNT)).getId();

        //get ra lis product
        List<Product> list = (List<Product>) session.getAttribute(CommonConst.SESSION_PRODUCT);

        //price
        int total = calculateTotalPrice(cart, list);

        //inser order
        //set info
        cart.setAccountId(accountId);
        cart.setTotalPrice(total);
        cart.setCreateAt(Timestamp.valueOf(LocalDateTime.now()));

        OrderDAO orderDAO = new OrderDAO();
        OrderDetailsDAO odDAO = new OrderDetailsDAO();
        int orderID = orderDAO.insert(cart);
        for (OrderDetails obj : cart.getListOrderDetails()) {
            obj.setOrderId(orderID);
            odDAO.insert(obj);
        }
        session.setAttribute("line", "Successfully !");
        //tru di so luong san pham o trong co so du lieu
        setQuantityAfterCheckOut(list, cart);
        //Mua xong thi remove cart
        session.removeAttribute("cart");
    }

    private int calculateTotalPrice(Orders cart, List<Product> list) {
        int amount = 0;
        for (OrderDetails obj : cart.getListOrderDetails()) {
            amount += (obj.getQuantity() * findPriceById(list, obj.getProductId()));
        }
        return amount;
    }

    private float findPriceById(List<Product> list, int productId) {
        for (Product product : list) {
            if (product.getId() == productId) {
                return product.getPrice();
            }
        }
        return 0;
    }

    private void setQuantityAfterCheckOut(List<Product> productList, Orders cart) {
        for (OrderDetails orderDetail : cart.getListOrderDetails()) {
            int orderedProductId = orderDetail.getProductId();
            int orderedQuantity = orderDetail.getQuantity();

            for (Product product : productList) {
                if (product.getId() == orderedProductId) {
                    int currentQuantity = product.getQuantity();
                    int updatedQuantity = currentQuantity - orderedQuantity;
                    pDao.updateQuantity(product, updatedQuantity);
                    break; // Thoát vòng lặp khi tìm thấy sản phẩm đã được cập nhật
                }
            }
        }
    }

    private void addOrderDetailsToOrder(OrderDetails od, Orders cart) {
        boolean isAdd = false;
        for (OrderDetails obj : cart.getListOrderDetails()) {
            if (obj.getProductId() == od.getProductId()) {
                obj.setQuantity(obj.getQuantity() + od.getQuantity());
                isAdd = true;
            }
        }
        if (isAdd == false) {
            cart.getListOrderDetails().add(od);
        }
    }

}
