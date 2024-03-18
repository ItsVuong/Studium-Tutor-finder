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
public class Invoice {
    private String invoiceID;
    private int requestID;
    private Date createDate;
    private int invoiceType;
    private String imgInvoice;
    private boolean hasPaid;

    public Invoice() {
    }

    public Invoice(String invoiceID, int requestID, Date createDate, int invoiceType, String imgInvoice, boolean hasPaid) {
        this.invoiceID = invoiceID;
        this.requestID = requestID;
        this.createDate = createDate;
        this.invoiceType = invoiceType;
        this.imgInvoice = imgInvoice;
        this.hasPaid = hasPaid;
    }

    public boolean isHasPaid() {
        return hasPaid;
    }

    public void setHasPaid(boolean hasPaid) {
        this.hasPaid = hasPaid;
    }
    
    

    public String getInvoiceID() {
        return invoiceID;
    }

    public void setInvoiceID(String invoiceID) {
        this.invoiceID = invoiceID;
    }

    public int getRequestID() {
        return requestID;
    }

    public void setRequestID(int requestID) {
        this.requestID = requestID;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public int getInvoiceType() {
        return invoiceType;
    }

    public void setInvoiceType(int invoiceType) {
        this.invoiceType = invoiceType;
    }

    public String getImgInvoice() {
        return imgInvoice;
    }

    public void setImgInvoice(String imgInvoice) {
        this.imgInvoice = imgInvoice;
    }
    
}
