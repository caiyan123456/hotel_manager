<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/6/18
  Time: 8:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="Css/default.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="easyUI/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="easyUI/themes/icon.css" />
    <script type="text/javascript" src="js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="js/jquery.easyui.min.js"></script>
    <script language="JavaScript">
        $(function(){
             //使用datagrid绑定数据展示
            $('#dg').datagrid({
                url:'getType',
                fitColumns: true,  //自适应列宽
                pagination: true, //实现分页
                pageList: [3, 10, 15, 20], //页大小选择
                toolbar:"#ToolBar",     //工具栏
                //singleSelect:true,  //只能设置单选
                pageSize:10,         //默认页大小
                columns: [[
                    {field:'ck',checkbox:true},  //复选框列
                    { field: 'id', title: '编号', width: 50, align: "center" },
                    { field: 'name', title: '户型', width: 50, align: "center" },
                    { field: 'opt', title: '操作', width: 50, align: "center",
                        formatter: function(value,row,index){
                            return "<a href='javascript:delSingle("+row.id+")'>删除</a>";
                        }
                    }
                ]]
            });
        });
        //打开添加窗口
        function Add() {
            $("#AddDialog").dialog("open").dialog('setTitle',"添加户型");
        }
        //关闭添加窗口
        function CloseDialog(obj){
            $("#"+obj).dialog("close");
        }
        //添加保存
        function SaveDialog(){
            //传统:取值-->通过$.ajax方法发送异步请求实现添加
            $('#saveDialogForm').form('submit', {
                    url:"addType",  //提交的服务器地址
                    success:function(data){
                        //json字符串转换为json对象
                        var obj=$.parseJSON(data);
                        if(obj.result>0){
                            $("#AddDialog").dialog("close");  //关闭
                            $("#dg").datagrid('reload'); //刷新
                            // $.messager.alert('提示框','恭喜添加成功!');
                        } else {
                            $.messager.alert('提示框','系统正在维护!');
                        }
                    }
            });
        }
        //弹出修改对话框
        function ModifyBySelect(){
            var SelectRows = $("#dg").datagrid('getSelections');
            if(SelectRows.length!=1){
                $.messager.alert('提示框','请选中一行进行修改！');
                return;
            }
            var SelectRow = SelectRows[0];
            //打开编辑对话框
            $("#upDialog").dialog("open").dialog('setTitle',"修改户型");
            // 表单对象名称与json对象的键相同即可还原
            $("#upDialogForm").form('load',SelectRow);
        }
        //修改
        function updateDialog(){
            $('#upDialogForm').form('submit', {
                url:"updateType",
                success:function(data){
                    //json字符串转换为json对象
                    var obj=$.parseJSON(data);
                    if(obj.result>0){
                        $("#upDialog").dialog("close");
                        $("#dg").datagrid('reload'); //刷新
                    } else {
                        $.messager.alert('提示框','系统正在维护!');
                    }
                }
            });
        }

        //删除单个区域
        function delSingle(id){
            $.messager.confirm('确认提示框', '你真的要删除吗?', function(result){
                if (result){
                    $.post("deleteType",{"id":id},function(data){
                        if(data.result>0){
                            $("#dg").datagrid('reload');
                        } else {
                            $.messager.alert('提示框','系统正在维护!');
                        }
                    },"json");

                }
            });
        }

        //删除选中项：批量删除
        function DeleteMore(){
            //判断有无选中行
            var SelectRows = $("#dg").datagrid('getSelections');
            if(SelectRows==null){
                $.messager.alert('提示框','你还没有选中行');
                return;
            }

            //获取选中项的值   拼成:1,2,3
            var delValue="";
            for(var i=0;i< SelectRows.length;i++){
                delValue+=SelectRows[i].id+",";
            }
            delValue=delValue.substring(0,delValue.length-1);
            //alert(delValue);

            //发送异步请求到服务器
            $.post("deleteMoreType",{"ids":delValue},function(data){
                if(data.result>0){
                    $("#dg").datagrid('reload'); //刷新
                    //alert("添加成功");
                    $.messager.alert('提示框','恭喜你成功删除'+data.result+'行!');
                }
                else
                {
                    $.messager.alert('提示框','系统正在维护!');
                }
            },"json");
        }


    </script>
</head>
<body>
<!--定义工具栏-->
<div id="ToolBar">
    <div style="height: 40px;">
        <a
                href="javascript:Add()" class="easyui-linkbutton"
                iconCls="icon-add" plain="true">添加</a>
        <a
                href="javascript:ModifyBySelect()" class="easyui-linkbutton"
                iconCls="icon-edit" plain="true">修改</a>
        <a
                href="javascript:DeleteMore()" class="easyui-linkbutton"
                iconCls="icon-remove" plain="true">删除</a>
    </div>
</div>
<!--展示数据-->
<table id="dg"></table>
<!--添加窗口-->
<div id="AddDialog" class="easyui-dialog" buttons="#AddDialogButtons"
     style="width: 280px; height: 250px; padding: 10px 20px;" closed="true">
    <form id="saveDialogForm" method="post">
        <table>
            <tr>
                <td>户型:</td>
                <td><input type="text" name="name" /></td>
            </tr>
        </table>
    </form>
</div>
<!--给添加对话框添加按钮-->
<div id="AddDialogButtons">
    <a href="javascript:SaveDialog()" class="easyui-linkbutton"
       iconCls="icon-ok">保存</a>
    <a href="javascript:CloseDialog('AddDialog')"
       class="easyui-linkbutton" iconCls="icon-cancel">取消</a>
</div>

<!--修改对话框-->
<div id="upDialog" class="easyui-dialog" buttons="#upDialogButtons"
     style="width: 280px; height: 250px; padding: 10px 20px;" closed="true">
    <form id="upDialogForm" method="post">
        <table>
            <tr>
                <td>户型:</td>
                <td><input type="text" name="name" /></td>
            </tr>
            <tr>
                <td><input type="hidden" name="id" /></td>
            </tr>
        </table>
    </form>
</div>
<!--给修改对话框添加修改按钮-->
<div id="upDialogButtons">
    <a href="javascript:updateDialog()" class="easyui-linkbutton"
       iconCls="icon-ok">修改</a>
    <a href="javascript:CloseDialog('upDialog')"
       class="easyui-linkbutton" iconCls="icon-cancel">取消</a>
</div>
</body>
</html>
