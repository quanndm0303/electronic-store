/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.authen;

import constant.CommonConst;
import dal.implement.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;

/**
 *
 * @author Acer
 */
public class AuthenticationController extends HttpServlet {

    AccountDAO acountDAO = new AccountDAO();

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
        String action = request.getParameter("action") != null
                ? request.getParameter("action")
                : "";
        String url;
        switch (action) {
            case "login":
                url = "view/authen/login.jsp";
                break;
            case "logout":
                url = logOut(request, response);
                break;
            case "signup":
                url = "view/authen/sign-up.jsp";
                break;
            default:
                url = "home";
        }
        request.getRequestDispatcher(url).forward(request, response);
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
        String action = request.getParameter("action") != null
                ? request.getParameter("action")
                : "";
        String url;
        switch (action) {
            case "login":
                url = loginDoPost(request, response);
                break;
            case "signup":
                url = signUp(response, request);
                break;
            default:
                url = "home";
        }
        request.getRequestDispatcher(url).forward(request, response);

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

    private String loginDoPost(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        String url;
        //get ve cac thong tin user
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        //check infor valid ?
        Account account = Account.builder()
                .username(username)
                .password(password)
                .build();
        Account accFoundByUsernamePass = acountDAO.findByUsernameAndPass(account);
        //true => homw (set account vao session)
        if (accFoundByUsernamePass != null) {
            session.setAttribute(CommonConst.SESSION_ACCOUNT, accFoundByUsernamePass);
            url = "home";
        } else {
            request.setAttribute("error", "Username or Password error! ");
            url = "view/authen/login.jsp";
        }
        //false => quay tro lai login (set error)
        return url;
    }

    private String logOut(HttpServletRequest request, HttpServletResponse response) {
        request.getSession().removeAttribute(CommonConst.SESSION_ACCOUNT);
        return "home";
    }

    private String signUp(HttpServletResponse response, HttpServletRequest request) {
        String url;
        //get ve info of user
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String passwordRepeat = request.getParameter("passwordRepeat");
        String email = request.getParameter("email");
        //check duplicated user
        Account account = Account.builder()
                .username(username)
                .password(password)
                .email(email)
                .build();
        //check password Repeat
        if (password.equals(passwordRepeat)) {
            boolean isExistUsername = acountDAO.checkUsernameExist(account);

            //true(set thong bao loi) --> Sign Up
            if (isExistUsername) {
                request.setAttribute("error", "Username is valid !");
                url = "view/authen/sign-up.jsp";
            } else {
                //false --> Home(Ghi tai khoan vao trong DB)
                acountDAO.insert(account);
                url = "home";
            }
        } else {
            request.setAttribute("error", "Password is wrong !");
            url = "view/authen/sign-up.jsp";
        }
        
        return url;
    }

}
