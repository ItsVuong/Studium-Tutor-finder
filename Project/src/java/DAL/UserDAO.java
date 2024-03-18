/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import java.sql.Connection;
import Models.*;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import Models.Account;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class UserDAO {

    private Connection con;
    private String status = "OK";
    private PreparedStatement ps = null;
    ResultSet rs = null;

    public UserDAO() {
        try {
            con = new DBContext().getConnection();
        } catch (Exception e) {
            status = "Error at connection" + e.getMessage();
        }
    }

    public Account userLogin(String username, String password) throws NoSuchAlgorithmException {
        password = SHAHash.createSHA(password);
        String currentDate = LocalDate.now().toString();
        String queryAccount = "Select AccountID, Fullname, UserName, DateCreated, LastLogin, IsBlocked, Email, Phone, ProfilePic, Role "
                + "from [Account] where UserName = ? and HashedPassword = ?";

        String updateLastLogin = "update Account set Lastlogin = ? Where AccountID = ?";
        PreparedStatement psLastLogin = null;
        try {
            psLastLogin = con.prepareStatement(updateLastLogin);
            psLastLogin.setString(1, currentDate);

            ps = con.prepareStatement(queryAccount);
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();
            while (rs.next()) {
                Account acc = new Account();
                acc.setId(rs.getInt("AccountID"));
                acc.setUserName(rs.getString("UserName"));
                acc.setDateCreated(rs.getDate("DateCreated"));
                acc.setLastLogin(rs.getDate("LastLogin"));
                acc.setFullName(rs.getString("FullName"));
                acc.setIsBlocked(rs.getBoolean("IsBlocked"));
                acc.setFullName(rs.getString("FullName"));
                acc.setEmail(rs.getString("Email"));
                acc.setPhone(rs.getString("Phone"));
                acc.setProfilePic(rs.getString("ProfilePic"));
                acc.setRole(rs.getInt("Role"));

                psLastLogin.setInt(2, rs.getInt("AccountID"));
                psLastLogin.executeUpdate();
                return acc;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public Account userLoginEmail(String email, String password) throws NoSuchAlgorithmException {
        password = SHAHash.createSHA(password);
        String queryAccount = "Select AccountID,FullName, UserName, DateCreated, LastLogin, IsBlocked, Email, Phone, ProfilePic, Role "
                + "from [Account] where Email = ? and HashedPassword = ?";

        try {
            ps = con.prepareStatement(queryAccount);
            ps.setString(1, email);
            ps.setString(2, password);
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
                acc.setRole(rs.getInt("Role"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void createAccount(String fullName, String phone, String email, int role, String username, String password) {
        String hashedPassword;
        try {
            hashedPassword = SHAHash.createSHA(password);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            return;
        }

        String insertAccount = "INSERT INTO [Account] "
                + "(FullName, Phone, Email, ProfilePic, Role, UserName, HashedPassword, DateCreated, IsBlocked) "
                + "VALUES(?,?,?,?,?,?,?,?,?)";

        PreparedStatement insertAccountPs = null;
        try {
            insertAccountPs = con.prepareStatement(insertAccount);
            insertAccountPs.setString(1, fullName);
            insertAccountPs.setString(2, phone);
            insertAccountPs.setString(3, email);
            insertAccountPs.setString(4, "default.jpg");
            insertAccountPs.setInt(5, role);
            insertAccountPs.setString(6, username);
            insertAccountPs.setString(7, hashedPassword);
            insertAccountPs.setString(8, LocalDate.now().toString());
            insertAccountPs.setInt(9, 0);
            insertAccountPs.execute();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (insertAccountPs != null && !insertAccountPs.isClosed()) {
                    insertAccountPs.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public int getUser(String username) {
        String usernameQuery = "SELECT COUNT(1) FROM Account WHERE username = ?";
        PreparedStatement psUsername;
        ResultSet rsUsername;
        int count = 0;
        try {
            psUsername = con.prepareStatement(usernameQuery);
            psUsername.setString(1, username);
            rsUsername = psUsername.executeQuery();
            while (rsUsername.next()) {
                count = rsUsername.getInt(1);
            }
            return count;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }
    
    public void updateAvatar(String imgName, int id){
        PreparedStatement avatarPs = null;
        String update = "UPDATE [Account]\n"
                + "SET ProfilePic = ?\n"
                + "WHERE AccountID = ?;";
        
        try {
            avatarPs = con.prepareStatement(update);
            avatarPs.setString(1, imgName);
            avatarPs.setInt(2, id);
            avatarPs.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } 
        
    }

}
