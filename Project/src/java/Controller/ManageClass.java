package Controller;

import DAL.ClassDAO;
import DAL.DAO;
import DAL.DAOHUNG;
import Models.Account;
import Models.Class;
import Models.FreeSchedule;
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
 * @author mim
 */
@WebServlet(name = "ManageClass", urlPatterns = {"/ManageClass"})
public class ManageClass extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
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
        String id = request.getParameter("accountid");
        DAOHUNG dao = new DAOHUNG();
        List<Models.Account> accountNotAdmin = null ;       
        // Lấy giá trị từ session
//        List<Models.Class> classByIDAdmin;
//        classByIDAdmin = dao.getAllClassOfAdmin((int) session.getAttribute("userId"));
        List<Models.Class> ClassList = null;
        ///////////////////////
        if(request.getParameter("xd").equals("1")){
        accountNotAdmin = dao.getAllAccountsNotAdminApproved();
        List<Models.Class> classNotApproved = dao.getAllClassNotApproved();
        ClassList = classNotApproved;
//        request.setAttribute("ClassList", classNotApproved);
        }
//        request.setAttribute("ClassList", classByIDAdmin);
        //////////////////////
        if(request.getParameter("xd").equals("0")){
        List<Models.Class> classByIDAdmin = dao.getAllClassOfAdmin((int)session.getAttribute("userId"));
        accountNotAdmin = dao.getAllAccountsNotAdmin((int)session.getAttribute("userId"));
        ClassList = classByIDAdmin;
        }
        //////////////////////
        int x = 0;
        if (ClassList != null){
        x = ClassList.size();}
        int page;
        int size = ClassList.size();
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
        List<Models.Class> list = dao.getListByPage(ClassList, start, end);
        request.setAttribute("page", page);
        request.setAttribute("num", num);
        request.setAttribute("pagez", pagez);
        request.setAttribute("size", x);
        request.setAttribute("ClassList", list);
        request.setAttribute("Accountid", id);
        request.setAttribute("AccountNotAdmin", accountNotAdmin);    
        int manageClass = 1;
        request.setAttribute("manageClass", manageClass);
        request.setAttribute("a", id);
        request.setAttribute("xd", request.getParameter("xd"));
        if(request.getParameter("mess") !=null){
            request.setAttribute("mess", "Đã có người khác nhận xét duyệt lớp này!");
        }
        request.getRequestDispatcher("ManageClass.jsp").forward(request, response);
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
