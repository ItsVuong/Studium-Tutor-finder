/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.Tutor;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author DELL
 */
public class ClassDAO {

    private Connection con;
    private String status = "OK";
    private PreparedStatement ps = null;
    ResultSet rs = null;

    public ClassDAO() {
        try {
            con = new DBContext().getConnection();
        } catch (Exception e) {
            status = "Error at connection" + e.getMessage();
        }
    }

    public void createClass(int parentID, int gender, int pay,
            int sessions, int time, String description, String date,
            String actualAddress,
            int tutorEdlevel,
            int subjectID,
            int numOfStudents
    ) {
        String query = "INSERT INTO [dbo].[Class]\n"
                + "          (\n"
                + "			 [ParentID]\n"
                + "			,[TutorGender]\n"
                + "			,[PayPerSession]\n"
                + "			,[SesPerWeek]\n"
                + "			,[TimeS]\n"
                + "			,[OpenDate]\n"
                + "			,[ClassDescription]\n"
                + "			,[ActualAddress]\n"
                + "			,[SubjectID]\n"
                + "			,[StudentNum]\n"
                + "			,[TutorEdLevel]"
                + ",[isApproved], [ClassStatus])\n"
                + "		  \n"
                + "    VALUES(?,?,?,?,?,?,?,?,?,?,?,0,1)\n";
        try {
            ps = con.prepareStatement(query);
            ps.setInt(1, parentID);
            ps.setInt(2, gender);
            ps.setInt(3, pay);
            ps.setInt(4, sessions);
            ps.setInt(5, time);
            ps.setString(6, date);
            ps.setNString(7, description);
            ps.setNString(8, actualAddress);
            ps.setInt(9, subjectID);
            ps.setInt(10, numOfStudents);
            ps.setInt(11, tutorEdlevel);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());

        }

    }

//xoá class của parent bằng cách set status = 0
    public void ParentClassDelete(int classId) {
        String query = "UPDATE Class\n"
                + "SET ClassStatus = 0\n"
                + "WHERE ClassID = ? and TutorID is null";

        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setInt(1, classId);

            // Thực hiện câu truy vấn cập nhật
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

//check xem lớp này có xoá được hay không
    public boolean canDeleteClass(int classId) {
        try {
            con = new DBContext().getConnection();
            String query = "SELECT ClassStatus FROM Class WHERE ClassID = ?";
            ps = con.prepareStatement(query);
            ps.setInt(1, classId);
            rs = ps.executeQuery();

            if (rs.next()) {
                int classStatus = rs.getInt("ClassStatus");

                // Kiểm tra điều kiện để xác định có thể xoá lớp hay không
                return (classStatus == 0); // Giả sử 0 là trạng thái cho việc có thể xoá lớp
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return false; // Mặc định không xoá lớp nếu có lỗi xảy ra
    }

    public boolean unactiveClass(int classId) {
        try {
            con = new DBContext().getConnection();
            String query = "UPDATE Class SET ClassStatus = 0 WHERE ClassID = ? AND TutorID IS NULL";
            ps = con.prepareStatement(query);
            ps.setInt(1, classId);

            int row = ps.executeUpdate();
            if (row > 0) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return false; // Mặc định không xoá lớp nếu có lỗi xảy ra
    }
//manage parent

    public List<Models.Class> getAllClasss(int userID) {
        List<Models.Class> list = new ArrayList<>();
        TutorDAO dao = new TutorDAO();
        String query = "		SELECT *\n"
                + "FROM class\n"
                + "JOIN subject ON class.subjectID = subject.subjectID\n"
                + "WHERE ParentID = ?\n AND Class.ClassStatus = 1"
                + "ORDER BY Class.OpenDate DESC, Class.ClassID DESC;";

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
                    tutorFullName = dao.getTutorProfileByTutorID(tutorID).getFullName();
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
//
//    public static void main(String[] args) {
//        ClassDAO t = new ClassDAO();
//        List<Models.Class> list = new ArrayList<>();
//        System.out.println("ádsd");
////        list = t.getAllClassSearch(1, "Toán 11");
////        for (Models.Class a : list) {
////            a.toString();
////        }
//    }

    public List<Models.Class> getAllClassSearch(int classStatus, int subjectID, int userID) {
        List<Models.Class> list = new ArrayList<>();
        TutorDAO dao = new TutorDAO();
        String query = "SELECT [ClassID],[TutorID],[ParentID],[AdminInCharge],[TutorGender],[PayPerSession],[SesPerWeek],[TimeS],[OpenDate],[ClassDescription],[PublicAddress],[ActualAddress],Class.[SubjectID],[Subject].[SubjectName],[TutorEdLevel],[StudentNum],[CheckDate],[IsApproved],[ClassStatus],[Map]\n"
                + "FROM Class \n"
                + "JOIN Subject ON Class.[SubjectID] = [Subject].SubjectID\n"
                + "WHERE [Subject].[SubjectID] = ? AND Class.IsApproved = ? AND Class.ClassStatus = 1 AND ParentID = ?;";
//     String query = "		SELECT *\n"
//                + "FROM class\n"
//                + "JOIN subject ON class.subjectID = subject.subjectID\n"
//                + "WHERE ParentID = ?\n"
//                + "ORDER BY Class.OpenDate DESC, Class.ClassID DESC;";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setInt(1, subjectID);
            ps.setInt(2, classStatus);
            ps.setInt(3, userID);
            rs = ps.executeQuery();
            while (rs.next()) {

                list.add(new Models.Class(
                        rs.getInt(1),
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
                        rs.getString(14),
                        rs.getInt(15),
                        rs.getInt(16),
                        rs.getDate(17),
                        rs.getBoolean(18),
                        rs.getInt(19),
                        rs.getString(20)
                ));

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;

    }
}

//search manage parent
//    public List<Models.Class> getAllClassSearch(int classStatus, String subject) {
//        List<Models.Class> list = new ArrayList<>();
//        TutorDAO dao = new TutorDAO();
//        String query = "SELECT *\n"
//                + "FROM Class \n"
//                + "LEFT JOIN Subject ON Class.SubjectID = Subject.SubjectID\n"
//                + "inner JOIN StatusClass ON Class.ClassStatus = StatusClass.StatusClass\n"
//                + "WHERE Subject.SubjectID = ? AND StatusClass.StatusClass = ? AND Class.ParentID = ?";
//        try {
//            con = new DBContext().getConnection();
//            ps = con.prepareStatement(query);
//            ps.setInt(1, classStatus);
//            ps.setString(2, subject);
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                int tutorID = rs.getInt(2);
//                String tutorFullName = null;
//
//                // Check if tutorID is not null
//                if (!rs.wasNull()) {
//                    // Retrieve the tutor's full name only if tutorID is not null
//                    tutorFullName = dao.getTutorProfileByTutorID(tutorID).getFullName();
//                }
//
//                list.add(new Models.Class(rs.getInt(1),
//                        tutorID,
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
//                        rs.getString(19),
//                        tutorFullName
//                ));
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return list;
//    }
//
//}
//}

