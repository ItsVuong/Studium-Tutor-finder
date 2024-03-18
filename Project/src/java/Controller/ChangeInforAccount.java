/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.DAO;
import DAL.TutorDAO;
import Models.Account;
import Models.InputValidation;
import Models.Tutor;
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
public class ChangeInforAccount extends HttpServlet {

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
            out.println("<title>Servlet ChangeInforAccount</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangeInforAccount at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("ChangeInfoAccount.jsp").forward(request, response);
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
        DAO dao = new DAO();

        String fullname = request.getParameter("fullname");
        String username = request.getParameter("username");
        String phone = request.getParameter("phone");
        String img = request.getParameter("img");

        HttpSession session = request.getSession();
        String oldImg = (String) session.getAttribute("img");

        boolean error = false;

        if (!InputValidation.isFullnameValid(fullname)) {
            request.setAttribute("fullnameError", "Tên không hợp lệ.");
            if (img == null || img.isEmpty()) {
                img = oldImg; // Sử dụng giá trị của oldImg nếu img bị null hoặc rỗng
            }
            error = true;
        }

        if (!InputValidation.isPhoneValid(phone)) {
            request.setAttribute("phoneError", "Số điện thoại không hợp lệ!");
            if (img == null || img.isEmpty()) {
                img = oldImg; // Sử dụng giá trị của oldImg nếu img bị null hoặc rỗng
            }
            error = true;
        }
        else {
            // Kiểm tra nếu số điện thoại đã tồn tại cho người dùng khác
            Account existingUserWithPhone = dao.getPhone(phone);
            if (existingUserWithPhone != null && !existingUserWithPhone.getUserName().equals(username)) {
                request.setAttribute("phoneError", "Số điện thoại đã tồn tại cho người dùng khác");
                if (img == null || img.isEmpty()) {
                    img = oldImg; // Sử dụng giá trị của oldImg nếu img bị null hoặc rỗng
                }
                error = true;
            }
        }

        if (error) {
            img = (img == null || img.isEmpty()) ? oldImg : img;

            if (img == null || img.isEmpty()) {
                out.print("Not Ok");
            }
            else {
                out.print("Ok");
            }
            request.getRequestDispatcher("ChangeInfoAccount.jsp").forward(request, response);
        }
        else {
            try {
                img = (img == null || img.isEmpty()) ? oldImg : img;

                if (img == null || img.isEmpty()) {
                    out.print("Not Ok 2");
                }
                else {
                    out.print("Ok 2");
                }

                dao.UpdateUser(username, fullname, phone,img);
                session.setAttribute("img", img);
                request.setAttribute("successMessage", "Đổi thông tin mới thành công");
            }
            catch (NoSuchAlgorithmException ex) {
                Logger.getLogger(ChangeInforAccount.class.getName()).log(Level.SEVERE, null, ex);
            }

             Account newAccount = dao.getUser(username);
        Tutor tutor = (Tutor) session.getAttribute("tutor");
        session.setAttribute("tutor", tutor);
        session.setAttribute("userObj", newAccount);

        request.getRequestDispatcher("InfoAccount.jsp").forward(request, response);
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
