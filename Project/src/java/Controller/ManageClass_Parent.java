/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.ClassDAO;
import DAL.DAOHUNG;
import Models.Schedule;
import Models.Subject;
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
 * @author admin
 */
@WebServlet(name = "ManageClass_Parent", urlPatterns = {"/ManageClass_Parent"})
public class ManageClass_Parent extends HttpServlet {

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
        DAOHUNG daoh = new DAOHUNG();
        ClassDAO daoC= new ClassDAO();
        HttpSession session = request.getSession();
        //check user role
        if (session.getAttribute("userRole") == "3") {
            response.sendRedirect("ManageClass");
            return;
        } else if (session.getAttribute("userRole") == null){
            
        } else if(session.getAttribute("userRole") != "3"){
            
        }
        //end user role
        
        if (request.getParameter("detail") != null) {
            String id = request.getParameter("id");
            Models.Class ClassListP = daoh.getAllClassListDetail(id);
            //list class thông qua các biến trong class/models
            int outcome = ClassListP.getPayPerSession() * ClassListP.getSesPerWeek();
            String payPerSes = daoh.formatNumberWithCommas(ClassListP.getPayPerSession());
            String formattedOutcome = daoh.formatNumberWithCommas(outcome);
            //khởi tạo biến lên trên jsp
            request.setAttribute("ClassList", ClassListP);
            request.setAttribute("outcome", formattedOutcome);
            request.setAttribute("payPerSes", payPerSes);
            List<Integer> FreescheduleClass = daoh.getAllFreeScheduleClassById(id);
            List<Schedule> schedule = daoh.getAllSchedule();
            request.setAttribute("Schedule", schedule);
            if (request.getParameter("xd") != null || request.getParameter("xd").equals("")) {
                String xd = request.getParameter("xd");
                request.setAttribute("xd", xd);
            }
            request.setAttribute("FreeScheduleClass", FreescheduleClass);
            List<String> day = Arrays.asList("Thứ 2", "Thứ 3", "Thứ 4", "Thứ 5", "Thứ 6", "Thứ 7", "Chủ nhật");
            request.setAttribute("day", day);
            request.getRequestDispatcher("DetailClass.jsp").forward(request, response);
            return;
        }
        int accountID = (Integer) session.getAttribute("userId");
        //Lấy danh sách các lớp học mà một người dùng cụ thể đã đăng ký.
        List<Models.Class> ClassList = daoC.getAllClasss(accountID);
        int x = ClassList.size();
        List<Models.Location> LocationList = daoh.getAllLocation();
        List<Subject> Subject = daoh.getAllSubject();
        // check xem lớp đã bị thực hiện thao tác xoá hay chưa

        //??? class show on 1 screen-start
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
//        String action = request.getParameter("action");
//
//        if ("delete".equals(action)) {
//            int classId = Integer.parseInt(request.getParameter("id"));
//            ClassDAO dao = new ClassDAO();
//            // Kiểm tra xem lớp có thể xoá được hay không
//            if (dao.canDeleteClass(classId)) {
//                // Thực hiện xử lý xoá lớp
//                dao.ParentClassDelete(classId);
//                // Redirect hoặc chuyển hướng tới trang cần thiết sau khi xoá
//                response.sendRedirect("ManageClass_Parent");
//                return;
//            } else {
//                // Lớp không thể xoá, thực hiện xử lý thông báo hoặc chuyển hướng tùy thuộc vào yêu cầu của bạn
//                response.sendRedirect("ManageClass_Parent?deleteError=true");
//                return;
//            }
//        }
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
