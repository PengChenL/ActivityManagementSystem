package com.cpf.entity;

public class User {
    private int nid;
    private String susername;
    private String spwd;
    private String sname;
    private String sid;
    private String scollege;
    private String smajor;
    private String stel;
    private String smail;


    public int getNid() {
        return nid;
    }

    public void setNid(int nid) {
        this.nid = nid;
    }

    public String getSusername() {
        return susername;
    }

    public void setSusername(String susername) {
        this.susername = susername;
    }

    public String getSpwd() {
        return spwd;
    }

    public void setSpwd(String spwd) {
        this.spwd = spwd;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }

    public String getScollege() {
        return scollege;
    }

    public void setScollege(String scollege) {
        this.scollege = scollege;
    }

    public String getSmajor() {
        return smajor;
    }

    public void setSmajor(String smajor) {
        this.smajor = smajor;
    }

    public String getStel() {
        return stel;
    }

    public void setStel(String stel) {
        this.stel = stel;
    }

    public String getSmail() {
        return smail;
    }

    public void setSmail(String smail) {
        this.smail = smail;
    }

    @Override
    public String toString() {
        return "User{" +
                "nid=" + nid +
                ", susername='" + susername + '\'' +
                ", spwd='" + spwd + '\'' +
                ", sname='" + sname + '\'' +
                ", sid='" + sid + '\'' +
                ", scollege='" + scollege + '\'' +
                ", smajor='" + smajor + '\'' +
                ", stel='" + stel + '\'' +
                ", smail='" + smail + '\'' +
                '}';
    }
}
