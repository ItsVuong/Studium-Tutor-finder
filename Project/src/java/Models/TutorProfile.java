/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.util.Date;



/**
 *
 * @author Acer
 */
public class TutorProfile {

    private int tutorID;
    private Date dob;
    private boolean gender;
    private String school;
    private String major;
    private int graduationYear;
    private int educationLevel;
    private String introduction;
    private String idCard1;
    private String idCard2;
    private boolean active;
    private int validate;
    private boolean isRejected;

    private String userName;
    private Date dateCreated;
    private Date lastLogin;
    private Boolean isBlocked;
    private String fullName;
    private String phone;
    private String email;
    private String profilePic;
    private int role;

    public TutorProfile() {
    }

    public TutorProfile(int tutorID, Date dob, boolean gender, String school, String major, int graduationYear, int educationLevel, String introduction, String idCard1, String idCard2, boolean active, int validate, String userName, Date dateCreated, Date lastLogin, Boolean isBlocked, String fullName, String phone, String email, String profilePic, int role) {
        this.tutorID = tutorID;
        this.dob = dob;
        this.gender = gender;
        this.school = school;
        this.major = major;
        this.graduationYear = graduationYear;
        this.educationLevel = educationLevel;
        this.introduction = introduction;
        this.idCard1 = idCard1;
        this.idCard2 = idCard2;
        this.active = active;
        this.validate = validate;
        this.userName = userName;
        this.dateCreated = dateCreated;
        this.lastLogin = lastLogin;
        this.isBlocked = isBlocked;
        this.fullName = fullName;
        this.phone = phone;
        this.email = email;
        this.profilePic = profilePic;
        this.role = role;
    }
    
    

    public int getTutorID() {
        return tutorID;
    }

    public void setTutorID(int tutorID) {
        this.tutorID = tutorID;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public int getGraduationYear() {
        return graduationYear;
    }

    public void setGraduationYear(int graduationYear) {
        this.graduationYear = graduationYear;
    }

    public int getEducationLevel() {
        return educationLevel;
    }

    public void setEducationLevel(int educationLevel) {
        this.educationLevel = educationLevel;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public String getIdCard1() {
        return idCard1;
    }

    public void setIdCard1(String idCard1) {
        this.idCard1 = idCard1;
    }

    public String getIdCard2() {
        return idCard2;
    }

    public void setIdCard2(String idCard2) {
        this.idCard2 = idCard2;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public int getValidate() {
        return validate;
    }

    public void setValidate(int validate) {
        this.validate = validate;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public Date getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }

    public Date getLastLogin() {
        return lastLogin;
    }

    public void setLastLogin(Date lastLogin) {
        this.lastLogin = lastLogin;
    }

    public Boolean getIsBlocked() {
        return isBlocked;
    }

    public void setIsBlocked(Boolean isBlocked) {
        this.isBlocked = isBlocked;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getProfilePic() {
        return profilePic;
    }

    public void setProfilePic(String profilePic) {
        this.profilePic = profilePic;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public boolean isIsRejected() {
        return isRejected;
    }

    public void setIsRejected(boolean isRejected) {
        this.isRejected = isRejected;
    }   

    @Override
    public String toString() {
        return "TutorProfile{" + "tutorID=" + tutorID + ", dob=" + dob + ", gender=" + gender + ", school=" + school + ", major=" + major + ", graduationYear=" + graduationYear + ", educationLevel=" + educationLevel + ", introduction=" + introduction + ", idCard1=" + idCard1 + ", idCard2=" + idCard2 + ", active=" + active + ", validate=" + validate + ", userName=" + userName + ", dateCreated=" + dateCreated + ", lastLogin=" + lastLogin + ", isBlocked=" + isBlocked + ", fullName=" + fullName + ", phone=" + phone + ", email=" + email + ", profilePic=" + profilePic + ", role=" + role + '}';
    }

    public TutorProfile(String fullName) {
        this.fullName = fullName;
    }

    
}
