/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.DAO;
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
 * @author Asus
 */
public class ResetPassword extends HttpServlet {

    DAO d = new DAO();

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
        request.getRequestDispatcher("resetPassword.jsp").forward(request, response);
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
        String pwd = request.getParameter("password");
        String pwd2 = request.getParameter("password-2");
        boolean error = false;
        HttpSession session = request.getSession();

        if (!InputValidation.isPasswordValid(pwd)) {
            request.setAttribute("pwdError_1", "Mật khẩu phải chứa 8 ký tự, có sử dụng ít nhât 1 ký tự đặc biết và 1 chữ số.");
            error = true;
        } else if (!pwd2.equals(pwd)) {
            request.setAttribute("pwdError_2", "Mật khẩu nhập lại không khớp mật khẩu cũ.");
            error = true;
        }

        if (error) {
            request.setAttribute("email", (String) session.getAttribute("email"));
            request.getRequestDispatcher("resetPassword.jsp").forward(request, response);
        } else {
            try {
                d.changePasswordEmail(pwd, (String) session.getAttribute("email"));

            } catch (NoSuchAlgorithmException ex) {
                Logger.getLogger(ResetPassword.class.getName()).log(Level.SEVERE, null, ex);
            }
            request.getRequestDispatcher("login.jsp").forward(request, response);
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
