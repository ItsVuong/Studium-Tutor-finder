package Controller;

import DAL.LocationDAO;
import DAL.SubjectDAO;
import DAL.TutorDAO;
import DAL.UserDAO;
import Models.Account;
import Models.Subject;
import Models.Location;
import Models.Tutor;
import java.io.IOException;
import java.io.PrintWriter;
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
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@MultipartConfig(
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 11
)
public class UpdateTutor extends HttpServlet {

    TutorDAO dao = new TutorDAO();
    SubjectDAO subjectdao = new SubjectDAO();
    LocationDAO locationdao = new LocationDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Account acc = (Account) request.getSession().getAttribute("userObj");
        try {
            List<Subject> subjectList = subjectdao.getAll();
            List<Integer> tutorSubjects = subjectdao.getTutorSubjectID(acc.getId());
            request.setAttribute("subjectList", subjectList);
            request.setAttribute("tutorSubjects", tutorSubjects);
            
            List<Location> locationList = locationdao.getAllLocation();
            List<Integer> tutorLocations = locationdao.getTutorLocationID(acc.getId());
            request.setAttribute("locationList", locationList);
            request.setAttribute("tutorLocations", tutorLocations);
        } catch (SQLException ex) {
            Logger.getLogger(UpdateTutor.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.getRequestDispatcher("InfoTutor.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
//get tutor and account object
        Tutor tutor = (Tutor) request.getSession().getAttribute("tutor");
        Account acc = (Account) request.getSession().getAttribute("userObj");
//get parameters 
        int id = acc.getId();
        String school = request.getParameter("school");
        String major = request.getParameter("major");
        int edLevel = Integer.parseInt(request.getParameter("level"));
        boolean gender = (Integer.parseInt(request.getParameter("gender")) == 0 ? false : true);
        String dob = request.getParameter("dob");
        String introduction = request.getParameter("intro");
        Part pic1 = request.getPart("idCard1");
        Part pic2 = request.getPart("idCard2");
        Part avatar = request.getPart("avatar");
        int gradYear = 0;
        try {
            gradYear = Integer.parseInt(request.getParameter("gradYear"));
        } catch (NumberFormatException e) {
            System.out.println("error");
            return;
        }

        if (tutor == null && (pic1.getSize() > 0) && (pic2.getSize() > 0)) {
            dao.createTutor(id);
        }
        if (tutor == null && (pic1.getSize() <= 0) && (pic2.getSize() <= 0)) {
            System.out.println("error");
            return;
        }

        String path = getServletContext().getRealPath("img");
        if (pic1.getSize() > 0) {
            String extension = checkFileExtension(pic1.getSubmittedFileName());
            if (extension != null) {
                String pic1Name = "account" + acc.getId() + "idCardFront." + extension;
                if (uploadImage(pic1, path, pic1Name)) {
                    dao.updateTutorIds(id, pic1Name, 1);
                }
            } else {
                response.setStatus(HttpServletResponse.SC_UNSUPPORTED_MEDIA_TYPE);
                response.setContentType("text/plain");
                response.getWriter().write("Định dạng không hợp lệ");
                return;
            }
        }

        if (pic2.getSize() > 0) {
            String extension = checkFileExtension(pic2.getSubmittedFileName());
            if (extension != null) {
                String pic2Name = "account" + acc.getId() + "idCardBack." + extension;
                if (uploadImage(pic2, path, pic2Name)) {
                    dao.updateTutorIds(id, pic2Name, 2);
                }
            } else {
                response.setStatus(HttpServletResponse.SC_UNSUPPORTED_MEDIA_TYPE);
                response.setContentType("text/plain");
                response.getWriter().write("Định dạng không hợp lệ");
                return;
            }
        }
        
        if (avatar != null) {
            UserDAO userD = new UserDAO();
            String extension = checkFileExtension(avatar.getSubmittedFileName());
            if (extension != null) {
                String avatarName = "account" + acc.getId() + "_avatar." + extension;
                if (uploadImage(avatar, path, avatarName)) {
                    userD.updateAvatar(avatarName, id);
                }
            } else if (!avatar.getSubmittedFileName().equals("")){
                response.setStatus(HttpServletResponse.SC_UNSUPPORTED_MEDIA_TYPE);
                response.setContentType("text/plain");
                response.getWriter().write("Định dạng không hợp lệ");
                return;
            }
        }
        
        tutor = dao.updateTutor(id, major, school, gradYear, edLevel, gender, introduction, dob); 
        request.getSession().setAttribute("tutor", tutor);
        response.setStatus(HttpServletResponse.SC_OK);
//        request.getRequestDispatcher("InfoTutor.jsp").forward(request, response);

    }

    private boolean uploadImage(Part file, String path, String fileName) throws IOException {
        OutputStream out = null;
        boolean test = false;
        InputStream fileContent = file.getInputStream();

        try {

            out = new FileOutputStream(new File(path + File.separator + fileName));

            int read = 0;
            final byte[] bytes = new byte[1024 * 8];

            while ((read = fileContent.read(bytes)) != -1) {
                out.write(bytes, 0, read);
            }
            test = true;
        } catch (FileNotFoundException ex) {
            Logger.getLogger(UpdateTutor.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (out != null) {
                out.close();
            }
            if (fileContent != null) {
                fileContent.close();
            }
        }
        return test;
    }

    private String checkFileExtension(String fileName) {
        int index = fileName.lastIndexOf('.');
        if (index > 0) {
            String extension = fileName.substring(index + 1);
            if (extension.equalsIgnoreCase("jpg") || extension.equalsIgnoreCase("JPEG") || extension.equalsIgnoreCase("png")) {
                return extension;
            } else {
                return null;
            }
        }
        return null;
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
