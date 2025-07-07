<%--
  Created by IntelliJ IDEA.
  User: Peng'chen
  Date: 2023/7/5
  Time: 9:29
  To change this template use File | Settings | File Templates.
  这是一个用户注册界面
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册页面</title>

    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        form {
            width: 400px;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f9f9f9;
            text-align: center;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .button-container {
            display: flex;
            justify-content: space-between;
            width: 100%;
            max-width: 300px; /* 控制按钮容器的最大宽度 */
        }

        input[type="text"],
        input[type="password"] {
            width: 80%;
            padding: 10px;
            margin-bottom: 0;
            border-radius: 3px;
            border: 1px solid #ccc;
            align-content: center;
        }

        button {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            border-radius: 3px;
            border: none;
            background-color: #007bff;
            color: white;
            font-size: 16px;
            cursor: pointer;
            flex-basis: 48%; /* 控制按钮的宽度 */
        }

        button:hover {
            background-color: #0069d9;
        }

        #error {
            font-size: 18px;
            color: red;
        }
    </style>


</head>
<body>

<div style="text-align: center">
    <form action="/ams/user/register" method="post" id="regForm">
        用户名：<input type="text" name="username" id="username"><br>
        密码：<input type="password" name="password" id="password"><br>
        再次确认密码：<input type="password" name="again_password" id="again_password"><br>
        姓名：<input type="text" name="name" id="name"><br>
        学号：<input type="text" name="idcode" id="idcode"><br>
        学院：<input type="text" name="college" id="college"><br>
        专业：<input type="text" name="major" id="major"><br>
        电话：<input type="text" name="tel" id="tel"><br>
        邮箱：<input type="text" name="mail" id="mail"><br>
        <span id="error" style="font-size: 18px;color: red"></span><br>

        <div class="button-container">
            <button type="button" onclick="goBack()">返回</button>
            <button type="button" id="regBtn">注册</button>
        </div>
    </form>
</div>


<%--JS标签--%>
<script type="text/javascript" src="webjars/jquery/3.6.0/jquery.js"></script>
<script type="text/javascript">


<%--    在此应该有相应的检测，包括不为空和验证两次密码应该一致--%>
    $("#regBtn").click(function (){
        // alert("点击注册");
        $("#regForm").submit();
    });


    $("#error").html("${error}");



    function isEmpty(str) {
    if(str == null || str.trim() == "") {
    return true;
    }else{
    return false;}
    }

    function goBack() {
        history.back();
    }


</script>
</body>
</html>
