/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.DAOHUNG;
import Models.Schedule;
import Models.Subject;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author mim
 */
@WebServlet(name = "SearchClassAdminControll", urlPatterns = {"/SearchClassAdminControll"})
public class SearchClassAdminControll extends HttpServlet {

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
        HttpSession session = request.getSession();
        if (null == session.getAttribute("userId")) {
            response.sendRedirect("login.jsp");
            return;
        } else if (session.getAttribute("userId") != null && session.getAttribute("userRole") != null) {
            int userRole = (int) session.getAttribute("userRole");
            if (userRole != 1) {
                // Redirect if userRole is not 1
                response.sendRedirect("Home.jsp");
                return;
            }
        }
        DAOHUNG dao = new DAOHUNG();
        String status = request.getParameter("status");
        List<Models.Class> classByIDAdmin = null;
        List<Models.Account> account = dao.getAllAccountsExceptBlock();
        List<Models.Account> accountNotAdmin = null;
        String xd = request.getParameter("xd");
        String id = null;
        List<Models.Class> classNotApproved;
        classNotApproved = dao.getAllClassNotApproved();
        String classidsearch = request.getParameter("classidsearch");
        if (request.getParameter("accountid") == null && request.getParameter("classidsearch") == null && !request.getParameter("status").equals("")) {
            classByIDAdmin = dao.getAllClassByStatusXd0(status);
            accountNotAdmin = dao.getAllAccountsNotAdmin((int) session.getAttribute("userId"));
        } else if (request.getParameter("accountid").equals("") && request.getParameter("classidsearch").equals("") && request.getParameter("status").equals("")) {
            response.sendRedirect("ManageClass?xd=" + xd);
            return;
        } else if (request.getParameter("xd").equals("0")) {
            id = request.getParameter("accountid");
            if (id.equals("") && classidsearch.equals("") && !request.getParameter("status").equals("")) {
                classByIDAdmin = dao.getAllClassByStatusXd0(status);
            } else {
                classByIDAdmin = dao.getAllManageClassListS(classidsearch, id, status);
                request.setAttribute("classidsearch", classidsearch);
                request.setAttribute("accountid", id);
            }
            accountNotAdmin = dao.getAllAccountsNotAdmin((int) session.getAttribute("userId"));
        } else if (request.getParameter("xd").equals("1")) {
            id = request.getParameter("accountid");
            accountNotAdmin = dao.getAllAccountsNotAdminApproved();
            classByIDAdmin = dao.getAllManageClassListSxd1(classidsearch, id);
            request.setAttribute("classidsearch", classidsearch);
            request.setAttribute("accountid", id);
        }
        //////////////////////
        int x = classByIDAdmin.size();
        int page;
        int size = classByIDAdmin.size();
        int numberpage = 6;
        int num = (size % numberpage == 0 ? (size / numberpage) : ((size / numberpage) + 1));
        String xpage = request.getParameter("page");
        if (xpage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);
        }
        int start;
        int end;
        start = (page - 1) * numberpage;
        end = Math.min(page * numberpage, size);
        int pagez = 1;
        List<Models.Class> list = dao.getListByPage(classByIDAdmin, start, end);
        request.setAttribute("page", page);
        request.setAttribute("num", num);
        request.setAttribute("pagez", pagez);
        request.setAttribute("size", x);
        request.setAttribute("ClassList", list);
        request.setAttribute("AccountNotAdmin", accountNotAdmin);
        request.setAttribute("ClassListNotApproved", classNotApproved);
        int manageClassS = 1;
        request.setAttribute("manageClassS", manageClassS);

        request.setAttribute("status", request.getParameter("status"));
        request.setAttribute("a", id);
        request.setAttribute("xd", xd);
        request.getRequestDispatcher("ManageClass.jsp").forward(request, response);

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
        processRequest(request, response);
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
        processRequest(request, response);
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
