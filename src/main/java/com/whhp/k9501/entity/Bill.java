package com.whhp.k9501.entity;

import java.util.Date;

public class Bill {
    private Integer id;

    private Date outdate;

    private Integer roomid;

    private Integer userid;

    private Integer inroominfoid;

    private Long totalmoney;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getOutdate() {
        return outdate;
    }

    public void setOutdate(Date outdate) {
        this.outdate = outdate;
    }

    public Integer getRoomid() {
        return roomid;
    }

    public void setRoomid(Integer roomid) {
        this.roomid = roomid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getInroominfoid() {
        return inroominfoid;
    }

    public void setInroominfoid(Integer inroominfoid) {
        this.inroominfoid = inroominfoid;
    }

    public Long getTotalmoney() {
        return totalmoney;
    }

    public void setTotalmoney(Long totalmoney) {
        this.totalmoney = totalmoney;
    }
}