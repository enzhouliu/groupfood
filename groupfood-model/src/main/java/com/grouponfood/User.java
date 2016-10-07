package com.grouponfood;

/**
 * Created by Administrator on 10/5/2016.
 */
public class User {
    private int userId;
    private String username;
    private String password;
    private String phoneNumber;
    private String homeAddress;
    private String homeZipcode;

    public int getUserId() {
        return userId;
    }

    public boolean authenticate(String password){
        return password.equals(this.password);
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getHomeAddress() {
        return homeAddress;
    }

    public void setHomeAddress(String homeAddress) {
        this.homeAddress = homeAddress;
    }

    public String getHomeZipcode() {
        return homeZipcode;
    }

    public void setHomeZipcode(String homeZipcode) {
        this.homeZipcode = homeZipcode;
    }

    public String getOfficeAddress() {
        return officeAddress;
    }

    public void setOfficeAddress(String officeAddress) {
        this.officeAddress = officeAddress;
    }

    public String getOfficeZipcode() {
        return officeZipcode;
    }

    public void setOfficeZipcode(String officeZipcode) {
        this.officeZipcode = officeZipcode;
    }

    private String officeAddress;
    private String officeZipcode;
}
