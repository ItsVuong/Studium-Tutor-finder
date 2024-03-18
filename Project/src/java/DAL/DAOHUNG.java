/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.Location;
import Models.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import Models.Class;
import Models.Account;
import Models.FreeSchedule;
import Models.Location;
import Models.Schedule;
import Models.Subject;
import Models.Tutor;
//import com.sun.javafx.scene.control.skin.VirtualFlow;
import java.sql.Date;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author mim
 */
public class DAOHUNG {

    private Connection con;
    private String status = "OK";
    private PreparedStatement ps = null;
    ResultSet rs = null;

    public DAOHUNG() {
        try {
            con = new DBContext().getConnection();
        } catch (Exception e) {
            status = "Error at connection" + e.getMessage();
        }
    }

    public int getBigistIndexClassID() {
        String query = "select top 1 * from class order by classid desc";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            if (rs.next()) {
                // Move to the first row and retrieve the value from the first column
                return rs.getInt("classid");
            } else {
                // Handle the case where there are no rows in the ResultSet
                return 0; // or throw an exception or return a meaningful default value
            }
        } catch (Exception ex) {
            Logger.getLogger(DAOHUNG.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public boolean isRecordExist(String seatId, String classID) {
        String sql = "SELECT 1 from Freeschedule WHERE timeid = ? And Classid = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);

            ps.setString(1, seatId);
            ps.setString(2, classID);
            rs = ps.executeQuery();
            return rs.next();
        } catch (Exception ex) {
            Logger.getLogger(DAOHUNG.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public void updateAdminIncharge(int id, int classID) {
        String sql
                = "Update Class\n"
                + "set [adminInCharge] = ?,[isApproved]=1 where ClassID = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setInt(2, classID);
            rs = ps.executeQuery();
        } catch (Exception ex) {
            Logger.getLogger(DAOHUNG.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteAdminIncharge(int classID) {
        String sql
                = "Update Class\n"
                + "set [adminInCharge] = null,[isApproved]=0 where ClassID = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, classID);
            rs = ps.executeQuery();
        } catch (Exception ex) {
            Logger.getLogger(DAOHUNG.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public boolean checkAdminIncharge(int classID) {
        String sql
                = "select adminIncharge from class where classID = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, classID);
            rs = ps.executeQuery();
            if (rs.next()) {
                String adminIncharge = rs.getString("adminIncharge");
                return adminIncharge == null;
            }

        } catch (Exception ex) {
            Logger.getLogger(DAOHUNG.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public int removeSchedule(String seatId, String classID) {
        String sql = "DELETE FROM Freeschedule WHERE  timeid = ? And classID = ?";
        int rowsAffected = 0;
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, seatId);
            ps.setString(2, classID);
            rowsAffected = ps.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(DAOHUNG.class.getName()).log(Level.SEVERE, null, ex);
        }

        return rowsAffected;
    }

    public void insertSchedule(String seatId, int classID) {
        String[] seatIds = seatId.split(", ");
        for (String si : seatIds) {
            String sql = "INSERT INTO Freeschedule ( timeid,classid) VALUES (?, ?)";
            try {
                con = new DBContext().getConnection();
                ps = con.prepareStatement(sql);
                ps.setString(1, si);
                ps.setInt(2, classID);
                ps.executeUpdate();
            } catch (Exception ex) {
                Logger.getLogger(DAOHUNG.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void deleteSchedule(String seatId, int classID) {
        String[] seatIds = seatId.split(", ");
        for (String si : seatIds) {
            String sql = "delete Freeschedule where timeId = ? and classid = ?";
            try {
                con = new DBContext().getConnection();
                ps = con.prepareStatement(sql);
                ps.setString(1, si);
                ps.setInt(2, classID);
                ps.executeUpdate();
            } catch (Exception ex) {
                Logger.getLogger(DAOHUNG.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public List<Integer> getAllFreeScheduleClassById(String a) {
        List<Integer> list = new ArrayList<>();
        String query = "SELECT timeid from freeschedule where classID = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, a);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(rs.getInt(1)
                );
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<FreeSchedule> getAllFreeScheduleClass() {
        List<FreeSchedule> list = new ArrayList<>();
        String query = "SELECT timeid,classId from freeschedule ";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Models.FreeSchedule(rs.getInt(1), rs.getInt(2)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Models.Class getAllClassByIdClass(String a) {

        String query = "SELECT *FROM class\n"
                + "INNER JOIN subject ON class.subjectID = subject.subjectID\n"
                + "WHERE class.classID = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, a);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Models.Class(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getDate(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getInt(13),
                        rs.getInt(14),
                        rs.getInt(15),
                        rs.getDate(16),
                        rs.getBoolean(17),
                        rs.getInt(18),
                        rs.getString(21),
                        rs.getString(19)
                );
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Models.Class> getAllClassByAccountID(String id) {
        List<Models.Class> list = new ArrayList<>();
        String query = "SELECT *\n"
                + "FROM class\n"
                + "JOIN subject ON class.subjectID = subject.subjectID "
                + "where class.ParentID = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Models.Class(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getDate(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getInt(13),
                        rs.getInt(14),
                        rs.getInt(15),
                        rs.getDate(16),
                        rs.getBoolean(17),
                        rs.getInt(18),
                        rs.getString(21),
                        rs.getString(19)
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }


    public List<Models.Class> getAllClass() {
        List<Models.Class> list = new ArrayList<>();
        String query = "SELECT *\n"
                + "FROM class\n"
                + "JOIN subject ON class.subjectID = subject.subjectID "
                + "where class.TutorID IS NULL and isApproved = 1 ";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Models.Class(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getDate(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getInt(13),
                        rs.getInt(14),
                        rs.getInt(15),
                        rs.getDate(16),
                        rs.getBoolean(17),
                        rs.getInt(18),
                        rs.getString(21),
                        rs.getString(19)
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }


    public List<Models.Class> getAllClasss(int userID) {
        List<Models.Class> list = new ArrayList<>();
        TutorDAO dao = new TutorDAO();
        String query = "		SELECT * \n"
                + "                FROM class\n"
                + "                JOIN subject ON class.subjectID = subject.subjectID where ParentID = ?";

        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setInt(1, userID);
            rs = ps.executeQuery();
            while (rs.next()) {
                int tutorID = rs.getInt(2);
                String tutorFullName = null;
                // Check if tutorID is not null
                if (!rs.wasNull()) {
                    // Retrieve the tutor's full name only if tutorID is not null
//                    tutorFullName = dao.getTutorProfileByTutorID(tutorID).getFullName();
                }

                list.add(new Models.Class(rs.getInt(1),
                        tutorID,
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getDate(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getInt(13),
                        rs.getInt(14),
                        rs.getInt(15),
                        rs.getDate(16),
                        rs.getBoolean(17),
                        rs.getInt(18),
                        rs.getString(21),
                        rs.getString(19),
                        tutorFullName
                ));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Models.Class> getAllClassOfAdmin(int idAdmin) {
        List<Models.Class> list = new ArrayList<>();
        String query = "SELECT *\n"
                + "FROM class\n"
                + "JOIN subject ON class.subjectID = subject.subjectID "
                + "where AdminInCharge = ? order by OpenDate desc";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setInt(1, idAdmin);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Models.Class(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getDate(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getInt(13),
                        rs.getInt(14),
                        rs.getInt(15),
                        rs.getDate(16),
                        rs.getBoolean(17),
                        rs.getInt(18),
                        rs.getString(21),
                        rs.getString(19)
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
//    public List<Models.Class> getAllClassOfAdmin(int idAdmin) {
//        List<Models.Class> list = new ArrayList<>();
//        String query = "SELECT *\n"
//                + "FROM class\n"
//                + "JOIN subject ON class.subjectID = subject.subjectID "
//                + "where AdminInCharge = ? ";
//        try {
//            con = new DBContext().getConnection();
//            ps = con.prepareStatement(query);
//            ps.setInt(1, idAdmin);
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                list.add(new Models.Class(rs.getInt(1),
//                        rs.getInt(2),
//                        rs.getInt(3),
//                        rs.getInt(4),
//                        rs.getInt(5),
//                        rs.getInt(6),
//                        rs.getInt(7),
//                        rs.getInt(8),
//                        rs.getDate(9),
//                        rs.getString(10),
//                        rs.getString(11),
//                        rs.getString(12),
//                        rs.getInt(13),
//                        rs.getInt(14),
//                        rs.getInt(15),
//                        rs.getDate(16),
//                        rs.getBoolean(17),
//                        rs.getInt(18),
//                        rs.getString(21),
//                        rs.getString(19)
//                ));
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return list;
//    }

    public List<Models.Class> getAllClassNotApproved() {
        List<Models.Class> list = new ArrayList<>();
        String query = "SELECT *FROM class\n"
                + "              JOIN subject ON class.subjectID = subject.subjectID \n"
                + "              where isApproved = 0";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Models.Class(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getDate(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getInt(13),
                        rs.getInt(14),
                        rs.getInt(15),
                        rs.getDate(16),
                        rs.getBoolean(17),
                        rs.getInt(18),
                        rs.getString(21),
                        rs.getString(19)
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Location> getAllLocation() {
        List<Location> list = new ArrayList<>();
        String query = "Select * from Location ";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Location(rs.getInt(1),
                        rs.getString(2)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Schedule> getAllSchedule() {
        List<Schedule> list = new ArrayList<>();
        String query = "Select * from Timeschedule";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Schedule(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Subject> getAllSubject() {
        List<Subject> list = new ArrayList<>();
        String query = "Select * from Subject ";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Subject(rs.getInt(1),
                        rs.getString(2)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Models.Class> getAllClassListS(String subject, String location) {
        List<Models.Class> list = new ArrayList<>();
        String query = null;

        if (!subject.equals("") && !location.equals("")) {
            query = "SELECT *\n"
                    + "FROM class\n"
                    + "INNER JOIN subject ON class.subjectID = subject.subjectID\n"
                    + "WHERE subject.SubjectID = ? And class.publicAddress like ?;";
        } else if (!subject.equals("") && location.equals("")) {
            query = "SELECT *\n"
                    + "FROM class\n"
                    + "INNER JOIN subject ON class.subjectID = subject.subjectID\n"
                    + "WHERE subject.SubjectID = ?";
        } else if (subject.equals("") && !location.equals("")) {
            query = "SELECT *\n"
                    + "FROM class\n"
                    + "INNER JOIN subject ON class.subjectID = subject.subjectID\n"
                    + "WHERE class.publicAddress like ?; ";
        }
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            if (!subject.equals("") && !location.equals("")) {
                ps.setNString(1, subject);
                ps.setNString(2, "%" + location + "%");
            } else if (!subject.equals("") && location.equals("")) {
                ps.setNString(1, subject);
            } else if (subject.equals("") && !location.equals("")) {
                ps.setNString(1, "%" + location + "%");
            }
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Models.Class(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getDate(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getInt(13),
                        rs.getInt(14),
                        rs.getInt(15),
                        rs.getDate(16),
                        rs.getBoolean(17),
                        rs.getInt(18),
                        rs.getString(21),
                        rs.getString(19)
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Models.Class> getAllClassByStatusXd0(String status) {
        List<Models.Class> list = new ArrayList<>();
        String statusS = "";
        if (status.equals("1.1")) {
            statusS = "And tutorID is null and classStatus != 0";
        }
        if (status.equals("1.2")) {
            statusS = "And tutorID is not null  and ClassStatus != 0";
        }
        if (status.equals("0")) {
            statusS = "And tutorID is null And ClassStatus = 0";
        }
        if (status.equals("3")) {
            statusS = "And ClassStatus = 3";
        }
        String query = "SELECT *\n"
                + "FROM class\n"
                + "INNER JOIN subject ON class.subjectID = subject.subjectID\n"
                + "WHERE isApproved = 1 " + statusS + "order by OpenDate desc";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Models.Class(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getDate(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getInt(13),
                        rs.getInt(14),
                        rs.getInt(15),
                        rs.getDate(16),
                        rs.getBoolean(17),
                        rs.getInt(18),
                        rs.getString(21),
                        rs.getString(19)
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Models.Class> getAllManageClassListS(String classidsearch, String accountid, String status) {
        List<Models.Class> list = new ArrayList<>();
        String statusS = "";
        if (status.equals("1.1")) {
            statusS = "And tutorID is null";
        }
        if (status.equals("1.2")) {
            statusS = "And tutorID is not null";
        }
        if (status.equals("0")) {
            statusS = "And tutorID is null And ClassStatus = 0";
        }
        if (status.equals("3")) {
            statusS = "And ClassStatus = 0";
        }
        String query = null;
        String classidSearchInt = null;
        if (!classidsearch.equals("") && !accountid.equals("")) {
            classidSearchInt = Integer.toString(Integer.parseInt(classidsearch));
            query = "SELECT *\n"
                    + "FROM class\n"
                    + "INNER JOIN subject ON class.subjectID = subject.subjectID\n"
                    + "WHERE class.ParentID = ? And class.classID like ? " + statusS +"order by OpenDate desc";
        } else if (classidsearch.equals("") && !accountid.equals("")) {
            query = "SELECT *\n"
                    + "FROM class\n"
                    + "JOIN subject ON class.subjectID = subject.subjectID "
                    + "where class.ParentID = ? " + statusS +"order by OpenDate desc";
        } else if (!classidsearch.equals("") && accountid.equals("")) {
            classidSearchInt = Integer.toString(Integer.parseInt(classidsearch));
            query = "SELECT *\n"
                    + "FROM class\n"
                    + "INNER JOIN subject ON class.subjectID = subject.subjectID\n"
                    + "WHERE class.classID like ? " + statusS +"order by OpenDate desc";
        }
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            if (!classidsearch.equals("") && !accountid.equals("")) {
                ps.setNString(1, accountid);
                ps.setNString(2, "%" + classidSearchInt + "%");
            } else if (classidsearch.equals("") && !accountid.equals("")) {
                ps.setNString(1, accountid);
            } else if (!classidsearch.equals("") && accountid.equals("")) {
                ps.setNString(1, "%" + classidSearchInt + "%");
            }
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Models.Class(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getDate(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getInt(13),
                        rs.getInt(14),
                        rs.getInt(15),
                        rs.getDate(16),
                        rs.getBoolean(17),
                        rs.getInt(18),
                        rs.getString(21),
                        rs.getString(19)
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Models.Class> getAllManageClassListSxd1(String classidsearch, String accountid) {
        List<Models.Class> list = new ArrayList<>();
        String query = null;
        String classidSearchInt = null;
        if (!classidsearch.equals("") && !accountid.equals("")) {
            classidSearchInt = Integer.toString(Integer.parseInt(classidsearch));
            query = "SELECT *\n"
                    + "FROM class\n"
                    + "INNER JOIN subject ON class.subjectID = subject.subjectID\n"
                    + "WHERE class.isApproved = 0 and class.ParentID = ? And class.classID like ?;";
        } else if (classidsearch.equals("") && !accountid.equals("")) {
            query = "SELECT *\n"
                    + "FROM class\n"
                    + "JOIN subject ON class.subjectID = subject.subjectID "
                    + "where class.isApproved = 0 and class.ParentID = ?";
        } else if (!classidsearch.equals("") && accountid.equals("")) {
            classidSearchInt = Integer.toString(Integer.parseInt(classidsearch));
            query = "SELECT *\n"
                    + "FROM class\n"
                    + "INNER JOIN subject ON class.subjectID = subject.subjectID\n"
                    + "WHERE class.isApproved = 0 and class.classID like ?;";
        }
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            if (!classidsearch.equals("") && !accountid.equals("")) {
                ps.setNString(1, accountid);
                ps.setNString(2, "%" + classidSearchInt + "%");
            } else if (classidsearch.equals("") && !accountid.equals("")) {
                ps.setNString(1, accountid);
            } else if (!classidsearch.equals("") && accountid.equals("")) {
                ps.setNString(1, "%" + classidSearchInt + "%");
            }
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Models.Class(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getDate(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getInt(13),
                        rs.getInt(14),
                        rs.getInt(15),
                        rs.getDate(16),
                        rs.getBoolean(17),
                        rs.getInt(18),
                        rs.getString(21),
                        rs.getString(19)
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Models.Class getAllClassListDetail(String x) {
        String query = "SELECT *\n"
                + "FROM class\n"
                + "INNER JOIN subject ON class.subjectID = subject.subjectID\n"
                + "WHERE class.classID = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, x);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Models.Class(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getDate(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getInt(13),
                        rs.getInt(14),
                        rs.getInt(15),
                        rs.getDate(16),
                        rs.getBoolean(17),
                        rs.getInt(18),
                        rs.getString(21),
                        rs.getString(19)
                );
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Models.Class> getListByPage(List<Models.Class> list,
            int start, int end) {
        ArrayList<Models.Class> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public List<Models.Request> getListRequestByPage(List<Models.Request> list,
            int start, int end) {
        ArrayList<Models.Request> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

//    public static void main(String[] args) {
//        DAOHUNG dao = new DAOHUNG();
//        List<Class> list = new ArrayList<>();
//        list = dao.getAllClasss();
//        for (Class o : list) {
//            System.out.println(o);
//        }
//    }
    public String cutStringAfterFirstSpace(String input) {
        int index = input.indexOf(' '); // Tìm vị trí của dấu cách đầu tiên
        if (index != -1) {
            return input.substring(index + 1); // Trả về phần còn lại của chuỗi từ vị trí sau dấu cách đầu tiên
        } else {
            return input; // Nếu không tìm thấy dấu cách, trả về chuỗi ban đầu
        }
    }

    public String formatNumberWithCommas(int outcome) {
        String outcomeString = String.valueOf(outcome);

        StringBuilder formattedOutcome = new StringBuilder();
        int count = 0;

        for (int i = outcomeString.length() - 1; i >= 0; i--) {
            formattedOutcome.insert(0, outcomeString.charAt(i));
            count++;

            if (count % 3 == 0 && i > 0) {
                formattedOutcome.insert(0, ".");
            }
        }
        String result = formattedOutcome.toString();
        return result;
    }

    public List<Account> getAllAccountsExceptBlock() {
        List<Account> list = new ArrayList<>();
        String sql = "SELECT * FROM Account WHERE Role IN (1, 2, 0) and [IsBlocked] = 0 ORDER BY UserName Asc ;";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Account acc = new Account();
                acc.setId(rs.getInt("AccountID"));
                acc.setUserName(rs.getString("UserName"));
                acc.setDateCreated(rs.getDate("DateCreated"));
                acc.setLastLogin(rs.getDate("LastLogin"));
                acc.setIsBlocked(rs.getBoolean("IsBlocked"));
                acc.setFullName(rs.getString("FullName"));
                acc.setEmail(rs.getString("Email"));
                acc.setPhone(rs.getString("Phone"));
                acc.setProfilePic(rs.getString("ProfilePic"));
                acc.setRole(rs.getInt("Role")
                );
                list.add(acc);
            }

        } catch (Exception ex) {
            Logger.getLogger(DAOHUNG.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Integer> getAllAccountIdControlByAdminId(int id) {
        List<Integer> list = new ArrayList<>();
        String sql = "select DISTINCT ParentID from class where AdminInCharge =?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(rs.getInt(1));
            }

        } catch (Exception ex) {
            Logger.getLogger(DAOHUNG.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Integer> getAllAccountIdControlByApprovedClass() {
        List<Integer> list = new ArrayList<>();
        String sql = "select DISTINCT ParentID from class where isapproved = 0";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(rs.getInt(1));
            }

        } catch (Exception ex) {
            Logger.getLogger(DAOHUNG.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Account> getAllAccountsNotAdminApproved() {
        DAOHUNG dao = new DAOHUNG();
        List<Integer> listI = dao.getAllAccountIdControlByApprovedClass();
        List<Account> list = new ArrayList<>();
        String sql = "SELECT * FROM Account WHERE AccountID = -1";
        for (int accountid : listI) {
            sql = sql + "or AccountID =" + accountid;
        }
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Account acc = new Account();
                acc.setId(rs.getInt("AccountID"));
                acc.setUserName(rs.getString("UserName"));
                acc.setDateCreated(rs.getDate("DateCreated"));
                acc.setLastLogin(rs.getDate("LastLogin"));
                acc.setIsBlocked(rs.getBoolean("IsBlocked"));
                acc.setFullName(rs.getString("FullName"));
                acc.setEmail(rs.getString("Email"));
                acc.setPhone(rs.getString("Phone"));
                acc.setProfilePic(rs.getString("ProfilePic"));
                acc.setRole(rs.getInt("Role")
                );
                list.add(acc);
            }

        } catch (Exception ex) {
            Logger.getLogger(DAOHUNG.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Account> getAllAccountsNotAdmin(int id) {
        DAOHUNG dao = new DAOHUNG();
        List<Integer> listI = dao.getAllAccountIdControlByAdminId(id);
        List<Account> list = new ArrayList<>();
        String sql = "SELECT * FROM Account WHERE AccountID = -1";
        for (int accountid : listI) {
            sql = sql + "or AccountID =" + accountid;
        }
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Account acc = new Account();
                acc.setId(rs.getInt("AccountID"));
                acc.setUserName(rs.getString("UserName"));
                acc.setDateCreated(rs.getDate("DateCreated"));
                acc.setLastLogin(rs.getDate("LastLogin"));
                acc.setIsBlocked(rs.getBoolean("IsBlocked"));
                acc.setFullName(rs.getString("FullName"));
                acc.setEmail(rs.getString("Email"));
                acc.setPhone(rs.getString("Phone"));
                acc.setProfilePic(rs.getString("ProfilePic"));
                acc.setRole(rs.getInt("Role")
                );
                list.add(acc);
            }

        } catch (Exception ex) {
            Logger.getLogger(DAOHUNG.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void editClassAdminDeApproved(int id) {
        String query = "update Class set ClassStatus = 0 where classID = ? ";
        try {
            //mo ket noi voi sql
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();

        }
    }

    public int getParentIdByClassID(int id) {
        String query = "select parentID from class where classID =  ? ";
        try {
            //mo ket noi voi sql
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public void editClassAdmin(int subject, String address, String addresspublic, String linkmap, int payperses, int sesperweek,
            int timeperses, int tutoredlevel, int tutorgender, int studentnum, String classDescription, int classid) {
        String query = "update Class\r\n"
                + "set [SubjectID] = ?,\r\n"
                + "[ActualAddress] = ?,\r\n"
                + "[PublicAddress] = ?,\r\n"
                + "[Map] = ?,\r\n"
                + "[PayPerSession] = ?,\r\n"
                + "[SesPerWeek] = ?,\r\n"
                + "[TimeS]= ?,\r\n"
                + "[TutorEdLevel]= ?,\r\n"
                + "[TutorGender]=?,\r\n"
                + "[StudentNum]=?,\r\n"
                + "[ClassDescription]=?\r\n"
                + "[OpenDate]= GETDATE()\r\n"
                + "where [ClassID] = ?";
        try {
            //mo ket noi voi sql
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setInt(1, subject);
            ps.setNString(2, address);
            ps.setNString(3, addresspublic);
            ps.setNString(4, linkmap);
            ps.setInt(5, payperses);
            ps.setInt(6, sesperweek);
            ps.setInt(7, timeperses);
            ps.setInt(8, tutoredlevel);
            ps.setInt(9, tutorgender);
            ps.setInt(10, studentnum);
            ps.setNString(11, classDescription);
            ps.setInt(12, classid);
            rs = ps.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();

        }
    }

    public Account getAccount(int id) {
        String sql = "Select * from [Account] where AccountID = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(
                        rs.getInt("AccountID"),
                        rs.getString("UserName"),
                        rs.getDate("DateCreated"),
                        rs.getDate("LastLogin"),
                        rs.getBoolean("IsBlocked"),
                        rs.getString("FullName"),
                        rs.getString("Phone"), // Chuyển phone trước email
                        rs.getString("Email"), // Chuyển email sau phone
                        rs.getString("ProfilePic"),
                        rs.getInt("Role")
                );

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public int getAccountIdByClassID(String idClass) {
        String sql = "Select ParentID from class where ClassID = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, idClass);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public String idClassControlByAdmin(int adminIncharge) {
        String list = null;
        String query = "select classID from class where adminIncharge = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setInt(1, adminIncharge);
            rs = ps.executeQuery();
            while (rs.next()) {
                    list = list + " ,"  + rs.getString(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Models.Request> getAllRequestByTutor(int adminIncharge) {
        DAOHUNG dao = new DAOHUNG();
        String listIdClassR = dao.idClassControlByAdmin(adminIncharge);
        if(listIdClassR == null){
            return null;
        }
        String [] listIdClassRS = listIdClassR.split(" ,");
        String query = "SELECT *FROM Request where requestType = 0 and ( ";
        for(String a : listIdClassRS){
        query = query + "classID = "  + a + " or ";
        }
        query = query +" classID is null ) order by requeststatus asc";
        List<Models.Request> list = new ArrayList<>();
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Models.Request(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getDate(5),
                        rs.getInt(6),
                        rs.getDate(7),
                        rs.getDate(8),
                        rs.getString(9)
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Models.Request> getAllRequestByParent(int adminIncharge) {
        DAOHUNG dao = new DAOHUNG();
        String listIdClassR = dao.idClassControlByAdmin(adminIncharge);
        if(listIdClassR == null){
            return null;
        }
        String [] listIdClassRS = listIdClassR.split(" ,");
        String query = "SELECT *FROM Request where requestType = 1 and ( ";
        for(String a : listIdClassRS){
        query = query + "classID = "  + a + " or ";
        }
        query = query +" classID is null ) order by requeststatus asc";
        List<Models.Request> list = new ArrayList<>();
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Models.Request(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getDate(5),
                        rs.getInt(6),
                        rs.getDate(7),
                        rs.getDate(8),
                        rs.getString(9)
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Models.Request getRequestByID(String id) {
        String query = "SELECT *FROM Request where requestID= ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Models.Request(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getDate(5),
                        rs.getInt(6),
                        rs.getDate(7),
                        rs.getDate(8),
                        rs.getString(9)
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void updateRequestDisagree(String classid, String tutorid) {
        String query = "Update request set RequestStatus = 2 where classid= ? and tutorid = ?";
        try {
            //mo ket noi voi sql
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setNString(1, classid);
            ps.setNString(2, tutorid);
            rs = ps.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();

        }
    }

    public void updateRequestAgree(String trialEndDate, String contractLink, String requestID, String classid, String tutorid) {
        String query = "Update request set RequestStatus = 1, \n"
                + "TrialEndDate= ?, ContractLink=?, AcceptDate= GETDATE() where classid = ? and tutorid =? ";
        try {
            //mo ket noi voi sql
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setNString(1, trialEndDate);
            ps.setNString(2, contractLink);
            ps.setNString(3, classid);
            ps.setNString(4, tutorid);
            rs = ps.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();

        }
    }

}
