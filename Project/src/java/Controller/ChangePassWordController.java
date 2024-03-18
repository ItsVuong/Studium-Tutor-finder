/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.DAO;
import DAL.UserDAO;
import Models.Account;
import Models.InputValidation;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Acer
 */
public class ChangePassWordController extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ChangePassWordController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangePassWordController at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("ChangePassword.jsp").forward(request, response);
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
        PrintWriter out = response.getWriter();
        DAO d = new DAO();
        String user = request.getParameter("user");
        String old_pw = request.getParameter("old_pw");
        String pw1 = request.getParameter("pw1");
        String pw2 = request.getParameter("pw2");
        HttpSession session = request.getSession();
        Account userAccount = null;
        System.out.println(user);
        try {
            userAccount = new UserDAO().userLogin(user, old_pw);
            out.print(user);
            out.print(old_pw);

           if (userAccount != null) {
                if (pw1.equals(pw2)) {
             
                    if (InputValidation.isPasswordValid(pw2)) {
                        d.changePassword(pw2, user);
                        request.setAttribute("successMessage", "Đổi mật khẩu mới thành công");
                        request.getRequestDispatcher("InfoAccount.jsp").forward(request, response);
                    }
                    else {
                        request.setAttribute("mess", "Mật khẩu phải chứa 8 ký tự, có sử dụng ít nhất 1 ký tự đặc biệt và 1 chữ số.");
                        request.getRequestDispatcher("ChangePassword.jsp").forward(request, response);
                    }
                }
                else {
                    session.setAttribute("mess", "2 mật khẩu mới không đều nhau");
                    response.sendRedirect("ChangePassword.jsp");
                }
            }
            else {
                session.setAttribute("mess", "Sai mật khẩu cũ");
                response.sendRedirect("ChangePassword.jsp");
            }
        }
        catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("mess", "Lỗi xác nhận mật khẩu");
            response.sendRedirect("ChangePassword.jsp");
        }
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
