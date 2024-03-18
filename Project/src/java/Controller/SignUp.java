package Controller;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import DAL.UserDAO;
import Models.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Asus
 */
public class SignUp extends HttpServlet {

    UserDAO d = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("signup.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");

        String name = request.getParameter("fullName");
        String usrName = request.getParameter("username");
        String phone = request.getParameter("phone");
        String pwd = request.getParameter("password");
        String rePwd = request.getParameter("password_2");
        String email = request.getParameter("email");
        String role = request.getParameter("role");

        Map<String, String> errorMessages = new HashMap<>();

        if (!InputValidation.isUsernameValid(usrName)) {
            errorMessages.put("usrnameError", "Tên người dùng không hợp lệ");
        } else if (d.getUser(usrName) > 0) {
            errorMessages.put("usrnameError", "Tên tài khoản đã tồn tại");
        }

        if (!InputValidation.isPhoneValid(phone)) {
            errorMessages.put("phoneError", "Số điện thoại không hợp lệ!");
        }
//        else if (d.getPhone(phone) != null) {
//            request.setAttribute("phoneError", "Số điện thoại đã tồn tại");
//            error = true;
//        }

        if (!InputValidation.isEmailValid(email)) {
            errorMessages.put("emailError", "Email không hợp lệ!");
        }
//        else if (d.getEmail(email) != null) {
//            request.setAttribute("emailError", "Email đã tồn tại");
//            error = true;
//        }

        if (!InputValidation.isPasswordValid(pwd)) {
            errorMessages.put("pwdError_1", "Mật khẩu phải chứa 8 ký tự, có sử dụng ít nhât 1 ký tự đặc biết và 1 chữ số.");
        } else if (!rePwd.equals(pwd)) {
            errorMessages.put("pwdError_2", "Mật khẩu nhập lại không khớp mật khẩu cũ.");
        }

        if (!InputValidation.isFullnameValid(name)) {
            errorMessages.put("fullnameError", "Tên không hợp lệ.");
        }

        if (!errorMessages.isEmpty()) {
            String json = jsonBuilder(errorMessages);
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.setContentType("application/json");
            response.getWriter().write(json);
        } else {
            int roleNum = -1;
            if (role.equals("parent")) {
                roleNum = 3;
            } else if (role.equals("tutor")) {
                roleNum = 2;
            }
            d.createAccount(name, phone, email, roleNum, usrName, pwd);
            response.setStatus(HttpServletResponse.SC_OK);
            String urlToRedirect = "{\"url\":\"login\"}";
            response.getWriter().write(urlToRedirect);
        }
    }

    private String jsonBuilder(Map<String, String> map) {
        StringBuilder jsonBuilder = new StringBuilder();
        jsonBuilder.append("{");
        boolean isFirst = true;
        for (Map.Entry<String, String> entry : map.entrySet()) {
            if (!isFirst) {
                jsonBuilder.append(",");
            }
            isFirst = false;
            jsonBuilder.append("\"").append(entry.getKey()).append("\":\"").append(entry.getValue()).append("\"");
        }
        jsonBuilder.append("}");

        return jsonBuilder.toString();
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
