/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.LocationDAO;
import DAL.SubjectDAO;
import DAL.TutorDAO;
import Models.Account;
import Models.Tutor;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Asus
 */
public class UpdateTutorPosition extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    SubjectDAO subjectDao = new SubjectDAO();
    LocationDAO locationDao = new LocationDAO();
    TutorDAO tutorDao = new TutorDAO();
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String[] locationList = request.getParameterValues("location");
        String[] subjectList = request.getParameterValues("subject");
        String status = request.getParameter("tutorStatus");
        boolean isActive = status.equals("1")? true : false;
        if (locationList == null || subjectList == null){
            isActive = false;
        }
        Tutor acc = (Tutor) request.getSession().getAttribute("tutor");
        try {
            tutorDao.updateActive(acc.getTutorID(), isActive);
            acc.setActive(isActive);
            subjectDao.updateTutorSubject(acc.getTutorID(), subjectList);
            locationDao.updateTutorLocation(acc.getTutorID(), locationList);
            
        } catch (SQLException ex) {
            Logger.getLogger(UpdateTutorPosition.class.getName()).log(Level.SEVERE, null, ex);
        }
        response.setStatus(HttpServletResponse.SC_OK);
        response.sendRedirect("tutorprofile");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
