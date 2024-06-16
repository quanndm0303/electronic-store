/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.homepage;

import constant.CommonConst;
import dal.implement.CategoryDAO;
import dal.implement.ProductDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Category;
import model.PageControl;
import model.Product;

/**
 *
 * @author Acer
 */
public class ShopController extends HttpServlet {

    ProductDAO productDAO = new ProductDAO();
    CategoryDAO categoryDAO = new CategoryDAO();

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
        PageControl pageControl = new PageControl();
        List<Product> listProduct = findProductDoGet(request, pageControl);

        //set PageControl
        session.setAttribute("pageControl", pageControl);
        //get ve list product
        session.setAttribute(CommonConst.SESSION_PRODUCT, listProduct);
        //get ve list category
        List<Category> listCategory = categoryDAO.findAll();
        session.setAttribute(CommonConst.SESSION_CATEGORY, listCategory);

        request.getRequestDispatcher("view/shop.jsp").forward(request, response);
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

    private List<Product> findProductDoGet(HttpServletRequest request, PageControl pageControl) {
        //get ve page
        String page_Raw = request.getParameter("page");

        int page = 0;
        try {
            page = Integer.parseInt(page_Raw);
            if (page <= 0) {
                page = 1;
            }
        } catch (NumberFormatException e) {
            page = 1;
        }
        //get ve search
        HttpSession session = request.getSession();
        String actionSearch = request.getParameter("search") == null
                ? "default"
                : request.getParameter("search");

        //get list product
        List<Product> listProduct;
        //get request URL
        String requestURL = request.getRequestURL().toString();
        int totalRecord ;
        switch (actionSearch) {
            case "category":
                int categoryId = Integer.parseInt(request.getParameter("categoryId"));
                pageControl.setUrlPattern(requestURL + "?search=category&categoryId=" + categoryId + "&");
                session.setAttribute("cateId", categoryId);
                if (categoryId == -1) {
                    listProduct = productDAO.findAllProduct(page);
                    totalRecord = productDAO.findTotalRecordByName("");
                } else {
                    listProduct = productDAO.findByCategory(categoryId, page);
                    totalRecord = productDAO.findTotalRecordByCategory(categoryId);
                }
                break;
            case "searchByName":
                String keyword = request.getParameter("keyword");
                listProduct = productDAO.findByName(keyword, page);
                pageControl.setUrlPattern(requestURL + "?search=searchByName&keyword=" + keyword + "&");
                 totalRecord = productDAO.findTotalRecordByName(keyword);
                break;
            default:
                listProduct = productDAO.findAllProduct(page);
                pageControl.setUrlPattern(requestURL + "?");
               totalRecord = productDAO.findTotalRecordByName("");
        }
        //total record
        //total page
        int totalPage = (totalRecord % CommonConst.RECORD_PER_PAGE) == 0
                ? (totalRecord / CommonConst.RECORD_PER_PAGE)
                : (totalRecord / CommonConst.RECORD_PER_PAGE) + 1;
        //set total record. total page, page vao pageControl
        pageControl.setPage(page);
        pageControl.setTotalRecord(totalRecord);
        pageControl.setTotalPage(totalPage);
        return listProduct;
    }

}
