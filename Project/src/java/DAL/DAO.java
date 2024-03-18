/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import java.sql.Connection;
import java.util.List;
import Models.*;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import Models.Class;
import Models.Account;
import Models.Location;
import java.awt.print.Book;
import java.sql.SQLException;

public class DAO {

    private Connection con;
    private String status = "OK";
    private PreparedStatement ps = null;
    ResultSet rs = null;

    public DAO() {
        try {
            con = new DBContext().getConnection();
        }
        catch (Exception e) {
            status = "Error at connection" + e.getMessage();
        }
    }

    public Account getUser(String usr) {
        String sql = "Select * from [Account] where UserName = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, usr);
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
        }
        catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Account getUserById(int id) {
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
        }
        catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public static void main(String[] args) {
        String usr = "admin2";
        DAO d = new DAO();
        Account a = d.getUser(usr);
        System.out.println("Found account for user " + usr + ":");
        System.out.println(a.getEmail());
        System.out.println(a.getPhone());

    }

    public Account getEmail(String email) {
        String sql = "Select * from [Account] where Email = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, email);
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
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public Account getPhone(String phone) {
        String sql = "Select * from [Account] where Phone = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, phone);
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
        }
        catch (Exception e) {
            status = "Error at getPhone" + e.getMessage();
            System.out.println(status);
        }
        return null;
    }

    public boolean changePasswordEmail(String newPassword, String email) throws NoSuchAlgorithmException {
        try {
            newPassword = SHAHash.createSHA(newPassword);

            String sql = "UPDATE [Account] SET HashedPassword = ? WHERE Email = ?";
            ps = con.prepareStatement(sql);

            ps.setString(1, newPassword);
            ps.setString(2, email);

            int rowsUpdated = ps.executeUpdate();

            if (rowsUpdated > 0) {
                // Password changed successfully
                return true;
            }
            else {
                // No rows were updated, possibly due to incorrect username
                return false;
            }
        }
        catch (Exception e) {
            status = "Error at changePassword " + e.getMessage();
            System.out.println(status);
            return false;
        }
    }
//Phan cua Tung

    public boolean UpdateUser(String usr, String name, String phone, String img) throws NoSuchAlgorithmException {
        String sql = "UPDATE [Account]\n"
                + "SET FullName = ?,\n"
                + "    Phone = ? \n"
                + "WHERE UserName = ?;";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setNString(1, name);
            ps.setString(2, phone);
            ps.setString(3, usr);

            int rowsAffected = ps.executeUpdate();

            return rowsAffected > 0;
        }
        catch (Exception e) {
            status = "Error at getUser " + e.getMessage();
            System.out.println(status);
        }
        return false;
    }

    public boolean changePassword(String newPassword, String username) throws NoSuchAlgorithmException {
        try {
            newPassword = SHAHash.createSHA(newPassword);

            String sql = "UPDATE [Account] SET HashedPassword = ? WHERE UserName = ?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, newPassword);
            ps.setString(2, username);

            int rowsUpdated = ps.executeUpdate();

            if (rowsUpdated > 0) {
                // Password changed successfully
                return true;
            }
            else {

                return false;
            }
        }
        catch (Exception e) {
            status = "Error at changePassword " + e.getMessage();
            System.out.println(status);
            return false;
        }
    }

    public List<Account> getAllAccountsExceptBlock() {
        List<Account> list = new ArrayList<>();
        String sql = "SELECT * FROM Account WHERE Role IN (1, 2, 3) and [IsBlocked] = 0;";
        System.out.println("SQL Query: " + sql);

        try {
            PreparedStatement st = con.prepareStatement(sql);
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
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Account> getAllAccountsBlock() {
        List<Account> list = new ArrayList<>();
        String sql = "SELECT * FROM Account WHERE Role IN (1, 2, 3) and [IsBlocked] = 1;";
        System.out.println("SQL Query: " + sql);

        try {
            PreparedStatement st = con.prepareStatement(sql);
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
            System.out.println(e);
        }
        return list;
    }

    public List<Account> getAccountsByUserNameOrEmailOrPhoneOrFullName(String txtSearch, String role, boolean block) {
        List<Account> listA = new ArrayList<>();
        String sql;
        if ("5".equals(role)) {
            sql = "SELECT * FROM Account WHERE (UserName LIKE ? OR Email LIKE ? OR Phone LIKE ? OR FullName LIKE ?) AND IsBlocked = ? AND Role IN (1,2,3);";
        }
        else if ("4".equals(role)) {
            sql = "SELECT * FROM Account WHERE (UserName LIKE ? OR Email LIKE ? OR Phone LIKE ? OR FullName LIKE ?) AND IsBlocked = ? AND Role IN (1,2,3);";
        }
        else {//1,2,3
            sql = "SELECT * FROM Account WHERE (UserName LIKE ? OR Email LIKE ? OR Phone LIKE ? OR FullName LIKE ?) AND IsBlocked = ?  AND Role=? ;";
        }
        System.out.println("SQL Query: " + sql);

        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, "%" + txtSearch + "%");
            st.setString(2, "%" + txtSearch + "%");
            st.setString(3, "%" + txtSearch + "%");
             st.setString(4, "%" + txtSearch + "%");
            st.setBoolean(5, block);
            if (!"5".equals(role) && !"4".equals(role)) {
                st.setString(6, role);
            }
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
                acc.setRole(rs.getInt("Role"));
                listA.add(acc);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listA;
    }
    

    public List<Account> findRole(String role) {
        List<Account> listA = new ArrayList<>();
        String sql = "Select * From Account Where Role= ?  and [IsBlocked] = 0";
        System.out.println("SQL Query: " + sql);
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, role);
            ResultSet rs = ps.executeQuery();
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
                listA.add(acc);
            }
        }
        catch (SQLException e) {
            System.out.println(e);
        }
        return listA;
    }

    public Account blockAccountByUser(String user) {
        String sql = "Update Account Set [IsBlocked] = 1 Where UserName = ?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, user);
            ResultSet rs = st.executeQuery();
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

    public Account updateIsBlockedAccountByUser(String user) {
        String sql = "Update Account Set [IsBlocked] = 0 Where UserName = ?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, user);
            ResultSet rs = st.executeQuery();
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
        }
        catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public boolean blockOrUnBlockAccount(Account acc, boolean blockValue) {
        String sql = "UPDATE Account SET [IsBlocked] = ? WHERE AccountID = ?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setBoolean(1, blockValue);
            st.setInt(2, acc.getId());
            int rowsAffected = st.executeUpdate();
            return rowsAffected > 0; // Trả về true nếu có ít nhất một hàng được cập nhật
        }
        catch (SQLException e) {
            System.out.println(e);
            return false; // Trả về false nếu có lỗi xảy ra
        }
    }

    public List<Class> getHistoryClassByAccountID(String id) {
    List<Class> classList = new ArrayList<>();
    String sql = "SELECT Class.ClassID, Class.IsApproved, Class.PayPerSession, Class.SesPerWeek, Class.OpenDate, Subject.SubjectName,Class.publicAddress, Class.TutorEdLevel " +
                 "FROM Class " +
                 "LEFT JOIN Account ON Class.ParentID = Account.AccountID " +
                 "LEFT JOIN Tutor ON Tutor.TutorID = Class.TutorID " +
                 "LEFT JOIN Subject ON Subject.SubjectID = Class.SubjectID " +
                 "LEFT JOIN Tutor_Subject ON Tutor_Subject.SubjectID = Subject.SubjectID " +
                 "WHERE Account.AccountID = ? AND Account.Role = 3";
    //thiếu Class.isApproved
    System.out.println("SQL Query: " + sql);
    try {
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, id);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Class cls = new Class();
            cls.setClassID(rs.getInt("ClassID"));
            cls.setIsApproved(rs.getBoolean("IsApproved"));
            cls.setPayPerSession(rs.getInt("PayPerSession"));
            cls.setSesPerWeek(rs.getInt("SesPerWeek"));
            cls.setOpenDate(rs.getDate("OpenDate"));
            cls.setSubject(rs.getString("SubjectName"));
            cls.setPublicAddress(rs.getString("PublicAddress"));
            cls.setTutorEdlevel(rs.getInt("TutorEdLevel"));
            classList.add(cls);
        }
    } catch (SQLException e) {
        System.out.println(e);
    }
    return classList;
}


    public List<Account> getListByAccount(List<Account> list, int start, int end) {
        ArrayList<Account> acc = new ArrayList<>();
        for (int i = start; i < end; i++) {
            acc.add(list.get(i));
        }
        return acc;
    }
    
 
}
