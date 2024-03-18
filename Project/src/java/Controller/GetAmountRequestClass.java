/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.DAOHUNG;
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
@WebServlet(name = "GetAmountRequestClass", urlPatterns = {"/GetAmountRequestClass"})
public class GetAmountRequestClass extends HttpServlet {

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
        DAOHUNG dao = new DAOHUNG();
        HttpSession session = request.getSession();
        List<Models.Request> list = dao.getAllRequestByParent((int) session.getAttribute("userId"));
        int totalAmountRequest = list.size();
        PrintWriter out = response.getWriter();
        out.println(totalAmountRequest);
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
        DAOHUNG dao = new DAOHUNG();
        HttpSession session = request.getSession();
        if (request.getParameter("variableName").equals("tutor")) {
            List<Models.Request> list = dao.getAllRequestByTutor((int) session.getAttribute("userId"));
            int totalAmountRequest = 0;
            if (list != null) {
                totalAmountRequest = list.size();
            }
            PrintWriter out = response.getWriter();
            out.println(totalAmountRequest);
        }
        if (request.getParameter("variableName").equals("parent")) {
            List<Models.Request> list = dao.getAllRequestByParent((int) session.getAttribute("userId"));
            int totalAmountRequest = 0;
            if (list != null) {
                totalAmountRequest = list.size();
            }
            PrintWriter out = response.getWriter();
            out.println(totalAmountRequest);
        }
        if (request.getParameter("variableName").equals("all")) {
            List<Models.Request> list1 = dao.getAllRequestByParent((int) session.getAttribute("userId"));
            List<Models.Request> list2 = dao.getAllRequestByTutor((int) session.getAttribute("userId"));
            List<Models.Class> list3 = dao.getAllClassNotApproved();
            int amountlist1 = 0;
            int amountlist2 = 0;
            int amountlist3 = 0;
            if (list1 != null) {
                amountlist1 = list1.size();
            }
            if (list2 != null) {
                amountlist2 = list2.size();
            }
            if (list3 != null) {
                amountlist3 = list3.size();
            }
            int totalAmountRequest = amountlist1 + amountlist2 + amountlist3;
            PrintWriter out = response.getWriter();
            out.println(totalAmountRequest);
        }

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
        DAOHUNG dao = new DAOHUNG();
        List<Models.Class> list = dao.getAllClassNotApproved();
        int totalAmountRequest = list.size();
        PrintWriter out = response.getWriter();
        out.println(totalAmountRequest);
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
