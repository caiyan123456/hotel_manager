package com.whhp.k9501.entity;

import java.util.Date;

public class Order {
    private Integer id;

    private Date ordertime;

    private Integer userid;

    private Integer roomid;

    private Integer issucceed;

    private String comment;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getOrdertime() {
        return ordertime;
    }

    public void setOrdertime(Date ordertime) {
        this.ordertime = ordertime;
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

    public Integer getIssucceed() {
        return issucceed;
    }

    public void setIssucceed(Integer issucceed) {
        this.issucceed = issucceed;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment == null ? null : comment.trim();
    }
}