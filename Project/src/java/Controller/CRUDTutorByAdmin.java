/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.DAO;
import DAL.TutorDAO;
import Models.TutorProfile;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author Acer
 */
public class CRUDTutorByAdmin extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CRUDTutorByAdmin</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CRUDTutorByAdmin at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
    private void processPagination(HttpServletRequest request, List<TutorProfile> list) {
        TutorDAO dao = new TutorDAO();
        int page;
        int size = list.size();
        int numberpage = 5;
        int num = (size % numberpage == 0 ? (size / numberpage) : ((size / numberpage) + 1));
        String xpage = request.getParameter("page");
        if (xpage == null) {
            page = 1;
        }
        else {
            page = Integer.parseInt(xpage);
        }
        int start = (page - 1) * numberpage;
        int end = Math.min(page * numberpage, size);
        List<TutorProfile> paginatedList = dao.getListByTuTor(list, start, end);
        
        request.setAttribute("listT", paginatedList);
        request.setAttribute("page", page);
        request.setAttribute("num", num);
        
        String txtSearch = request.getParameter("txtS");
        if (txtSearch != null && !txtSearch.isEmpty()) {
            txtSearch = txtSearch.replaceAll("\\s+", "").trim();
            request.setAttribute("txtS", txtSearch);
        }
        request.setAttribute("pagingsize", size);
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        TutorDAO d = new TutorDAO();
        String type = request.getParameter("type");
        String username = request.getParameter("username");
        String validated = request.getParameter("validated");
        String txtSearch = request.getParameter("txtS");
        if (txtSearch != null && !txtSearch.isEmpty()) {
            txtSearch = txtSearch.replaceAll("\\s+", "").trim();
            request.setAttribute("txtS", txtSearch);
        }

// Kiểm tra và thực hiện cập nhật tài khoản
        if ("1".equals(type)) {
            d.changeToTutor(username);
            request.setAttribute("successMessage", "Cập nhật thành công tài khoản");
        }

        if ("2".equals(type)) {
            d.changeToPending(username);
            request.setAttribute("successMessage", "Trạng thái Pending được kích hoạt");
        }
        
        if (validated == null) {
            validated = "0";
        }
        
        List<TutorProfile> listTutor;
        if (txtSearch != null && !txtSearch.isEmpty()) {
            listTutor = d.getTutorsByUserNameOrEmailOrFullName(txtSearch, validated);
        }
        else {
            listTutor = d.findValidated(validated);
        }
        processPagination(request, listTutor);
        
        request.setAttribute("validated", validated);
        out.print(validated);
        out.print(listTutor);
        request.getRequestDispatcher("CRUDTutorByAdmin.jsp").forward(request, response);
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
        String username = request.getParameter("username");
        new DAO().blockAccountByUser(username);
        request.setAttribute("successMessage", "Chặn thành công tài khoản");
        
        response.sendRedirect("crudtutor");
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
