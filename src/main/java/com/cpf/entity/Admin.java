package com.cpf.entity;

public class Admin {
    private int    aid;
    private String ausername;
    private String apwd;
    private String aname;
    private String atel;
    private String aorg;

    public int getAid() {
        return aid;
    }

    public void setAid(int aid) {
        this.aid = aid;
    }

    public String getAusername() {
        return ausername;
    }

    public void setAusername(String ausername) {
        this.ausername = ausername;
    }

    public String getApwd() {
        return apwd;
    }

    public void setApwd(String apwd) {
        this.apwd = apwd;
    }

    public String getAname() {
        return aname;
    }

    public void setAname(String aname) {
        this.aname = aname;
    }

    public String getAtel() {
        return atel;
    }

    public void setAtel(String atel) {
        this.atel = atel;
    }

    public String getAorg() {
        return aorg;
    }

    public void setAorg(String aorg) {
        this.aorg = aorg;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "aid=" + aid +
                ", ausername='" + ausername + '\'' +
                ", apwd='" + apwd + '\'' +
                ", aname='" + aname + '\'' +
                ", atel='" + atel + '\'' +
                ", aorg='" + aorg + '\'' +
                '}';
    }
}
