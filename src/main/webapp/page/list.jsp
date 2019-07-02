<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<!-- saved from url=(0030)http://localhost:8080/House-2/ -->
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD><TITLE>武汉租房 - 首页</TITLE>
<META content="text/html; charset=utf-8" http-equiv=Content-Type>
<LINK rel=stylesheet type=text/css href="../css/style.css">
<META name=GENERATOR content="MSHTML 8.00.7601.17514"></HEAD>
<BODY>
<DIV id=header class=wrap>
<DIV id=logo><IMG src="../images/logo.gif"></DIV></DIV>
<DIV id=navbar class=wrap>
<DL class="search clearfix">
  <FORM id=sform method=post action="selectHouseByShow">
  <DT>
  <UL>
    <LI class=bold>房屋信息</LI>
    <LI class=bold>房屋标题:</LI>
    <li><INPUT class=text type=text name=title size="8" value="${houseCondition.title}">
    </li>
    </UL></DT>

  <DD>
  <UL><LI class=bold>房屋价格:</LI>
    <li>从: <input type="text" name="priceFrom" size="5" value="${houseCondition.priceFrom}"></li>
    <li>到：<input type="text" name="priceTo" size="5" value="${houseCondition.priceTo}"></li>
    <%--<LI class=first>价格 </LI>--%>
    <%--<LI><SELECT name=price> <OPTION selected value="">不限</OPTION> <OPTION --%>
      <%--value=0-100>100元以下</OPTION> <OPTION value=100-200>100元—200元</OPTION> --%>
      <%--<OPTION value=200-1000000>200元以上</OPTION></SELECT> </LI>--%>
  </UL>
  </DD>


  <DD>
  <UL><LI class=bold>房屋位置:</LI>
    <li><input type="text" name="sname" size="5" value="${houseCondition.sname}"></li>
    <%--<LI class=first>房屋位置</LI>--%>
    <%--<LI><SELECT id=street name=street_id> <OPTION selected --%>
      <%--value="">不限</OPTION> <OPTION value=1000>知春路</OPTION> <OPTION --%>
      <%--value=1001>中关村大街</OPTION> <OPTION value=1002>学院路</OPTION> <OPTION --%>
      <%--value=1003>朝阳路</OPTION></SELECT> </LI>--%>
  </UL>
  </DD>

  <DD>
  <%--<UL><LI class=bold>房型：</LI>--%>
    <%--<li><input type="text" name="tname" size="5"></li>--%>
    <LI class="">房型</LI>
    <LI><SELECT name="tname">
      <OPTION selected value="">不限</OPTION>
      <OPTION value="一室一厅">一室一厅</OPTION>
      <OPTION value="一室两厅">一室两厅</OPTION>
      <OPTION value="两室一厅">两室一厅</OPTION>
      <OPTION value="两室两厅">两室两厅</OPTION>
      <OPTION value="三室一厅">三室一厅</OPTION>
      <OPTION value="三室两厅">三室两厅</OPTION>
      <OPTION value="三室三厅">三室三厅</OPTION>
      <OPTION value="四室一厅">四室一厅</OPTION>
      <OPTION value="四室两厅">四室两厅</OPTION>
      <OPTION value="四室三厅">四室三厅</OPTION>
      <OPTION value="四室四厅">四室四厅</OPTION>
    </SELECT>
  </LI>
  </UL>
  </DD>

  <DD>
  <UL><LI class=bold>面积：</LI>
    <li>从: <input type="text" name="floorageFrom" size="5" value="${houseCondition.floorageFrom}"></li>
    <li>到：<input type="text" name="floorageTo" size="5" value="${houseCondition.floorageTo}"></li>
    <%--<LI class=first>面积 </LI>--%>
    <%--<LI><SELECT name=floorage> <OPTION selected value="">不限</OPTION> <OPTION --%>
      <%--value=0-40>40以下</OPTION> <OPTION value=40-500>40-500</OPTION> <OPTION --%>
      <%--value=500-1000000>500以上</OPTION></SELECT>--%>
    <%--</LI>--%>
  </UL>
  </DD>

    <DD>
      <UL><li><a href="regs.jsp">注册</a></li>
        <li><a href="login.jsp">登陆</a></li>
        <LI>
          <label><input class="ui-green searchs" type="submit"  value="搜索房屋" name=search/></label>
        </LI>
      </UL></DD>

  </FORM></DL></DIV>



<DIV class="main wrap">


<TABLE class=house-list>
  <TBODY>
  <c:forEach items="${pageInfo.list}" var="h">
  <TR>
    <TD class=house-thumb><span><A href="getDetailsById?id=${h.id}" target="_blank"><img src="http://localhost:80/${h.path}" width="100" height="75" alt="请上传图片"/></a></span></TD>
    <TD>
      <DL>
        <DT><A href="getDetailsById?id=${h.id}" target="_blank">${h.title}</A></DT>
        <DD>${h.dname}${h.sname},${h.floorage}平米<BR>联系方式：${h.contact} </DD></DL></TD>
    <TD class=house-type>${h.tname}</TD>
    <TD class=house-price><SPAN>${h.price}</SPAN>元/月</TD></TR>
  </c:forEach>
  <TR>租房信息</TR></TBODY></TABLE>
<DIV class=pager>
<UL>
  <LI class=current><A href="selectHouseByShow?page=1">首页</A></LI>
  <LI><A href="selectHouseByShow?page=${pageInfo.pageNum-1}">上一页</A></LI>
  <LI><A href="selectHouseByShow?page=${pageInfo.pageNum+1}">下一页</A></LI>
  <LI><A href="selectHouseByShow?page=${pageInfo.pages}">末页</A></LI></UL><SPAN
class=total>${pageInfo.pageNum}/${pageInfo.pages}页,共有${pageInfo.total}条记录</SPAN> </DIV></DIV>
<DIV id=footer class=wrap>
<DL>
  <DT>青鸟租房 © 2018 北大青鸟 京ICP证1000001号</DT>
  <DD>关于我们 · 联系方式 · 意见反馈 · 帮助中心</DD></DL></DIV></BODY></HTML>
