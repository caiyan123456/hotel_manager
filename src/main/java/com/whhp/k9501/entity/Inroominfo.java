package com.whhp.k9501.entity;

import java.util.Date;

public class Inroominfo {
    private Integer id;

    private Integer isorder;

    private Date indate;

    private Integer userid;

    private Integer roomid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getIsorder() {
        return isorder;
    }

    public void setIsorder(Integer isorder) {
        this.isorder = isorder;
    }

    public Date getIndate() {
        return indate;
    }

    public void setIndate(Date indate) {
        this.indate = indate;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getRoomid() {
        return roomid;
    }

    public void setRoomid(Integer roomid) {
        this.roomid = roomid;
    }
}