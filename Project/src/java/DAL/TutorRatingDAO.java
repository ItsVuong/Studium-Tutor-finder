/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.Account;
import Models.TutorRating;
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
 * @author Acer
 */
public class TutorRatingDAO {

    private Connection con;
    private String status = "OK";
    private PreparedStatement ps = null;
    ResultSet rs = null;

    public TutorRatingDAO() {
        try {
            con = new DBContext().getConnection();
        }
        catch (Exception e) {
            status = "Error at connection" + e.getMessage();
        }
    }

    public List<TutorRating> getAllTutorRatingByTutorID(int tutorId) {
        List<TutorRating> list = new ArrayList<>();
        String query = "SELECT t.ParentID, t.TutorID, t.TimeCreated, t.Detail, t.Status, t.Rating\n"
                + "FROM TutorRating t\n"
                + "JOIN Account ON Account.AccountID = t.ParentID\n"
                + "JOIN Tutor ON Tutor.TutorID = t.TutorID\n"
                + "JOIN Class ON Class.ParentID = Account.AccountID AND Class.TutorID = Tutor.TutorID\n"
                + "WHERE Class.IsApproved = 1 AND Class.ClassStatus = 3\n"
                + "    AND Class.ParentID = t.ParentID\n"
                + "    AND Class.TutorID = t.TutorID\n"
                + "    AND Tutor.TutorID = ?\n"
                + "ORDER BY t.TimeCreated DESC;";

        try {
            PreparedStatement st = con.prepareStatement(query);
            st.setInt(1, tutorId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                //System.out.println("Hello");
                list.add(new TutorRating(rs.getInt(1), rs.getInt(2), rs.getDate(3), rs.getString(4), rs.getInt(5), rs.getInt(6)));
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Account> getAllAccount() {
        List<Account> list = new ArrayList<>();
        String query = "Select * from Account";

        try {
            PreparedStatement st = con.prepareStatement(query);
            ResultSet rs = st.executeQuery();
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
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

//    public int getAverageRating(int tutorid) {
//        int averageRating = 0;
//        String sql = "SELECT \n"
//                + "CASE\n"
//                + "WHEN (SELECT COUNT(*) FROM TutorRating WHERE TutorID = ?) = 0 THEN 0\n"
//                + "ELSE SUM(Rating) / (SELECT COUNT(*) FROM TutorRating WHERE TutorID = ?)\n"
//                + "END AS averageRating\n"
//                + "FROM TutorRating";
//        try ( PreparedStatement ps = con.prepareStatement(sql)) {
//            ps.setInt(1, tutorid);
//            ps.setInt(2, tutorid);
//            rs = ps.executeQuery();
//            if (rs.next()) {
//                averageRating = rs.getInt("averageRating");
//            }
//        }
//        catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return averageRating;
//    }
    public int getAllStarFromTutorId(int tutorid) {
        int allStart = 0;
        String sql = "SELECT \n"
                + "CASE\n"
                + "WHEN SUM(Rating) IS NULL THEN 0\n"
                + "ELSE SUM(Rating)\n"
                + "END AS averageRating\n"
                + "FROM TutorRating Where TutorID = ?";
        try ( PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, tutorid);
            rs = ps.executeQuery();
            if (rs.next()) {
                allStart = rs.getInt("averageRating");
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        return allStart;
    }

    public int getFeedbackCountFromTutorID(int tutorid) {
        int feedbackCount = 0;
        String sql = "SELECT COUNT(*) AS feedbackCount FROM TutorRating WHERE TutorID = ?";
        try ( PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, tutorid);
            rs = ps.executeQuery();
            if (rs.next()) {
                feedbackCount = rs.getInt("feedbackCount");
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        return feedbackCount;
    }

    public int getRowCountByRating(int tutorid, int rating) {
    int count_of_rows = 0;
    String sql = "SELECT COUNT(*) AS count_of_rows "
            + "FROM TutorRating "
            + "WHERE Rating = ? AND TutorID = ?";
    try (PreparedStatement ps = con.prepareStatement(sql)) {
        ps.setInt(1, rating);
        ps.setInt(2, tutorid);
        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                count_of_rows = rs.getInt("count_of_rows");
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return count_of_rows;
}

    public static void main(String[] args) {
        int tutorid = 7;
        List<Account> accountList = new TutorRatingDAO().getAllAccount();
        List<TutorRating> listName = new TutorRatingDAO().getAllTutorRatingByTutorID(tutorid);
        for (TutorRating id : listName) {
            for (Account a : accountList) {
                if (id.getParentID() == a.getId()) {
                    System.out.println(a.getUserName());
                    break; // Đảm bảo chỉ in ra một lần cho mỗi id phù hợp
                }
            }
        }

//        int rate = new TutorRatingDAO().getAllStarFromTutorId(tutorid);
        int count = new TutorRatingDAO().getFeedbackCountFromTutorID(6);
//        int a = rate / count;
//        System.out.println(rate);
        System.out.println(count);
//        System.out.println(a);
        
        
        int star = 5;
        new TutorRatingDAO().getRowCountByRating(tutorid, star);
        System.out.println(new TutorRatingDAO().getRowCountByRating(tutorid, star));
    }

}
