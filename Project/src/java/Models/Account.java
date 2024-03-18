package Models;

import java.sql.Date;

/**
 *
 * @author Asus
 */
public class Account {

    private int id;
    private String userName;
    private Date dateCreated;
    private Date lastLogin;
    private Boolean isBlocked;
    private String fullName;
    private String phone;
    private String email;
    private String profilePic;
    private int role;

    public Account() {

    }

    public Account(int id, String userName, Date dateCreated, Date lastLogin, Boolean isBlocked, String fullName, String phone, String email, String profilePic, int role) {
        this.id = id;
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

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

}
