/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import DAL.UserDAO;
import Models.Account;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.logging.Level;
import java.util.logging.Logger;

@MultipartConfig(
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 11
)
public class UpdateAvatar extends HttpServlet {

    private final static Logger LOGGER
            = Logger.getLogger(UpdateAvatar.class.getCanonicalName());

    UserDAO d = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //abc
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String path = getServletContext().getRealPath("img");
        Part filePart = request.getPart("img");
        Account acc = (Account) request.getSession().getAttribute("userObj");
        String fileName = filePart.getSubmittedFileName();

        if (acc == null || filePart.getSize() <= 0) {
            return;
        } else if (filePart.getSize() >= 1024 * 1024 * 10) {
            response.setStatus(HttpServletResponse.SC_UNSUPPORTED_MEDIA_TYPE); 
            response.setContentType("text/plain");
            response.getWriter().write("File quá lớn");
            return;
        }
        int index = fileName.lastIndexOf('.');
        if (index > 0) {
            String extension = fileName.substring(index + 1);
            if (extension.equalsIgnoreCase("jpg") || extension.equalsIgnoreCase("JPEG") || extension.equalsIgnoreCase("png")) {
                OutputStream out = null;
                InputStream filecontent = null;

                try {
                    String saveName = "account" + acc.getId() + "_avatar." + extension;
                    out = new FileOutputStream(new File(path + File.separator + saveName));
                    filecontent = filePart.getInputStream();

                    int read = 0;
                    final byte[] bytes = new byte[1024];

                    while ((read = filecontent.read(bytes)) != -1) {
                        out.write(bytes, 0, read);
                    }
                    
                    d.updateAvatar(saveName, (int) request.getSession().getAttribute("userId"));
                    Account a = (Account) request.getSession().getAttribute("userObj");
                    a.setProfilePic(saveName);
                    request.getSession().setAttribute("userObj", a);

                } catch (FileNotFoundException fne) {
                    LOGGER.log(Level.SEVERE, "ERROR", new Object[]{fne.getMessage()});
                } finally {
                    if (out != null) {
                        out.close();
                    }
                    if (filecontent != null) {
                        filecontent.close();
                    }
                }
            } else {
                response.setStatus(HttpServletResponse.SC_UNSUPPORTED_MEDIA_TYPE); // Or other suitable status code
                response.setContentType("text/plain");
                response.getWriter().write("Định dạng ảnh không hợp lệ");
                return;
            }

        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
