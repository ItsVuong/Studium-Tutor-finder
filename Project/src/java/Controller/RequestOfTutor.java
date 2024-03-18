
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
import java.util.List;

/**
 *
 * @author mim
 */
@WebServlet(name = "RequestOfTutor", urlPatterns = {"/RequestOfTutor"})
public class RequestOfTutor extends HttpServlet {

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
        DAOHUNG dao = new DAOHUNG();
        List<Models.Request> requestList = dao.getAllRequestByTutor((int)session.getAttribute("userId"));
        List<Models.Account> accountList = dao.getAllAccountsExceptBlock();
        if (requestList != null) {
            int x = requestList.size();
            int page;
            int size = requestList.size();
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
            List<Models.Request> list = dao.getListRequestByPage(requestList, start, end);
            request.setAttribute("page", page);
            request.setAttribute("num", num);
            request.setAttribute("pagez", pagez);
            request.setAttribute("size", x);
            request.setAttribute("RequestList", list);
        }if (requestList == null) {
            request.setAttribute("RequestList", requestList);
        }
        request.setAttribute("Account", accountList );
        
        request.getRequestDispatcher("RequestOfTutor.jsp").forward(request, response);
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
