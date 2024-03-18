
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.Location;
import Models.Subject;
import Models.Tutor;
import Models.TutorProfile;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Acer
 */
public class TutorDAO {

    private Connection con;
    private String status = "OK";
    private PreparedStatement ps = null;
    ResultSet rs = null;

    public TutorDAO() {
        try {
            con = new DBContext().getConnection();
        } catch (Exception e) {
            status = "Error at connection" + e.getMessage();
        }
    }

    public Tutor getTutorByUserName(String usr) {
        String sql = "select t.tutorId, t.dateofbirth, t.gender, t.school, t.major, t.graduationyear, t.educationlevel, t.introduction, t.idcardpic1, t.idcardpic2, t.isactive, t.isvalidated from tutor t join Account a on t.TutorID = a.AccountID\n"
                + "where a.UserName=? and a.Role=2 and a.IsBlocked=0 and t.IsActive =1  and t.IsValidated = 1";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, usr);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Tutor(
                        rs.getInt(1),
                        rs.getDate(2),
                        rs.getBoolean(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getBoolean(11),
                        rs.getBoolean(12)
                );
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Tutor getTutor(int tutorId) {
        String sql = "select t.tutorId, t.dateofbirth, t.gender, t.school, t.major, t.graduationyear, t.educationlevel, t.introduction, t.idcardpic1, t.idcardpic2, t.isactive, t.isValidated from tutor t\n"
                + "where t.TutorID = ?";
        String getRejectStatus = "Select IsRejected from Tutor WHERE TutorID = ?";
        PreparedStatement rejectStatus = null;
        ResultSet result = null;
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, tutorId);
            rs = ps.executeQuery();
            System.out.println("test");
            rejectStatus = con.prepareStatement(getRejectStatus);
            rejectStatus.setInt(1, tutorId);
            result = rejectStatus.executeQuery();
            while (rs.next()) {
                System.out.println("test");
                Tutor tutor = new Tutor(
                        rs.getInt(1),
                        rs.getDate(2),
                        rs.getBoolean(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getBoolean(11),
                        rs.getBoolean(12)
                );
                result.next();
                tutor.setIsRejected(result.getBoolean("IsRejected"));
                System.out.println("rej " + tutor.getIsRejected());
                return tutor;
            }

        } catch (SQLException ex) {
            Logger.getLogger(TutorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void updateTutorIds(int usr, String pic, int idCardSide) {
        String updateIdPic1 = "UPDATE Tutor SET Tutor.idCardPic1 = ? WHERE TutorID = ?";
        String updateIdPic2 = "UPDATE Tutor SET Tutor.idCardPic2 = ? WHERE TutorID = ?";

        PreparedStatement updatePic1 = null;
        PreparedStatement updatePic2 = null;
        if (idCardSide == 1) {
            try {
                updatePic1 = con.prepareStatement(updateIdPic1);
                updatePic1.setString(1, pic);
                updatePic1.setInt(2, usr);
                updatePic1.executeUpdate();
            } catch (SQLException ex) {
                Logger.getLogger(TutorDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        if (idCardSide == 2) {
            try {
                updatePic2 = con.prepareStatement(updateIdPic2);
                updatePic2.setString(1, pic);
                updatePic2.setInt(2, usr);
                updatePic2.executeUpdate();
            } catch (SQLException ex) {
                Logger.getLogger(TutorDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public Tutor updateTutor(int usr, String major, String school, int gy, int el, boolean gender, String introduction, String dob) {
        String updateSql = "UPDATE Tutor\n"
                + "SET Tutor.Major = ?,\n"
                + "    Tutor.School = ?,\n"
                + "    Tutor.GraduationYear = ?,\n"
                + "    Tutor.EducationLevel = ?,\n"
                + "    Tutor.Gender = ?,\n"
                + "    Tutor.DateOfBirth = ?,\n"
                + "    Tutor.Introduction = ?,\n"
                + "    Tutor.IsRejected = 0\n"
                + " WHERE TutorID = ?";

        PreparedStatement updatePS = null;

        try {
            updatePS = con.prepareStatement(updateSql);
            updatePS.setString(1, major);
            updatePS.setString(2, school);
            updatePS.setInt(3, gy);
            updatePS.setInt(4, el);
            updatePS.setBoolean(5, gender);
            updatePS.setDate(6, convertDate(dob));
            updatePS.setString(7, introduction);
            updatePS.setInt(8, usr);
            int rowsUpdated = updatePS.executeUpdate(); // Thực hiện truy vấn UPDATE
            if (rowsUpdated > 0) {
                // Trả về một đối tượng Tutor mới với thông tin đã cập nhật
                return getTutor(usr); // Lấy thông tin tutor đã được cập nhật từ cơ sở dữ liệu và trả về
            }
        } catch (SQLException e) {
            System.out.println("Error updating tutor: " + e.getMessage());
        } catch (ParseException ex) {
            Logger.getLogger(TutorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void createTutor(int id) {
        PreparedStatement createTutorPs = null;
        String createQuery = "INSERT INTO Tutor(TutorID, isActive, isValidated) VALUES (?,?,?)";

        try {
            createTutorPs = con.prepareStatement(createQuery);
            createTutorPs.setInt(1, id);
            createTutorPs.setInt(2, 0);
            createTutorPs.setInt(3, 0);
            createTutorPs.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(TutorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void updateActive(int id, boolean isActive) throws SQLException{
        Connection conn = null;
        String updateQuery = "UPDATE Tutor SET IsActive = ? WHERE TutorID = ?";
        PreparedStatement updateActive = null;
        try {
            conn = new DBContext().getConnection();
            updateActive = conn.prepareStatement(updateQuery);
            updateActive.setBoolean(1, isActive);
            updateActive.setInt(2, id);
            updateActive.execute();
        } catch (Exception ex) {
            Logger.getLogger(TutorDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (conn != null){
                conn.close();
            }
            if (updateActive != null) {
                updateActive.close();
            }
            
        }

    }

//Uyen
//-----------------------
    public Tutor getTutor(String Id) {
        try {
            String tutorQuery = "SELECT t.TutorID, a.FullName, t.School, t.Major, t.GraduationYear, t.Introduction, t.EducationLevel, a.ProfilePic, t.Gender, t.IsActive "
                    + "FROM Tutor t "
                    + "INNER JOIN Account a ON t.TutorID = a.AccountID where t.TutorID = " + Id;

            String locationQuery = "SELECT tl.TutorID, l.LocationName, l.LocationID "
                    + "FROM Tutor_Location tl "
                    + "INNER JOIN Location l ON tl.LocationID = l.LocationID where tl.TutorID = ?";

            String subjectQuery = "SELECT ts.TutorID, s.SubjectName "
                    + "FROM Tutor_Subject ts "
                    + "INNER JOIN Subject s ON ts.SubjectID = s.SubjectID where ts.TutorID = ? ";

            String achievementQuery = "SELECT ta.TutorID, a.AchievementDetail "
                    + "FROM Tutor_Achievement ta "
                    + "INNER JOIN AcademicAchievement a ON ta.AchievementID = a.AchievementID where ta.TutorID = ? ";

            PreparedStatement tutorStm = con.prepareStatement(tutorQuery);
            ResultSet tutorRs = tutorStm.executeQuery();

            PreparedStatement locationStm = con.prepareStatement(locationQuery);
            ResultSet locationRs;

            PreparedStatement subjectStm = con.prepareStatement(subjectQuery);
            ResultSet subjectRs;

            PreparedStatement achievementStm = con.prepareStatement(achievementQuery);
            ResultSet achievementRs;

            while (tutorRs.next()) {
                Tutor tutor;
                tutor = new Tutor(
                        tutorRs.getInt(1),
                        tutorRs.getString(2),
                        tutorRs.getString(3),
                        tutorRs.getString(4),
                        tutorRs.getInt(5),
                        tutorRs.getString(6),
                        tutorRs.getInt(7),
                        tutorRs.getString(8),
                        tutorRs.getBoolean(9)
                );
                locationStm.setInt(1, tutorRs.getInt("TutorID"));
                locationRs = locationStm.executeQuery();
                ArrayList<String> locations = new ArrayList<>();
                while (locationRs.next()) {
                    locations.add(locationRs.getString("LocationName"));
                }
                tutor.setLocations(locations);

                subjectStm.setInt(1, tutorRs.getInt("TutorID"));
                subjectRs = subjectStm.executeQuery();
                ArrayList<String> subjects = new ArrayList<>();
                while (subjectRs.next()) {
                    subjects.add(subjectRs.getString("SubjectName"));
                }

                tutor.setSubjects(subjects);
                achievementStm.setInt(1, tutorRs.getInt("TutorID"));
                achievementRs = achievementStm.executeQuery();
                ArrayList<String> achievements = new ArrayList<>();
                while (achievementRs.next()) {
                    achievements.add(achievementRs.getString("AchievementDetail"));
                }
                tutor.setAchievements(achievements);
                return tutor;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public ArrayList<Tutor> getAllTutor(String searchSubject, String gender, String location) {
        ArrayList<Tutor> tutorList = new ArrayList<>();
        try {
            String tutorQuery = "SELECT t.TutorID, a.FullName, t.School, t.Major, t.GraduationYear, t.[Introduction], t.EducationLevel, a.ProfilePic, t.Gender, t.IsActive "
                    + "FROM Tutor t "
                    + "INNER JOIN Account a ON t.TutorID = a.AccountID Where t.isActive = 1 AND t.isValidated = 1";

            String locationQuery = "SELECT tl.TutorID, l.LocationName, l.LocationID "
                    + "FROM Tutor_Location tl "
                    + "INNER JOIN Location l ON tl.LocationID = l.LocationID where tl.TutorID = ?";

            String subjectQuery = "SELECT ts.TutorID, s.SubjectName "
                    + "FROM Tutor_Subject ts "
                    + "INNER JOIN Subject s ON ts.SubjectID = s.SubjectID where ts.TutorID = ? ";

            String achievementQuery = "SELECT ta.TutorID, a.AchievementDetail "
                    + "FROM Tutor_Achievement ta "
                    + "INNER JOIN AcademicAchievement a ON ta.AchievementID = a.AchievementID where ta.TutorID = ? ";

            PreparedStatement tutorStm = con.prepareStatement(tutorQuery);
            ResultSet tutorRs = tutorStm.executeQuery();

            PreparedStatement locationStm = con.prepareStatement(locationQuery);
            ResultSet locationRs;

            PreparedStatement subjectStm = con.prepareStatement(subjectQuery);
            ResultSet subjectRs;

            PreparedStatement achievementStm = con.prepareStatement(achievementQuery);
            ResultSet achievementRs;

            while (tutorRs.next()) {
                Tutor tutor;
                tutor = new Tutor(
                        tutorRs.getInt(1),
                        tutorRs.getString(2),
                        tutorRs.getString(3),
                        tutorRs.getString(4),
                        tutorRs.getInt(5),
                        tutorRs.getString(6),
                        tutorRs.getInt(7),
                        tutorRs.getString(8),
                        tutorRs.getBoolean(9)
                );
                String tutorGender = tutor.isGender() ? "1" : "0";
                if (!tutorGender.contains(gender)) {
                    continue;
                }

                locationStm.setInt(1, tutorRs.getInt("TutorID"));
                locationRs = locationStm.executeQuery();
                ArrayList<String> locations = new ArrayList<>();
                int checkLocation = 0;
                while (locationRs.next()) {
                    locations.add(locationRs.getString("LocationName"));
                    if (locationRs.getString("LocationName").contains(location)) {
                        checkLocation++;
                    }
                }
                if (checkLocation == 0) {
                    continue;
                }
                tutor.setLocations(locations);

                subjectStm.setInt(1, tutorRs.getInt("TutorID"));
                subjectRs = subjectStm.executeQuery();
                int checkSubject = 0;
                ArrayList<String> subjects = new ArrayList<>();
                while (subjectRs.next()) {
                    subjects.add(subjectRs.getString("SubjectName"));
                    if (subjectRs.getString("SubjectName").toLowerCase().contains(searchSubject.toLowerCase())) {
                        checkSubject++;
                    }
                }
                if (checkSubject == 0) {
                    continue;
                }
                tutor.setSubjects(subjects);
                achievementStm.setInt(1, tutorRs.getInt("TutorID"));
                achievementRs = achievementStm.executeQuery();
                ArrayList<String> achievements = new ArrayList<>();
                while (achievementRs.next()) {
                    achievements.add(achievementRs.getString("AchievementDetail"));
                }
                tutor.setAchievements(achievements);
                tutorList.add(tutor);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tutorList;
    }

    public List<Location> getAllLocationforTutor() {
        List<Location> list = new ArrayList<>();
        String query = "SELECT * FROM Location";
        try {
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Location(rs.getInt(1), rs.getString(2)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
//=========================================

    private java.sql.Date convertDate(String date) throws ParseException {
        System.out.println(date);
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date parsed = format.parse(date);
        return new java.sql.Date(parsed.getTime());
    }

    public Tutor changeToTutor(String usr) {
        String sql = "UPDATE Tutor\n"
                + "SET IsValidated = 1\n"
                + "FROM Tutor\n"
                + "INNER JOIN Account ON Tutor.TutorID = Account.AccountID\n"
                + "WHERE Account.UserName = ? ";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, usr);
            int rowsUpdated = ps.executeUpdate();
            if (rowsUpdated > 0) {
                return getTutorByUserName(usr);
            }
        } catch (SQLException e) {
            System.out.println("Error updating tutor: " + e.getMessage());
        }
        return null;
    }
    
     public Tutor changeToPending(String usr) {
        String sql = "UPDATE Tutor\n"
                + "SET IsValidated = 0\n"
                + "FROM Tutor\n"
                + "INNER JOIN Account ON Tutor.TutorID = Account.AccountID\n"
                + "WHERE Account.UserName = ? ";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, usr);
            int rowsUpdated = ps.executeUpdate();
            if (rowsUpdated > 0) {
                return getTutorByUserName(usr);
            }
        }
        catch (SQLException e) {
            System.out.println("Error updating tutor: " + e.getMessage());
        }
        return null;
    }
     
     public Tutor changeToStatus(boolean active,String tutorid) {
         String sql = "UPDATE Tutor SET IsActive = ? WHERE TutorID = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setBoolean(1, active);
            ps.setString(2, tutorid);
            int rowsUpdated = ps.executeUpdate();
            if (rowsUpdated > 0) {
                return getTutorByUserName(tutorid);
            }
        }
        catch (SQLException e) {
            System.out.println("Error updating tutor: " + e.getMessage());
        }
        return null;
    }

    public List<TutorProfile> findValidated(String validated) {
        List<TutorProfile> listT = new ArrayList<>();
        String sql = "SELECT t.tutorId, t.dateofbirth, t.gender, t.school, t.major, "
                + "t.graduationyear, t.educationlevel, t.introduction, t.idcardpic1, t.idcardpic2, t.isactive, t.isvalidated, a.username, "
                + "a.datecreated, a.lastlogin, a.isblocked, a.fullname, a.phone, a.email, a.profilepic, a.role "
                + "FROM tutor t JOIN Account a ON t.TutorID = a.AccountID "
                + "WHERE t.isvalidated = ? AND a.IsBlocked = 0";
        System.out.println("SQL Query: " + sql);
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, validated);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                TutorProfile tutor = new TutorProfile();
                tutor.setTutorID(rs.getInt("TutorID"));
                tutor.setDob(rs.getDate("DateOfBirth"));
                tutor.setGender(rs.getBoolean("Gender"));
                tutor.setSchool(rs.getString("School"));
                tutor.setMajor(rs.getString("Major"));
                tutor.setGraduationYear(rs.getInt("GraduationYear"));
                tutor.setEducationLevel(rs.getInt("EducationLevel"));
                tutor.setIntroduction(rs.getString("Introduction"));
                tutor.setIdCard1(rs.getString("IdCardPic1"));
                tutor.setIdCard2(rs.getString("IdCardPic2"));
                tutor.setActive(rs.getBoolean("IsActive"));
                tutor.setValidate(rs.getInt("IsValidated"));
                tutor.setUserName(rs.getString("UserName"));
                tutor.setDateCreated(rs.getDate("DateCreated"));
                tutor.setLastLogin(rs.getDate("LastLogin"));
                tutor.setIsBlocked(rs.getBoolean("IsBlocked"));
                tutor.setFullName(rs.getString("FullName"));
                tutor.setPhone(rs.getString("Phone"));
                tutor.setEmail(rs.getString("Email"));
                tutor.setProfilePic(rs.getString("ProfilePic"));
                tutor.setRole(rs.getInt("Role"));
                listT.add(tutor);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listT;
    }

    public List<TutorProfile> getListByTuTor(List<TutorProfile> list, int start, int end) {
        ArrayList<TutorProfile> tutor = new ArrayList<>();
        for (int i = start; i < end; i++) {
            tutor.add(list.get(i));
        }
        return tutor;
    }

    public TutorProfile getTutorProfileByUserName(int id) {
        String sql = "SELECT t.tutorId, t.dateofbirth, t.gender, t.school, t.major, "
                + "t.graduationyear, t.educationlevel, t.introduction, t.idcardpic1, t.idcardpic2, t.isactive, t.isvalidated, a.username, "
                + "a.datecreated, a.lastlogin, a.isblocked, a.fullname, a.phone, a.email, a.profilepic, a.role "
                + "FROM tutor t "
                + "JOIN Account a ON t.TutorID = a.AccountID "
                + "WHERE a.AccountID=? AND a.Role=2 ";
//AND a.IsBlocked=0
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                return new TutorProfile(
                        rs.getInt("TutorID"),
                        rs.getDate("DateOfBirth"),
                        rs.getBoolean("Gender"),
                        rs.getString("School"),
                        rs.getString("Major"),
                        rs.getInt("GraduationYear"),
                        rs.getInt("EducationLevel"),
                        rs.getString("Introduction"),
                        rs.getString("IdCardPic1"),
                        rs.getString("IdCardPic2"),
                        rs.getBoolean("IsActive"),
                        rs.getInt("IsValidated"),
                        rs.getString("UserName"),
                        rs.getDate("DateCreated"),
                        rs.getDate("LastLogin"),
                        rs.getBoolean("IsBlocked"),
                        rs.getString("FullName"),
                        rs.getString("Phone"),
                        rs.getString("Email"),
                        rs.getString("ProfilePic"),
                        rs.getInt("Role")
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }


    public TutorProfile getTutorProfileByTutorID(int id) {
        String sql = "  SELECT a.FullName\n"
                + "                FROM tutor t\n"
                + "                JOIN Account a ON t.TutorID = a.AccountID \n"
                + "                WHERE t.TutorID=? AND a.Role=2 AND a.IsBlocked=0";

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                return new TutorProfile(
                        rs.getString("FullName")
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }


    public List<TutorProfile> getTutorsByUserNameOrEmailOrFullName(String txtSearch, String validate) {
        List<TutorProfile> listT = new ArrayList<>();
        String sql = "SELECT t.tutorId, t.dateofbirth, t.gender, t.school, t.major, "
                + "t.graduationyear, t.educationlevel, t.introduction, t.idcardpic1, t.idcardpic2, t.isactive, t.isvalidated, a.username, "
                + "a.datecreated, a.lastlogin, a.isblocked, a.fullname, a.phone, a.email, a.profilepic, a.role "
                + "FROM tutor t "
                + "JOIN Account a ON t.TutorID = a.AccountID "
                + "Where (UserName like ? or Email like ? or FullName like ?) and IsValidated=? and Role=2 and [IsBlocked] = 0;";
        System.out.println("SQL Query: " + sql);
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, "%" + txtSearch + "%");
            st.setString(2, "%" + txtSearch + "%");
             st.setString(3, "%" + txtSearch + "%");
            st.setString(4, validate);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                TutorProfile tutor = new TutorProfile();
                tutor.setTutorID(rs.getInt("TutorID"));
                tutor.setDob(rs.getDate("DateOfBirth"));
                tutor.setGender(rs.getBoolean("Gender"));
                tutor.setSchool(rs.getString("School"));
                tutor.setMajor(rs.getString("Major"));
                tutor.setGraduationYear(rs.getInt("GraduationYear"));
                tutor.setEducationLevel(rs.getInt("EducationLevel"));
                tutor.setIntroduction(rs.getString("Introduction"));
                tutor.setIdCard1(rs.getString("IdCardPic1"));
                tutor.setIdCard2(rs.getString("IdCardPic2"));
                tutor.setActive(rs.getBoolean("IsActive"));
                tutor.setValidate(rs.getInt("IsValidated"));
                tutor.setUserName(rs.getString("UserName"));
                tutor.setDateCreated(rs.getDate("DateCreated"));
                tutor.setLastLogin(rs.getDate("LastLogin"));
                tutor.setIsBlocked(rs.getBoolean("IsBlocked"));
                tutor.setFullName(rs.getString("FullName"));
                tutor.setPhone(rs.getString("Phone"));
                tutor.setEmail(rs.getString("Email"));
                tutor.setProfilePic(rs.getString("ProfilePic"));
                tutor.setRole(rs.getInt("Role"));
                listT.add(tutor);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listT;

    }

    public static void main(String[] args) {
        TutorDAO aO = new TutorDAO();
//        System.out.println(aO.getTutorProfileByTutorID(4).getFullName());
    }
}
