/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.Location;
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
 * @author Asus
 */
public class LocationDAO {
    
    public List<Location> getAllLocation() throws SQLException {
        Connection conn = null;
        List<Location> list = new ArrayList<>();
        String query = "SELECT LocationID, LocationName FROM Location "
                + "ORDER BY LocationName ASC;";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Location location = new Location();
                location.setLocationID(rs.getInt("LocationID"));
                location.setLocationName(rs.getString("LocationName"));
                list.add(location);
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
    
    public List<Integer> getTutorLocationID(int tutorID) throws SQLException {
        Connection conn = null;
        List<Integer> list = new ArrayList<>();
        String query = "select LocationID FROM Tutor_Location WHERE TutorID = ?\n";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, tutorID);
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("LocationID");
                list.add(id);
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
    
    public void updateTutorLocation(int tutorID, String[] locationList) throws SQLException {
        Connection conn = null;
        String delete = "DELETE FROM Tutor_Location WHERE TutorID = ?";
        String insert = "INSERT INTO Tutor_Location (TutorID, LocationID) VALUES (?, ?)";
        PreparedStatement deletePs = null;
        PreparedStatement insertPs = null;

        try {
            conn = new DBContext().getConnection();
            deletePs = conn.prepareStatement(delete);
            insertPs = conn.prepareStatement(insert);
            deletePs.setInt(1, tutorID);
            deletePs.execute();
            if (locationList != null) {
                for (String subjectList1 : locationList) {
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
