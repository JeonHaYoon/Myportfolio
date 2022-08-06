//유저클래스

package com.myportfolio.web;

public class User {
    private String id;
    private String pswd;
    private String dogname;
    private String email;
    private String region;
    private String gender;

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

    public User(String id, String pswd, String dogname, String email, String region, String gender) {
        this.id = id;
        this.pswd = pswd;
        this.dogname = dogname;
        this.email = email;
        this.region = region;
        this.gender = gender;
    }
}
