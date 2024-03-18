/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.DAOHUNG;
import Models.Schedule;
import Models.Subject;
import Models.Location;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Arrays;
import java.util.List;

/**
 *
 * @author mim
 */
@WebServlet(name = "EditClass", urlPatterns = {"/EditClass"})
public class EditClass extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        String classid = request.getParameter("classid");
        DAOHUNG dao = new DAOHUNG();
        HttpSession session = request.getSession();
        if(!dao.checkAdminIncharge(Integer.parseInt(classid)) && request.getParameter("approved") != null){
            response.sendRedirect("ManageClass?xd=1&mess=1");
            return;
        } 
        if(dao.checkAdminIncharge(Integer.parseInt(classid)) && request.getParameter("approved").equals("1")){
            dao.updateAdminIncharge((int)session.getAttribute("userId"),Integer.parseInt(classid));
        } 
        if(dao.checkAdminIncharge(Integer.parseInt(classid)) && request.getParameter("approved").equals("2")){
            dao.updateAdminIncharge((int)session.getAttribute("userId"),Integer.parseInt(classid));
            dao.editClassAdminDeApproved(Integer.parseInt(classid));
            response.sendRedirect("ManageClass?xd=0");
            return;
        } 
        Models.Class classByID = dao.getAllClassByIdClass(classid);
        List<Models.Account> account = dao.getAllAccountsExceptBlock();
        List<Integer> FreescheduleClass = dao.getAllFreeScheduleClassById(classid);
        List<Schedule> schedule = dao.getAllSchedule();
        List<Subject> Subject = dao.getAllSubject();
        request.setAttribute("Subject", Subject);
        request.setAttribute("cl", classByID);
        request.setAttribute("Account", account);
        request.setAttribute("Schedule", schedule);
        request.setAttribute("approved", request.getParameter("approved"));
        request.setAttribute("FreeScheduleClass", FreescheduleClass);
        List<String> day = Arrays.asList("Thứ 2", "Thứ 3", "Thứ 4", "Thứ 5", "Thứ 6", "Thứ 7", "Chủ nhật");
        request.setAttribute("day", day);
        List<Location> location = dao.getAllLocation();
        request.setAttribute("Location", location);
        request.getRequestDispatcher("EditClass.jsp").forward(request, response);
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
