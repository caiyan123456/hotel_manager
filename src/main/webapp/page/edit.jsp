<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<!-- saved from url=(0044)http://localhost:8080/HouseRent/page/add.jsp -->
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD><TITLE>武汉租房 -修改房屋信息</TITLE>
<META content="text/html; charset=utf-8" http-equiv=Content-Type><LINK 
rel=stylesheet type=text/css href="../css/style.css">
<META name=GENERATOR content="MSHTML 8.00.7601.17514"></HEAD>
<script language="JavaScript" src="../admin/js/jquery-1.8.3.js"></script>

<script language="JavaScript">
    $(function(){
        //网页加载完成显示
        showStreet($("#district").val());

        //给区域添加改变事件，显示对应的街道
        $("#district").change(function(){

            //获取区域的id,去后台查询对应的街道
            var did=$(this).val();
            //发送异步请求获取街道
            showStreet(did);
        });

    });

    function showStreet(did){
        $.post("getStreetByDid",{"did":did},function(data){
            $("#streetid>option").remove(); //清空选项
            for(var i=0;i<data.length;i++){
                //创建一个dom节点
                var option=$("<option value="+data[i].id+">"+data[i].name+"</option>");
                $("#streetid").append(option);  //追加节点
                //设置街道选中项
                $("#streetid").val(${house.streetId});
            }
        },"json");
    }

</script>

<BODY>
<DIV id=header class=wrap>
<DIV id=logo><IMG src="../images/logo.gif"></DIV></DIV>
<DIV id=regLogin class=wrap>
<DIV class=dialog>
<DL class=clearfix>
  <DT>修改房屋信息</DT>
  <DD class=past>重填房屋信息</DD></DL>
<DIV class=box>
<FORM id=add_action method=post  enctype="multipart/form-data"
       action="updateHouseByUser">
<DIV class=infos>
<TABLE class=field>
  <TBODY>
  <TR>
    <TD><INPUT  type=hidden name="id" value="${house.id}"> </TD></TR>
  <TR>
  <TR>
    <TD class=field>标　　题：</TD>
    <TD><INPUT id=add_action_title class=text type=text name=title value="${house.title}"> </TD></TR>
  <TR>
    <TD class=field>户　　型：</TD>
    <TD><SELECT class=text name=typeId>
      <c:forEach items="${types}" var="t">
        <OPTION <c:if test="${t.id==house.typeId}">selected="selected"</c:if>  value=${t.id}>${t.name}</OPTION>
      </c:forEach>
    </SELECT></TD></TR>
  <TR>
    <TD class=field>面　　积：</TD>
    <TD><INPUT id=add_action_floorage class=text type=text 
name=floorage value="${house.floorage}"></TD></TR>
  <TR>
    <TD class=field>价　　格：</TD>
    <TD><INPUT id=add_action_price class=text type=text name=price value="${house.price}"> </TD></TR>
  <TR>
    <TD class=field>发布日期：</TD>
    <TD><INPUT class=text type=date name=pubdate value="<f:formatDate value="${house.pubdate}" pattern="yyyy-MM-dd"></f:formatDate>"></TD></TR>
  <TR>
    <TD class=field>位　　置：</TD>
    <TD>区：<SELECT class=text name=district_id id="district">
      <c:forEach items="${districts}" var="d">
        <OPTION <c:if test="${d.id==did}">selected="selected" </c:if> value="${d.id}">${d.name}</OPTION>
      </c:forEach>
    </SELECT> 街：<SELECT class=text id="streetid" name=streetId>

      <OPTION selected value="" >请选择</OPTION>

    </SELECT> </TD></TR>

						<%--<tr>--%>
							<%--<td class="field">坐  标：</td>--%>
							<%--<td><input type="text" class="text" name="point" />--%>
							<%--</td>--%>
						<%--</tr>--%>
						 <%--<tr>--%>
							<%--<td class="field">Y 坐  标：</td>--%>
							<%--<td><input type="text" class="text" name="point.y" /></td>--%>
						<%--</tr>--%>
  <TR>
    <TD class=field>联系方式：</TD>
    <TD><INPUT id=add_action_contact class=text type=text name=contact value="${house.contact}"> </TD></TR>
  <div align="center"><img src="http://localhost:80/${house.path}" width="150" height="150"/></div>
  <TR >
    <TD class=field>图片：</TD>
    <TD><INPUT id=sss name="pfile" class=text type=file> </TD>
  </TR>

  <TR>
    <TD class=field>详细信息：</TD>
    <TD><TEXTAREA name=description>${house.description}</TEXTAREA></TD></TR></TBODY></TABLE>
<DIV class=buttons><INPUT  value=修改完成 type=submit>
</DIV></DIV></FORM></DIV></DIV></DIV>
<DIV id=footer class=wrap>
<DL>
  <DT>青鸟租房 © 2018 北大青鸟 京ICP证1000001号</DT>
  <DD>关于我们 · 联系方式 · 意见反馈 · 帮助中心</DD></DL></DIV></BODY></HTML>
