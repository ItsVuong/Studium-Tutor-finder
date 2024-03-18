/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author admin
 */
public class ClassStatus {
    private int StatusID;
    private int ClassStatus;

    public ClassStatus() {
    }

    public ClassStatus(int StatusID, int ClassStatus) {
        this.StatusID = StatusID;
        this.ClassStatus = ClassStatus;
    }

    public int getStatusID() {
        return StatusID;
    }

    public void setStatusID(int StatusID) {
        this.StatusID = StatusID;
    }

    public int getClassStatus() {
        return ClassStatus;
    }

    public void setClassStatus(int ClassStatus) {
        this.ClassStatus = ClassStatus;
    }

    @Override
    public String toString() {
        return "ClassStatus{" + "StatusID=" + StatusID + ", ClassStatus=" + ClassStatus + '}';
    }
    
}
