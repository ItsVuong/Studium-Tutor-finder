/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.DAO;
import DAL.DAOHUNG;
import Models.Class;
import Models.Location;
import Models.Subject;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

import java.util.List;

/**
 *
 * @author mim
 */
@WebServlet(name = "SearchClassList", urlPatterns = {"/SearchClassList"})
public class SearchClassList extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DAOHUNG dao = new DAOHUNG();
        HttpSession session = request.getSession();

        if (session.getAttribute("userRole") == null || session.getAttribute("userRole") != "1") {
            String subject = request.getParameter("subject");
            String location = request.getParameter("location");
            if (request.getParameter("location") != null) {
                location = dao.cutStringAfterFirstSpace(request.getParameter("location"));
            }
            if (location.equals("") && subject.equals("")) {
                response.sendRedirect("ClassList");
                return;
            }
            List<Models.Class> classListS = new ArrayList<>();
            classListS = dao.getAllClassListS(subject, location);
            
            int x = classListS.size();
            int page;
            int size = classListS.size();
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
            List<Models.Class> list = dao.getListByPage(classListS, start, end);
            request.setAttribute("page", page);
            request.setAttribute("num", num);
            request.setAttribute("pagez", pagez);
            request.setAttribute("size", x);
            int oke = 1;
            request.setAttribute("classS", list);
            List<Location> LocationList = dao.getAllLocation();
            List<Subject> Subject = dao.getAllSubject();
            request.setAttribute("Subject", Subject);
            request.setAttribute("location", location);
            request.setAttribute("subject", subject);
            request.setAttribute("ClassList", list);
            request.setAttribute("LocationList", LocationList);
            request.getRequestDispatcher("Class.jsp").forward(request, response);
        } else if (session.getAttribute("userRole") == "1") {

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
