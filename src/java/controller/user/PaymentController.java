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
public class PaymentController extends HttpServlet {

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
            case "add-product":
                addProduct(request, response);
                break;
            case "change-quantity":
                changeQuantity(request, response);
                break;
            case "delete":
                delete(request, response);
                break;
//            case "check-out":
//                checkOut(request, response);
//                break;
            default:
                throw new AssertionError();
        }
        response.sendRedirect("payment");
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

    private void addProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //get ve session
        HttpSession session = request.getSession();
        //get ve product id
        int id = Integer.parseInt(request.getParameter("id"));
         session.setAttribute("idProduct", id);
        //get ve quantity
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        session.setAttribute("quantityProduct",quantity);

        //lay ve cart o tren session
        Orders cart = (Orders) session.getAttribute("cart");

        if (cart == null) {
            cart = new Orders();
        }
        OrderDetails od = new OrderDetails();
        od.setProductId(id);
        od.setQuantity(quantity);

        //them orderdetails vao trong cart
        addOrderDetailsToOrder(od, cart);
        session.setAttribute("cart", cart);
        response.sendRedirect("payment");
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

    private void changeQuantity(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        Orders cart = (Orders) session.getAttribute("cart");
        try {
            //get ve product id
            int id = Integer.parseInt(request.getParameter("id"));
           
            //get ve quantity
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            
            //thay doi quantity
            for (OrderDetails obj : cart.getListOrderDetails()) {
                if (obj.getProductId() == id) {
                    obj.setQuantity(quantity);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        session.setAttribute("cart", cart);
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        HttpSession session = request.getSession();
        Orders cart = (Orders) session.getAttribute("cart");
        OrderDetails od = null;
        for (OrderDetails obj : cart.getListOrderDetails()) {
            if (obj.getProductId() == id) {
                od = obj;
            }
        }
        cart.getListOrderDetails().remove(od);
        session.setAttribute("cart", cart);
    }

//    private void checkOut(HttpServletRequest request, HttpServletResponse response) {
//        //lay ve  cart
//        HttpSession session = request.getSession();
//        Orders cart = (Orders) session.getAttribute("cart");
//
//        //lay ve account id
//        int id = ((Account) session.getAttribute(CommonConst.SESSION_ACCOUNT)).getId();
//
//        //get ra lis product
//        List<Product> list = (List<Product>) session.getAttribute(CommonConst.SESSION_PRODUCT);
//
//        //amount
//        int amount = calculateAmount(cart, list);
//
//        //inser order
//        //set info
//        cart.setAccountId(id);
//        cart.setTotalPrice(amount);
//        cart.setCreateAt(Timestamp.valueOf(LocalDateTime.now()));
//
//        OrderDAO orderDAO = new OrderDAO();
//        OrderDetailsDAO odDAO = new OrderDetailsDAO();
//        int orderID = orderDAO.insert(cart);
//        for (OrderDetails obj : cart.getListOrderDetails()) {
//            obj.setOrderId(orderID);
//            odDAO.insert(obj);
//        }
//
//        //tru di so luong san pham o trong co so du lieu
//        setQuantityAfterCheckOut(list, cart);
//        //Mua xong thi remove cart
//        session.removeAttribute("cart");
//    }
//
//    private int calculateAmount(Orders cart, List<Product> list) {
//        int amount = 0;
//        for (OrderDetails obj : cart.getListOrderDetails()) {
//            amount += (obj.getQuantity() * findPriceById(list, obj.getProductId()));
//        }
//        return amount;
//    }
//
//    private float findPriceById(List<Product> list, int productId) {
//        for (Product product : list) {
//            if (product.getId() == productId) {
//                return product.getPrice();
//            }
//        }
//        return 0;
//    }
//
//    private void setQuantityAfterCheckOut(List<Product> productList, Orders cart) {
//        for (OrderDetails orderDetail : cart.getListOrderDetails()) {
//            int orderedProductId = orderDetail.getProductId();
//            int orderedQuantity = orderDetail.getQuantity();
//
//            for (Product product : productList) {
//                if (product.getId() == orderedProductId) {
//                    int currentQuantity = product.getQuantity();
//                    int updatedQuantity = currentQuantity - orderedQuantity;
//                    pDao.updateQuantity(product,updatedQuantity);
//                    break; // Thoát vòng lặp khi tìm thấy sản phẩm đã được cập nhật
//                }
//            }
//        }
//    }

}
