/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.Account;
import Models.Subject;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DELL
 */
public class SubjectDAO {

    private Connection con;
    private String status = "OK";
    private PreparedStatement ps = null;
    ResultSet rs = null;

    public SubjectDAO() {
        try {
            con = new DBContext().getConnection();
        } catch (Exception e) {
            status = "Error at connection" + e.getMessage();
        }
    }

    public List<Subject> getAll() {
        List<Subject> list = new ArrayList<>();
        String query = "SELECT [SubjectID]\n"
                + "      ,[SubjectName], [isPopular]\n"
                + "  FROM [SWP_Studium].[dbo].[Subject] ORDER BY SubjectName ASC;";
        try {
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Subject sub = new Subject();
                sub.setSubjectID(rs.getInt(1));
                sub.setSubjectName(rs.getString(2));
                sub.setPopular(rs.getBoolean(3));
                list.add(sub);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Subject> getTutorSubject(int tutorID) throws SQLException {
        Connection conn = null;
        List<Subject> list = new ArrayList<>();
        String query = "SELECT b.SubjectID, b.SubjectName FROM Tutor_Subject as a "
                + "INNER JOIN subject as b on b.SubjectID = a.SubjectID WHERE a.TutorID = ?\n"
                + "ORDER BY SubjectName ASC;";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, tutorID);
            rs = ps.executeQuery();
            while (rs.next()) {
                Subject sub = new Subject();
                sub.setSubjectID(rs.getInt("SubjectID"));
                sub.setSubjectName(rs.getString("SubjectName"));
                list.add(sub);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(TutorDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(SubjectDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return null;
    }

    public List<Integer> getTutorSubjectID(int tutorID) throws SQLException {
        Connection conn = null;
        List<Integer> list = new ArrayList<>();
        String query = "SELECT SubjectID FROM Tutor_Subject "
                + "WHERE TutorID = ?\n";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, tutorID);
            rs = ps.executeQuery();
            while (rs.next()) {
                int sub = rs.getInt("SubjectID");
                list.add(sub);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(TutorDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(SubjectDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return null;
    }

    public void updateTutorSubject(int tutorID, String[] subjectList) throws SQLException {
        Connection conn = null;
        String delete = "DELETE FROM Tutor_Subject WHERE TutorID = ?";
        String insert = "INSERT INTO Tutor_Subject (TutorID, SubjectID) VALUES (?, ?)";
        PreparedStatement deletePs = null;
        PreparedStatement insertPs = null;

        try {
            conn = new DBContext().getConnection();
            deletePs = conn.prepareStatement(delete);
            insertPs = conn.prepareStatement(insert);
            deletePs.setInt(1, tutorID);
            deletePs.execute();
            if (subjectList != null) {
                for (String subjectList1 : subjectList) {
                    insertPs.setInt(1, tutorID);
                    insertPs.setInt(2, Integer.parseInt(subjectList1));
                    insertPs.addBatch();
                }
                insertPs.executeBatch();
            }
        } catch (SQLException ex) {
            Logger.getLogger(TutorDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(SubjectDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closeResource(conn);
            closeResource(deletePs);
            closeResource(insertPs);
        }
    }

    private void closeResource(PreparedStatement ps) {
        if (ps != null) {
            try {
                ps.close();
            } catch (SQLException ex) {
                Logger.getLogger(SubjectDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    private void closeResource(Connection conn) {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException ex) {
                Logger.getLogger(SubjectDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}
