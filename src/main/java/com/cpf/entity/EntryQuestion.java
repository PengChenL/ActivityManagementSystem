package com.cpf.entity;

public class EntryQuestion {
    private int eqkey;
    private String acty;
    private String actid;
    private int qusnum;
    private int qusid;
    private String qusname;

    public int getEqkey() {
        return eqkey;
    }

    public void setEqkey(int eqkey) {
        this.eqkey = eqkey;
    }

    public String getActy() {
        return acty;
    }

    public void setActy(String acty) {
        this.acty = acty;
    }

    public String getActid() {
        return actid;
    }

    public void setActid(String actid) {
        this.actid = actid;
    }

    public int getQusnum() {
        return qusnum;
    }

    public void setQusnum(int qusnum) {
        this.qusnum = qusnum;
    }

    public int getQusid() {
        return qusid;
    }

    public void setQusid(int qusid) {
        this.qusid = qusid;
    }

    public String getQusname() {
        return qusname;
    }

    public void setQusname(String qusname) {
        this.qusname = qusname;
    }

    @Override
    public String toString() {
        return "EntryQuestion{" +
                "eqkey=" + eqkey +
                ", acty='" + acty + '\'' +
                ", actid='" + actid + '\'' +
                ", qusnum=" + qusnum +
                ", qusid=" + qusid +
                ", qusname='" + qusname + '\'' +
                '}';
    }
}
