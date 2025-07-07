package com.cpf.entity;

public class Answer {
    private int ansid;
    private String actid;
    private int qusid;
    private String qusname;
    private int qusnum;
    private String submitter;
    private String submitterid; // 防止重名的现象，加上提交人的学号
    private String result;
    private String submittime; // 暂时不做转换

    public int getAnsid() {
        return ansid;
    }

    public void setAnsid(int ansid) {
        this.ansid = ansid;
    }

    public String getActid() {
        return actid;
    }

    public void setActid(String actid) {
        this.actid = actid;
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

    public int getQusnum() {
        return qusnum;
    }

    public void setQusnum(int qusnum) {
        this.qusnum = qusnum;
    }

    public String getSubmitter() {
        return submitter;
    }

    public void setSubmitter(String submitter) {
        this.submitter = submitter;
    }

    public String getSubmitterid() {
        return submitterid;
    }

    public void setSubmitterid(String submitterid) {
        this.submitterid = submitterid;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public String getSubmittime() {
        return submittime;
    }

    public void setSubmittime(String submittime) {
        this.submittime = submittime;
    }

    @Override
    public String toString() {
        return "Answer{" +
                "ansid=" + ansid +
                ", actid='" + actid + '\'' +
                ", qusid=" + qusid +
                ", qusname='" + qusname + '\'' +
                ", qusnum=" + qusnum +
                ", submitter='" + submitter + '\'' +
                ", submitterid='" + submitterid + '\'' +
                ", result='" + result + '\'' +
                ", submittime='" + submittime + '\'' +
                '}';
    }
}
