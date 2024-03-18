/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.sql.Date;

/**
 *
 * @author mim
 */
public class Request {
    private int requestID;
    private int classID;
    private int tutorID;
    private int requestType;
    private Date dateCreate;
    private int requestStatus;
    private Date trialEndDate;
    private Date acceptDate;
    private String conTractLink;

    public Request() {
    }
    
    public Request(int requestID, int classID, int tutorID, int requestType, Date dateCreate, int requestStatus, Date trialEndDate, Date acceptDate, String conTractLink) {
        this.requestID = requestID;
        this.classID = classID;
        this.tutorID = tutorID;
        this.requestType = requestType;
        this.dateCreate = dateCreate;
        this.requestStatus = requestStatus;
        this.trialEndDate = trialEndDate;
        this.acceptDate = acceptDate;
        this.conTractLink = conTractLink;
    }

    public int getRequestID() {
        return requestID;
    }

    public void setRequestID(int requestID) {
        this.requestID = requestID;
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

    public int getRequestType() {
        return requestType;
    }

    public void setRequestType(int requestType) {
        this.requestType = requestType;
    }

    public Date getDateCreate() {
        return dateCreate;
    }

    public void setDateCreate(Date dateCreate) {
        this.dateCreate = dateCreate;
    }

    public int getRequestStatus() {
        return requestStatus;
    }

    public void setRequestStatus(int requestStatus) {
        this.requestStatus = requestStatus;
    }

    public Date getTrialEndDate() {
        return trialEndDate;
    }

    public void setTrialEndDate(Date trialEndDate) {
        this.trialEndDate = trialEndDate;
    }

    public Date getAcceptDate() {
        return acceptDate;
    }

    public void setAcceptDate(Date acceptDate) {
        this.acceptDate = acceptDate;
    }

    public String getConTractLink() {
        return conTractLink;
    }

    public void setConTractLink(String conTractLink) {
        this.conTractLink = conTractLink;
    }
    
    
}
