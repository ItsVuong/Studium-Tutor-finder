/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.ClassDAO;
import DAL.DAOHUNG;
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
 * @author admin
 */
@WebServlet(name = "SearchParentClass", urlPatterns = {"/SearchParentClass"})
public class SearchParentClass extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        
        HttpSession session = request.getSession();
        DAOHUNG daoh = new DAOHUNG();
        //check user role
        if (session.getAttribute("userRole") == "3") {
            response.sendRedirect("ManageClass");
            return;
        } else if (session.getAttribute("userRole") == null) {

        } else if (session.getAttribute("userRole") != "3") {

        }
        //end user role

        ClassDAO daoTA = new ClassDAO();
        int classStatus = Integer.parseInt(request.getParameter("classStatus"));
        int subject = Integer.parseInt(request.getParameter("subject"));
        int idUser = Integer.parseInt(request.getParameter("id"));
        List<Models.Class> ClassList = new ArrayList<>();
        ClassList = daoTA.getAllClassSearch(classStatus, subject,idUser);
//        if (ClassList.size() == 0 ){
//            
//        }
//        //Lấy danh sách các lớp học mà một người dùng cụ thể đã đăng ký.
////        List<Models.Class> ClassList = daoC.getAllClasss(accountID);
        int x = ClassList.size();
        List<Models.Location> LocationList = daoh.getAllLocation();
        List<Subject> Subject = daoh.getAllSubject();
//        // check xem lớp đã bị thực hiện thao tác xoá hay chưa
//
//        //??? class show on 1 screen-start
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
        //??? class show on 1 screen-end

        List<Models.Class> list = daoh.getListByPage(ClassList, start, end);
        //Lấy danh sách lớp học cho trang hiện tại
        request.setAttribute("page", page);
        request.setAttribute("num", num);
        request.setAttribute("pagez", pagez);
        request.setAttribute("size", x);
        request.setAttribute("ClassListP", list);
        int oke = 1;
        request.setAttribute("classoke", oke);
        request.setAttribute("LocationList", LocationList);
        request.setAttribute("Subject", Subject);
//        request.setAttribute("test", idUs);
        //Đặt các thuộc tính và chuyển hướng đến trang jsp
        request.getRequestDispatcher("Parent_ManageClass.jsp").forward(request, response);

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
