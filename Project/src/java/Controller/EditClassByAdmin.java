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

/**
 *
 * @author mim
 */
@WebServlet(name = "EditClassByAdmin", urlPatterns = {"/EditClassByAdmin"})
public class EditClassByAdmin extends HttpServlet {

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
        //            String classid = request.getParameter("classID");
//            String timeid = request.getParameter("time");
//            request.setAttribute("a", timeid);
//            request.setAttribute("b", classid);
////            request.getRequestDispatcher("index.jsp").forward(request, response);
        int classid = Integer.parseInt(request.getParameter("classid"));
        int subject = Integer.parseInt(request.getParameter("subject"));
        String address = request.getParameter("address");
        String addresspublic = request.getParameter("addresspublic");
        String linkmap = request.getParameter("linkmap");
        String classdescription = request.getParameter("classdescription");
        int payperses = Integer.parseInt(request.getParameter("payperses"));
        int sesperweek = Integer.parseInt(request.getParameter("sesperweek"));
        int time = Integer.parseInt(request.getParameter("timeperses"));
        int tutoredlevel = Integer.parseInt(request.getParameter("tutoredlevel"));
        int tutorgender = Integer.parseInt(request.getParameter("tutorgender"));
        int studentnum = Integer.parseInt(request.getParameter("studentnum"));
        HttpSession session = request.getSession();
        DAOHUNG dao = new DAOHUNG();
        if (session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        } else if (session.getAttribute("userId") != null && (int) session.getAttribute("userRole") != 1) {
            response.sendRedirect("Home.jsp");
            return;
        } else if (request.getParameter("approved") != null) {
            dao.updateAdminIncharge((int) session.getAttribute("userId"), classid);
            dao.editClassAdmin(subject, address, addresspublic, linkmap, payperses, sesperweek,
                    time, tutoredlevel, tutorgender, studentnum, classdescription, classid);
            String timeId = request.getParameter("timemain");
            String timedelete = request.getParameter("timedeletemain");
            dao.deleteSchedule(timedelete, classid);
            dao.insertSchedule(timeId, classid);
            response.sendRedirect("ManageClass?xd=0");
            return;
        } else {
            dao.editClassAdmin(subject, address, addresspublic, linkmap, payperses, sesperweek,
                    time, tutoredlevel, tutorgender, studentnum, classdescription, classid);
            String timeId = request.getParameter("timemain");
            String timedelete = request.getParameter("timedeletemain");
            dao.deleteSchedule(timedelete, classid);
            dao.insertSchedule(timeId, classid);
            response.sendRedirect("ClassList?detail=1&xd=0&id=" + classid);
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
