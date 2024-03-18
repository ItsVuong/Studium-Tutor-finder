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
@WebServlet(name = "HandleRequest", urlPatterns = {"/HandleRequest"})
public class HandleRequest extends HttpServlet {

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
        String id = request.getParameter("id");
        Models.Request requestTutor = dao.getRequestByID(id);
        int idParent = dao.getParentIdByClassID(requestTutor.getClassID());
        int idTutor = requestTutor.getTutorID();
        Models.Account tutor = dao.getAccount(idTutor);
        Models.Account parent = dao.getAccount(idParent);
        Models.Class classR = dao.getAllClassListDetail(Integer.toString(requestTutor.getClassID()));
        request.setAttribute("Tutor", tutor);
        request.setAttribute("Parent", parent);
        request.setAttribute("ClassId", requestTutor.getClassID());
        int outcome = classR.getPayPerSession() * classR.getSesPerWeek();
        int fee = outcome*20/100;
        String formattedOutcome = dao.formatNumberWithCommas(outcome);
        String formattedFee = dao.formatNumberWithCommas(fee);
        request.setAttribute("Outcome", formattedOutcome);
        request.setAttribute("Fee", formattedFee);
        request.setAttribute("id", id);
        request.setAttribute("requestId", requestTutor.getRequestType());
        request.getRequestDispatcher("HandleRequest.jsp").forward(request, response);

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
        DAOHUNG dao = new DAOHUNG();
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
        if(request.getParameter("agree")!= null){
            String requestid = request.getParameter("id");      
            String contractLink = request.getParameter("contractLink");
            String dateEndTrial = request.getParameter("dateEndTrial");
            String classid = request.getParameter("classid");
            String tutorid = request.getParameter("tutorid");
            dao.updateRequestAgree(dateEndTrial, contractLink, requestid, classid,tutorid);
            response.sendRedirect("RequestOfTutor");
            return;
        }
        if(request.getParameter("disagree")!=null){
            String requestid = request.getParameter("id");
            String classid = request.getParameter("classid");
            String tutorid = request.getParameter("tutorid");
            dao.updateRequestDisagree(classid, tutorid);
            response.sendRedirect("RequestOfTutor");
            return;
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
