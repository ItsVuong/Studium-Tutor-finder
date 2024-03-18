package Controller;

import DAL.*;
import Models.*;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import Models.Account;

public class Login extends HttpServlet {

    UserDAO d = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getSession().setAttribute("errorMsg", null);
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        HttpSession session = request.getSession();

        Account userAccount = null;

        if (InputValidation.isUsernameValid(username)) {
            try {
                userAccount = d.userLogin(username, password);
            } catch (NoSuchAlgorithmException ex) {
                Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (InputValidation.isEmailValid(username)) {
            try {
                userAccount = d.userLoginEmail(username, password);
            } catch (NoSuchAlgorithmException ex) {
                Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        if (userAccount != null) {

            if (userAccount.getIsBlocked()) {
                session.setAttribute("errorMsg", "Tài khoản bạn đã bị Block");
                response.sendRedirect("login.jsp");
                return;
            }
            int role = userAccount.getRole();
            session.setAttribute("userId", userAccount.getId());
            session.setAttribute("userRole", role);
            session.setAttribute("userObj", userAccount);
            if (userAccount.getRole() == 1) {
                response.sendRedirect("ManageClass?xd=0");
                return;
            }    
            if (userAccount.getRole() == 2) {
                Tutor tutor = new TutorDAO().getTutor(userAccount.getId());
                session.setAttribute("tutor", tutor);
                System.out.println("a: " + request.getParameter("fromclass"));
                if (request.getParameter("fromclass") != null) {
                    response.sendRedirect(request.getParameter("fromclass") + "&id=" + request.getParameter("cid"));
                } else {
                    response.sendRedirect("tutorhome");
                }
                return;
            }

            if (userAccount.getRole() == 3 && request.getParameter("from") != null) {
                response.sendRedirect(request.getParameter("from"));
                return;
            }

            response.sendRedirect("home");
        } else {
            
            request.getSession().setAttribute("errorMsg", "Sai tài khoản hoặc mật khẩu");
            if (request.getParameter("fromclass") != null){
                System.out.println("a: " + request.getParameter("fromclass") + "&id=" + request.getParameter("cid"));
                response.sendRedirect("login?fromclass=" + request.getParameter("fromclass") + "&id=" + request.getParameter("cid"));
            } else
            if (request.getParameter("from") != null) {
                System.out.println("a: " + request.getParameter("fromclass") + "&id=" + request.getParameter("cid"));
                response.sendRedirect("login?from=" + request.getParameter("from"));
            } else {
                response.sendRedirect("login.jsp");
            }
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
