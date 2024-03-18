/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.DAO;
import DAL.DAOHUNG;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import Models.Class;
import Models.Account;
import Models.Location;
import Models.Schedule;
import Models.Subject;
import jakarta.servlet.http.HttpSession;
import java.util.Arrays;

/**
 *
 * @author mim
 */
@WebServlet(name = "ClassList", urlPatterns = {"/ClassList"})
public class ClassList extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DAOHUNG daoh = new DAOHUNG();
        HttpSession session = request.getSession();
        
        if (session.getAttribute("userRole") == "1") {
            response.sendRedirect("ManageClass");
            return;
        }
        if (request.getParameter("detail") != null && request.getParameter("xd") != null) {
            if(request.getParameter("cancel") != null){
                String id = request.getParameter("id");
                daoh.deleteAdminIncharge(Integer.parseInt(id));
                response.sendRedirect("ClassList?xd=1&detail=1&id="+id);
                return;
            }          
            String id = request.getParameter("id");
            Models.Class ClassList = daoh.getAllClassListDetail(id);
            int outcome = ClassList.getPayPerSession() * ClassList.getSesPerWeek();
            String payPerSes = daoh.formatNumberWithCommas(ClassList.getPayPerSession());
            String formattedOutcome = daoh.formatNumberWithCommas(outcome);
            request.setAttribute("ClassList", ClassList);
            request.setAttribute("outcome", formattedOutcome);
            request.setAttribute("payPerSes", payPerSes);
            List<Integer> FreescheduleClass = daoh.getAllFreeScheduleClassById(id);
            List<Schedule> schedule = daoh.getAllSchedule();
            int accoutnId = daoh.getAccountIdByClassID(id);
            Account ownerClass = daoh.getAccount(accoutnId);
            request.setAttribute("OwnerClass", ownerClass);
            request.setAttribute("Schedule", schedule);
            if (request.getParameter("xd") != null || request.getParameter("xd").equals("")){
                String xd = request.getParameter("xd");
                request.setAttribute("xd", xd);
            }
            request.setAttribute("FreeScheduleClass", FreescheduleClass);
            List<String> day = Arrays.asList("Thứ 2", "Thứ 3", "Thứ 4", "Thứ 5", "Thứ 6", "Thứ 7", "Chủ nhật");
            request.setAttribute("day", day);
            request.getRequestDispatcher("DetailClass.jsp").forward(request, response);
            return;
        }if (request.getParameter("detail") != null && request.getParameter("xd") == null) {
            String id = request.getParameter("id");
            Models.Class ClassList = daoh.getAllClassListDetail(id);
            int outcome = ClassList.getPayPerSession() * ClassList.getSesPerWeek();
            String payPerSes = daoh.formatNumberWithCommas(ClassList.getPayPerSession());
            String formattedOutcome = daoh.formatNumberWithCommas(outcome);
            request.setAttribute("ClassList", ClassList);
            request.setAttribute("outcome", formattedOutcome);
            request.setAttribute("payPerSes", payPerSes);
            List<Integer> FreescheduleClass = daoh.getAllFreeScheduleClassById(id);
            List<Schedule> schedule = daoh.getAllSchedule();
            request.setAttribute("Schedule", schedule);
            request.setAttribute("FreeScheduleClass", FreescheduleClass);
            List<String> day = Arrays.asList("Thứ 2", "Thứ 3", "Thứ 4", "Thứ 5", "Thứ 6", "Thứ 7", "Chủ nhật");
            request.setAttribute("day", day);
            request.getRequestDispatcher("DetailClass.jsp").forward(request, response);
            return;
        }
        List<Models.Class> ClassList = daoh.getAllClass();
        int x = ClassList.size();
        List<Location> LocationList = daoh.getAllLocation();
        List<Subject> Subject = daoh.getAllSubject();
        int page;
        int size = ClassList.size();
        int numberpage = 8;
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

        List<Models.Class> list = daoh.getListByPage(ClassList, start, end);
        request.setAttribute("page", page);
        request.setAttribute("num", num);
        request.setAttribute("pagez", pagez);
        request.setAttribute("size", x);
        request.setAttribute("ClassList", list);
        int oke = 1;
        request.setAttribute("classoke", oke);
        request.setAttribute("LocationList", LocationList);
        request.setAttribute("Subject", Subject);
        request.getRequestDispatcher("Class.jsp").forward(request, response);
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
