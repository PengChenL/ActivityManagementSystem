package com.cpf.entity;

public class Activity {
    private int ackey;
    private String actid;
    private String acname;
    private String actime;
    private int participantnum;
    private String acorg;
    private String acinfo;
    private String acstatus;
    private String accontact;

    public int getAckey() {
        return ackey;
    }

    public void setAckey(int ackey) {
        this.ackey = ackey;
    }

    public String getActid() {
        return actid;
    }

    public void setActid(String actid) {
        this.actid = actid;
    }

    public String getAcname() {
        return acname;
    }

    public void setAcname(String acname) {
        this.acname = acname;
    }

    public String getActime() {
        return actime;
    }

    public void setActime(String actime) {
        this.actime = actime;
    }

    public int getParticipantnum() {
        return participantnum;
    }

    public void setParticipantnum(int participantnum) {
        this.participantnum = participantnum;
    }

    public String getAcorg() {
        return acorg;
    }

    public void setAcorg(String acorg) {
        this.acorg = acorg;
    }

    public String getAcinfo() {
        return acinfo;
    }

    public void setAcinfo(String acinfo) {
        this.acinfo = acinfo;
    }

    public String getAcstatus() {
        return acstatus;
    }

    public void setAcstatus(String acstatus) {
        this.acstatus = acstatus;
    }

    public String getAccontact() {
        return accontact;
    }

    public void setAccontact(String accontact) {
        this.accontact = accontact;
    }

    @Override
    public String toString() {
        return "Activity{" +
                "ackey=" + ackey +
                ", actid='" + actid + '\'' +
                ", acname='" + acname + '\'' +
                ", actime='" + actime + '\'' +
                ", participantnum=" + participantnum +
                ", acorg='" + acorg + '\'' +
                ", acinfo='" + acinfo + '\'' +
                ", acstatus='" + acstatus + '\'' +
                ", accontact='" + accontact + '\'' +
                '}';
    }
}
