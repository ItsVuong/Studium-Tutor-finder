/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.ClassDAO;
import DAL.DAOHUNG;
import DAL.SubjectDAO;
import Models.Schedule;
import Models.Subject;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DELL
 */
@WebServlet(name = "AddClassController", urlPatterns = {"/addClass"})
public class AddClassController extends HttpServlet {

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
            SubjectDAO subjectDAO = new SubjectDAO();
            DAOHUNG dao = new DAOHUNG();
            List<Subject> list = subjectDAO.getAll();
            request.setAttribute("list", list);
            List<Models.Account> account = dao.getAllAccountsExceptBlock();
            List<Schedule> schedule = dao.getAllSchedule();
            request.setAttribute("Schedule", schedule);
            List<String> day = Arrays.asList("Thứ 2", "Thứ 3", "Thứ 4", "Thứ 5", "Thứ 6", "Thứ 7", "Chủ nhật");
            request.setAttribute("day", day);
            request.getRequestDispatcher("AddClass.jsp").forward(request, response);
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
        PrintWriter out = response.getWriter();
        try {
            DAOHUNG dao = new DAOHUNG();
            Integer userID = (Integer) request.getSession().getAttribute("userId");
            int pay = Integer.parseInt(request.getParameter("payPerSes"));
            int sessions = Integer.parseInt(request.getParameter("sessPerWeek"));
            int time = Integer.parseInt(request.getParameter("timeS"));
            int numOfStudents = Integer.parseInt(request.getParameter("studentNum"));
            LocalDate currentDate = LocalDate.now();
            String actualAddress = request.getParameter("actualAddress");
            String description = request.getParameter("classDescription");
            int tutorEdlevel = Integer.valueOf(request.getParameter("tutorEdlevel"));
            int gender = Integer.parseInt(request.getParameter("tutorGender"));
            int subjectID = Integer.parseInt(request.getParameter("subjectID"));
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            String date = currentDate.format(formatter);
            ClassDAO classDAO = new ClassDAO();

            classDAO.createClass(userID, gender, pay, sessions, time, description,
                    date, actualAddress, tutorEdlevel, subjectID, numOfStudents
            );

            int classid = dao.getBigistIndexClassID();
            String timeId = request.getParameter("timemain");
            String timedelete = request.getParameter("timedeletemain");
            dao.deleteSchedule(timedelete, classid);
            dao.insertSchedule(timeId, classid);

            response.sendRedirect("ManageClass_Parent");
        } catch (Exception ex) {
            Logger.getLogger(AddClassController.class.getName()).log(Level.SEVERE, null, ex);
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
