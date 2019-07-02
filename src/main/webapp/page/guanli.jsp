<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   //判断当前用户有没有登入
    Object o=session.getAttribute("user");
    if(o==null){
        out.print("<script>alert('请先登陆，再进来！');location.href='login.jsp';</script>");
    }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<!-- saved from url=(0050)http://localhost:8080/HouseRent/manage!list.action -->
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD>
<TITLE>武汉租房 - 用户管理</TITLE>
<META content="text/html; charset=utf-8" http-equiv=Content-Type><LINK 
rel=stylesheet type=text/css href="../css/style.css">

<META name=GENERATOR ></HEAD>
<BODY>
<DIV id=header class=wrap>
<DIV id=logo><IMG src="../images/logo.gif"></DIV>
<DIV class=search> 【欢迎:${user.name}】
  <LABEL class="ui-green searchs"><a href="goFaBu" title="">发布房屋信息</a></LABEL>
  <LABEL class="ui-green searchs"><a href="getUserHouseByuid" title="">管理房屋信息</a></LABEL>
  <LABEL class="ui-green searchs"><a href="selectHouseByShow" title="">退       出</a></LABEL>

</DIV></DIV>
<DIV class="main wrap">
<DIV id=houseArea>
<TABLE class=house-list>
  <TBODY>
  <c:forEach items="${pageInfo.list}" var="h" >

  <TR>
    <TD class=house-thumb><SPAN>
      <A href="details.jsp" target="_blank">
        <img src="http://localhost:80/${h.path}" width="100" height="75" alt=""></A></SPAN></TD>
    <TD>
      <DL>
        <DT><A href="details.jsp" target="_blank">${h.title}</A></DT>
        <DD>位置：${h.dname}${h.sname},面积：${h.floorage} 户型：${h.tname}<BR>价格：${h.price} 联系方式：${h.contact} </DD></DL></TD>
    <TD>
      <LABEL class="ui-green searchs"><a href="updatePageHouse?id=${h.id}" >修    改</a></LABEL>
    </TD>
    <TD>
        <LABEL class="ui-green searchs"><a href="deleteHouseByUser?id=${h.id}" >删     除</a></LABEL>
    </TD>
  </TR>
  </c:forEach>
  </TBODY></TABLE></DIV>
<DIV class=pager>
<UL>
  <c:forEach  begin="1" end="${pageInfo.pages}" step="1" var="i">
    <LI class=current>
      <A id=widget_338868862
         href="getUserHouseByuid?page=${i}"
         parseContent="true" showError="true" targets="houseArea"
         ajaxAfterValidation="false" validate="false"
         dojoType="struts:BindAnchor">${i}</A>
    </LI>
  </c:forEach>
</UL><SPAN class=total>${pageInfo.pageNum}/${pageInfo.pages}页 | 共有${pageInfo.total}条记录</SPAN> </DIV></DIV>
<DIV id=footer class=wrap>
<DL>
  <DT>青鸟租房 © 2018 北大青鸟 京ICP证1000001号</DT>
  <DD>关于我们 · 联系方式 · 意见反馈 · 帮助中心</DD></DL></DIV></BODY></HTML>
