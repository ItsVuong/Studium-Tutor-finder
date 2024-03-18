/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.DAO;
import DAL.LocationDAO;
import DAL.SubjectDAO;
import DAL.TutorDAO;
import DAL.TutorRatingDAO;
import Models.Account;
import Models.Subject;
import Models.TutorProfile;
import Models.Location;
import Models.TutorRating;
//import com.sun.javafx.scene.control.behavior.TwoLevelFocusListBehavior;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Acer
 */
public class ViewAccountController extends HttpServlet {

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
            out.println("<title>Servlet ViewAccountController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ViewAccountController at " + request.getContextPath() + "</h1>");
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
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        int id = Integer.parseInt(request.getParameter("id"));
        String role = request.getParameter("role");

        if ("2".equals(role)) {
            SubjectDAO subjectdao = new SubjectDAO();
            LocationDAO locationdao = new LocationDAO();
            TutorRatingDAO td = new TutorRatingDAO();

            TutorProfile acc = new TutorDAO().getTutorProfileByUserName(id);
            request.setAttribute("acc", acc);

            try {
                List<Subject> subjectList = subjectdao.getAll();
                List<Integer> tutorSubjects = subjectdao.getTutorSubjectID(id);
                String tutorSubjectsString = "";

                for (Subject subject : subjectList) {
                    if (tutorSubjects.contains(subject.getSubjectID())) {
                        tutorSubjectsString += subject.getSubjectName() + ", ";
                    }
                }// lấy được tên các subject

                if (!tutorSubjectsString.isEmpty()) {
                    tutorSubjectsString = tutorSubjectsString.substring(0, tutorSubjectsString.length() - 2);
                }

                request.setAttribute("tutorSubjectsString", tutorSubjectsString);

                List<Location> locationList = locationdao.getAllLocation();
                List<Integer> tutorLocations = locationdao.getTutorLocationID(id);
                String selectedLocationsString = "";
                for (Location location : locationList) {
                    if (tutorLocations.contains(location.getLocationID())) {
                        selectedLocationsString += location.getLocationName() + ", ";
                    }
                }// lấy được tên các location

                if (!selectedLocationsString.isEmpty()) {
                    selectedLocationsString = selectedLocationsString.substring(0, selectedLocationsString.length() - 2);
                }

                request.setAttribute("selectedLocationsString", selectedLocationsString);

                // lấy các feedback của parent (rating, detail, timeCreated)
                List<Account> accountList = td.getAllAccount();
                List<TutorRating> list = td.getAllTutorRatingByTutorID(id);

                request.setAttribute("listTT", list);
                request.setAttribute("accountList", accountList);

                //tính số sao trung bình
                int starCount = td.getAllStarFromTutorId(id);   // lấy tổng sao của tutor
                int feedbackCount = td.getFeedbackCountFromTutorID(id); //lấy số hàng có tutor 
                int averageRate = feedbackCount != 0 ? starCount / feedbackCount : 0;

                request.setAttribute("feedbackCount", feedbackCount);
                request.setAttribute("averageRate", averageRate);

                //Thanh tiến trình hiển thị số lượng vote 
                Map<Integer, Integer> valueAndCountStar = new HashMap<>();
                //Ex: 5 sao - 2 lượt vote      

                for (int valueStar = 1; valueStar <= 5; valueStar++) {
                    int valueStarAttribute = td.getRowCountByRating(id, valueStar);  // Lấy dc số lượt vote từng sao
                    valueAndCountStar.put(valueStar, valueStarAttribute);
                }

                request.setAttribute("valueAndCountStar", valueAndCountStar);

            }
            catch (SQLException ex) {
                Logger.getLogger(ViewAccountController.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
        else {
            Account a = new DAO().getUserById(id);
            request.setAttribute("acc", a);
        }
        out.print(role);
        request.getRequestDispatcher("ViewAccount.jsp").forward(request, response);
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
        String isBlockedParam = request.getParameter("isBlocked");
        boolean isBlocked = isBlockedParam != null && isBlockedParam.equalsIgnoreCase("true");
        Account account = new DAO().getUser(username);
        boolean success = new DAO().blockOrUnBlockAccount(account, !isBlocked);
        request.setAttribute("successMessage", "Cập nhật thành công tài khoản");
        response.sendRedirect("crudacc");

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
