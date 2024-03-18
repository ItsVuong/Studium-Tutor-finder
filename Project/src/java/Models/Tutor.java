/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author Acer
 */
public class Tutor {

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
    private Boolean isValidated;
    private Boolean isRejected;
   
    private String name;
    private String profilePic;
    private ArrayList<String> locations;
    private ArrayList<String> subjects;
    private ArrayList<String> achievements;

    public Tutor() {
    }

    public Tutor(int tutorID, Date dob, boolean gender, String school, String major, int graduationYear, int educationLevel, String introduction, String idCard1, String idCard2, boolean active, boolean isValidated) {
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
        this.isValidated = isValidated;
    }

    public Tutor(int tutorID, String name, String school, String major, int graduationYear, String introduction, int educationLevel, String profilePic, boolean gender) {
        this.tutorID = tutorID;
        this.name = name;
        this.school = school;
        this.major = major;
        this.graduationYear = graduationYear;
        this.introduction = introduction;
        this.educationLevel = educationLevel;
        this.profilePic = profilePic;
        this.gender = gender;
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

    public boolean isIsValidated() {
        return isValidated;
    }

    public void setIsValidated(boolean isValidated) {
        this.isValidated = isValidated;
    }

    public boolean isIsRejected() {
        return isRejected;
    }

    public void setIsRejected(boolean isRejected) {
        this.isRejected = isRejected;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getProfilePic() {
        return profilePic;
    }

    public void setProfilePic(String profilePic) {
        this.profilePic = profilePic;
    }

    public ArrayList<String> getLocations() {
        return locations;
    }

    public void setLocations(ArrayList<String> locations) {
        this.locations = locations;
    }

    public ArrayList<String> getSubjects() {
        return subjects;
    }

    public void setSubjects(ArrayList<String> subjects) {
        this.subjects = subjects;
    }

    public ArrayList<String> getAchievements() {
        return achievements;
    }

    public void setAchievements(ArrayList<String> achievements) {
        this.achievements = achievements;
    }

    public Boolean getIsValidated() {
        return isValidated;
    }

    public void setIsValidated(Boolean isValidated) {
        this.isValidated = isValidated;
    }

    public Boolean getIsRejected() {
        return isRejected;
    }

    public void setIsRejected(Boolean isRejected) {
        this.isRejected = isRejected;
    }
    
 
    @Override
    public String toString() {
        return "Tutor{" + "tutorID=" + tutorID + ", dob=" + dob + ", gender=" + gender + ", school=" + school + ", major=" + major + ", graduationYear=" + graduationYear + ", educationLevel=" + educationLevel + ", introduction=" + introduction + ", idCard1=" + idCard1 + ", idCard2=" + idCard2 + ", active=" + active + ", validate=" + isValidated + '}';
    }

}
