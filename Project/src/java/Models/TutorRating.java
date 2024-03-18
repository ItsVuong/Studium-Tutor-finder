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
public class TutorRating {
    int parentID;
    int tutorID;
    Date timeCreated;
    String detail;
    int status;
    int rating;

    public TutorRating() {
    }

    public TutorRating(int parentID, int tutorID, Date timeCreated, String detail, int status, int rating) {
        this.parentID = parentID;
        this.tutorID = tutorID;
        this.timeCreated = timeCreated;
        this.detail = detail;
        this.status = status;
        this.rating = rating;
    }

    public int getParentID() {
        return parentID;
    }

    public void setParentID(int parentID) {
        this.parentID = parentID;
    }

    public int getTutorID() {
        return tutorID;
    }

    public void setTutorID(int tutorID) {
        this.tutorID = tutorID;
    }

    public Date getTimeCreated() {
        return timeCreated;
    }

    public void setTimeCreated(Date timeCreated) {
        this.timeCreated = timeCreated;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    @Override
    public String toString() {
        return "TutorRating{" + "parentID=" + parentID + ", tutorID=" + tutorID + ", timeCreated=" + timeCreated + ", detail=" + detail + ", status=" + status + ", rating=" + rating + '}';
    }  
}
