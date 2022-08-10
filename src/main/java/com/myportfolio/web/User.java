//유저클래스

package com.myportfolio.web;

import java.util.Date;
import java.util.Objects;

public class User {
    public static User user;
    private String id;
    private String pswd;
    private String dogname;
    private String email;
    private String region;
    private String gender;
    private Date reg_date;



    public void setReg_date(Date reg_date) {
        this.reg_date = reg_date;
    }



    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPswd() {
        return pswd;
    }

    public void setPswd(String pswd) {
        this.pswd = pswd;
    }

    public String getDogname() {
        return dogname;
    }

    public void setDogname(String dogname) {
        this.dogname = dogname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Date getReg_date() {
        return reg_date;
    }
    public User(){}
    public User(String id, String pswd, String dogname, String email, String region, String gender, Date reg_date) {
        this.id = id;
        this.pswd = pswd;
        this.dogname = dogname;
        this.email = email;
        this.region = region;
        this.gender = gender;
        this.reg_date=reg_date;
    }

    @Override
    public String toString() {
        return "User{" +
                "id='" + id + '\'' +
                ", pswd='" + pswd + '\'' +
                ", dogname='" + dogname + '\'' +
                ", email='" + email + '\'' +
                ", region='" + region + '\'' +
                ", gender='" + gender + '\'' +
                ", reg_date=" + reg_date +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        User user = (User) o;
        return id.equals(user.id) && Objects.equals(pswd, user.pswd) && Objects.equals(dogname, user.dogname) && Objects.equals(email, user.email) && Objects.equals(region, user.region) && Objects.equals(gender, user.gender);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, pswd, dogname, email, region, gender);
    }
}
