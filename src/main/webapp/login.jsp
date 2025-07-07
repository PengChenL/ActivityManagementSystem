<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Peng'chen
  Date: 2023/7/4
  Time: 22:12
  To change this template use File | Settings | File Templates.

  这是一个登录界面
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录界面</title>

    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 300px;
            padding: 20px;
            background-color: #f5f5f5;
            border-radius: 4px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }

        input[type="text"],
        input[type="password"] {
            width: 80%;
            padding: 10px;
            margin-bottom: 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        #msg {
            font-size: 18px;
            color: red;
            margin-bottom: 0;
        }

        #identity {
            margin-bottom: 10px;
        }

        .button-container {
            display: flex;
            justify-content: space-between;
            width: 100%;
        }

        .radio-container {
            display: flex;
            justify-content: space-between;
            padding: 10px;
        }
        .radio-container label {
            margin-right: 10px;
        }

        button {
            width: 48%;
            padding: 10px;
            font-size: 16px;
            border: none;
            border-radius: 4px;
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }

    </style>

</head>
<body>
<div style="text-align: center">
    <form action="/ams/login/login" method="post" id="loginForm">
        姓名：<input type="text" name="username" id="username"><br>
        密码：<input type="password" name="password" id="password"><br>
        <span id="msg" style="font-size: 18px;color: red">${msg}</span><br>
        <form action="" id="identity">
            <div class="radio-container">
                <label for="op1">
                    <input type="radio" name="identity" value="admin" id="op1">管理员登录
                </label>
                <label for="op2">
                    <input type="radio" name="identity" value="user" id="op2" checked>用户登录
                </label>
            </div>
        </form>
        <div class="button-container">
            <button type="button" style="font-size: 20px" id="regBtn" onclick="window.location.href='http://localhost:8080/ams/register.jsp'">注册</button>
            <button type="button" style="font-size: 20px" id="loginBtn">登录</button>
        </div>
    </form>
    <span id="tip" style="font-size: 18px;color: red">${tip}</span><br>
</div>
<%--引入Jquery的js文件--%>
<script type="text/javascript" src="webjars/jquery/3.6.0/jquery.js"></script>
<script type="text/javascript">
    /*表单验证*/
    /*
    * 1. 给登录按钮绑定点击事件_通过id选择器绑定
    * 2.获取用户姓名和密码
    * 3.判断姓名和密码是否为空
    * 4.如果都不为空，则提交表单
    *
    * */
    jQuery("#loginBtn").click(function (){
        var uname = $("#username").val();
        var upwd = $("#password").val();
        alert("123");
        if(isEmpty(uname)) {
            // alert("123");
            $("#msg").html("用户名不可为空！")
            return;
        }
        if(isEmpty(upwd)) {
            // alert("123");
            $("#msg").html("密码不可为空！")
            return;
        }

        //如果都不为空，则提交表单

        $("#loginForm").submit();

    });



    function isEmpty(str) {
        if(str == null || str.trim() == "") {
            return true;
        }else{
            return false;
        }
    }
</script>
</body>
</html>
