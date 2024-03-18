/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.sql.Date;

public class Class {

    private int classID;
    private int tutorID;
    private int parentID;
    private int adminInCharge;
    private int tutorGender;
    private int payPerSession;
    private int sesPerWeek;
    private int timeS;
    private Date openDate;
    private String classDescription;
    private String publicAddress;
    private String actualAddress;
    private int subjectID;
    private int tutorEdlevel;
    private int studentNum;
    private Date checkDate;
    private boolean isApproved;
    private int classStatus;
    private String subject;
    private String map;
    private String subject_Name;

    private String tutorName;

    public Class() {
    }

    public Class(int classID, int tutorID, int parentID, int adminInCharge, int tutorGender, int payPerSession, int sesPerWeek, int timeS, Date openDate, String classDescription, String publicAddress, String actualAddress, int subjectID, int tutorEdlevel, int studentNum, Date checkDate, boolean isApproved, int classStatus, String subject, String map) {
        this.classID = classID;
        this.tutorID = tutorID;
        this.parentID = parentID;
        this.adminInCharge = adminInCharge;
        this.tutorGender = tutorGender;
        this.payPerSession = payPerSession;
        this.sesPerWeek = sesPerWeek;
        this.timeS = timeS;
        this.openDate = openDate;
        this.classDescription = classDescription;
        this.publicAddress = publicAddress;
        this.actualAddress = actualAddress;
        this.subjectID = subjectID;
        this.tutorEdlevel = tutorEdlevel;
        this.studentNum = studentNum;
        this.checkDate = checkDate;
        this.isApproved = isApproved;
        this.classStatus = classStatus;
        this.subject = subject;
        this.map = map;
    }

        public Class(int classID2, int tutorID, int parentID, int adminInCharge, int tutorGender, int payPerSession, int sesPerWeek, int timeS, Date openDate, String classDescription, String publicAddress, String actualAddress, int subjectID, String subject, int tutorEdlevel, int studentNum, Date checkDate, boolean isApproved, int classStatus, String map) {
        this.classID = classID2;
        this.tutorID = tutorID;
        this.parentID = parentID;
        this.adminInCharge = adminInCharge;
        this.tutorGender = tutorGender;
        this.payPerSession = payPerSession;
        this.sesPerWeek = sesPerWeek;
        this.timeS = timeS;
        this.openDate = openDate;
        this.classDescription = classDescription;
        this.publicAddress = publicAddress;
        this.actualAddress = actualAddress;
        this.subjectID = subjectID;
        this.subject = subject;
        this.tutorEdlevel = tutorEdlevel;
        this.studentNum = studentNum;
        this.checkDate = checkDate;
        this.isApproved = isApproved;
        this.classStatus = classStatus;

        this.map = map;
    }


    public String getMap() {
        return map;
    }

    public void setMap(String Map) {
        this.map = Map;
    }

    public int getClassID() {
        return classID;
    }

    public void setClassID(int classID) {
        this.classID = classID;
    }

    public int getTutorID() {
        return tutorID;
    }

    public void setTutorID(int tutorID) {
        this.tutorID = tutorID;
    }

    public int getParentID() {
        return parentID;
    }

    public void setParentID(int parentID) {
        this.parentID = parentID;
    }

    public int getAdminInCharge() {
        return adminInCharge;
    }

    public void setAdminInCharge(int adminInCharge) {
        this.adminInCharge = adminInCharge;
    }

    public int getTutorGender() {
        return tutorGender;
    }

    public void setTutorGender(int tutorGender) {
        this.tutorGender = tutorGender;
    }

    public int getPayPerSession() {
        return payPerSession;
    }

    public void setPayPerSession(int payPerSession) {
        this.payPerSession = payPerSession;
    }

    public int getSesPerWeek() {
        return sesPerWeek;
    }

    public void setSesPerWeek(int sesPerWeek) {
        this.sesPerWeek = sesPerWeek;
    }

    public int getTimeS() {
        return timeS;
    }

    public void setTimeS(int timeS) {
        this.timeS = timeS;
    }

    public Date getOpenDate() {
        return openDate;
    }

    public void setOpenDate(Date openDate) {
        this.openDate = openDate;
    }

    public String getClassDescription() {
        return classDescription;
    }

    public void setClassDescription(String classDescription) {
        this.classDescription = classDescription;
    }

    public String getPublicAddress() {
        return publicAddress;
    }

    public void setPublicAddress(String publicAddress) {
        this.publicAddress = publicAddress;
    }

    public String getActualAddress() {
        return actualAddress;
    }

    public void setActualAddress(String actualAddress) {
        this.actualAddress = actualAddress;
    }

    public int getSubjectID() {
        return subjectID;
    }

    public void setSubjectID(int subjectID) {
        this.subjectID = subjectID;
    }

    public int getTutorEdlevel() {
        return tutorEdlevel;
    }

    public void setTutorEdlevel(int tutorEdlevel) {
        this.tutorEdlevel = tutorEdlevel;
    }

    public int getStudentNum() {
        return studentNum;
    }

    public void setStudentNum(int studentNum) {
        this.studentNum = studentNum;
    }

    public Date getCheckDate() {
        return checkDate;
    }

    public void setCheckDate(Date checkDate) {
        this.checkDate = checkDate;
    }

    public boolean isIsApproved() {
        return isApproved;
    }

    public void setIsApproved(boolean isApproved) {
        this.isApproved = isApproved;
    }

    public int getClassStatus() {
        return classStatus;
    }

    public void setClassStatus(int classStatus) {
        this.classStatus = classStatus;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    @Override
    public String toString() {
        return "Class{" + "classID=" + classID + ", tutorID=" + tutorID + ", parentID=" + parentID + ", adminInCharge=" + adminInCharge + ", tutorGender=" + tutorGender + ", payPerSession=" + payPerSession + ", sesPerWeek=" + sesPerWeek + ", timeS=" + timeS + ", openDate=" + openDate + ", classDescription=" + classDescription + ", publicAddress=" + publicAddress + ", actualAddress=" + actualAddress + ", subjectID=" + subjectID + ", tutorEdlevel=" + tutorEdlevel + ", studentNum=" + studentNum + ", checkDate=" + checkDate + ", isApproved=" + isApproved + ", classStatus=" + classStatus + ", subject=" + subject + '}';
    }

    public String getTutorName() {
        return tutorName;
    }

    public void setTutorName(String tutorName) {
        this.tutorName = tutorName;
    }

    public Class(int classID, int tutorID, int parentID, int adminInCharge, int tutorGender, int payPerSession, int sesPerWeek, int timeS, Date openDate, String classDescription, String publicAddress, String actualAddress, int subjectID, int tutorEdlevel, int studentNum, Date checkDate, boolean isApproved, int classStatus, String subject, String map, String tutorName) {
        this.classID = classID;
        this.tutorID = tutorID;
        this.parentID = parentID;
        this.adminInCharge = adminInCharge;
        this.tutorGender = tutorGender;
        this.payPerSession = payPerSession;
        this.sesPerWeek = sesPerWeek;
        this.timeS = timeS;
        this.openDate = openDate;
        this.classDescription = classDescription;
        this.publicAddress = publicAddress;
        this.actualAddress = actualAddress;
        this.subjectID = subjectID;
        this.tutorEdlevel = tutorEdlevel;
        this.studentNum = studentNum;
        this.checkDate = checkDate;
        this.isApproved = isApproved;
        this.classStatus = classStatus;
        this.subject = subject;
        this.map = map;
        this.tutorName = tutorName;
    }

}
