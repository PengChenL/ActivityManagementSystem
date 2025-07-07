<%--
  Created by IntelliJ IDEA.
  User: Peng'chen
  Date: 2023/7/5
  Time: 11:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户登录主界面</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        .top-header {
            background: rgb(69,93,247);
            background: linear-gradient(90deg, rgba(69,93,247,1) 0%, rgba(252,70,107,1) 100%);
            color: #fff;
            height: 80px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 15%;
        }

        .top-header-logo {
            font-size: 24px;
            font-weight: bold;
        }

        .top-header-links {
            display: flex;
            gap: 20px;
        }

        .top-header-links a {
            color: #fff;
            text-decoration: none;
        }

        .mainview{
            height: calc(100vh - 80px);
            /*background-color: blanchedalmond;*/
            background: white;
        }

        .welcome {
            background-color: #974ec2; /* 背景颜色 */
            padding: 10px; /* 内边距 */
            /*border: 1px solid #ccc; !* 边框 *!*/
            border-radius: 30px; /* 圆角半径 */
            /*text-align: center; !* 文字居中对齐 *!*/
            font-size: 18px; /* 字体大小 */
            color: white; /* 字体颜色 */
            /*height: 100px ;*/
            display: flex;
            align-items: center;
            justify-content: center;
            height: 150px; /* 设置容器的高度 */
            margin: 20px 20px 100px;
        }


        .navigation {
            float: left;
            background: #f57dba;
            width: 15%;
            /*height: calc(100vh - 80px); !* Calculate the height based on the header height *!*/
            height: 100%; /*自适应 */
            padding: 0px;
            margin-left: 15%; /* Set the left margin to 300px */
            /*margin-right: 300px; !* Set the right margin to 300px *!*/
        }

        .navigation ul {
            list-style: none;
            padding: 0;
            text-align: center; /* 将导航栏文本居中对齐 */
            font-size: 20px;
            /*font-weight: bold;*/
        }

        .navigation li {
            /*margin-top: 20px;*/
            /*margin-bottom: 20px;*/
            padding: 0px;

        }

        .navigation a {
            text-decoration: none;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
            /*border-radius: 5px;*/
            transition: background-color 0.3s ease;

        }

        .navigation .nav-item-1 a {
            background-color: #5e4dab;
            color: white; /* 设置 Nav Item 1 的颜色 */
        }

        .navigation a:hover {
            background-color: #c2508b;
        }


        .content {
            /* 右浮动 */
            float: left;
            background-color: yellow;
            width: 55%; /* 设置宽度 */
            /*margin-right: 300px;*/
            /*height: calc(100vh - 60px); !* Calculate the height based on the header height *!*/
            /*padding: 20px;*/
            height: calc(100vh - 80px);
        }

        .statusbox{
            float: left;
            background-color: cornflowerblue;
            height: 30px;
            width: 100%; /* 设置宽度 */

        }

        .panel-center{

            float: left;
            background-color: #b57edc;
            height: calc(100vh - 110px);
            width: 100%; /* 设置宽度 */
        }

        .displayfram-1{

            float: left;
            background-color: #cccccc;
            height: 300px;
            width: 42%;
            padding: 20px;
            margin: 20px;

        }
        .displayfram-2{
            float: left;
            background-color: #463557;
            height: 300px;
            width: 42%;
            padding: 20px;
            margin: 20px;
        }
        .displayfram-3{
            float: left;
            background-color: #463557;
            height: 300px;
            width: 42%;
            padding: 20px;
            margin: 20px;
        }
        .displayfram-4{
            float: left;
            background-color: #cccccc;
            height: 300px;
            width: 42%;
            padding: 20px;
            margin: 20px;
        }


    </style>
</head>

<body>
<%--顶部信息--%>
<div class="top-header">
    <div class="top-header-logo">活动管理系统</div>
    <div class="top-header-links">
        <a href="#">信息</a>
        <a href="#">关于</a>
        <a href="#">帮助</a>
        <a href="http://localhost:8080/ams/login.jsp">退出</a>
    </div>
</div>

<%--下面信息--%>

<div class="mainview">
    <%-- 导航栏 --%>
    <div class="navigation">
        <div class="welcome">
            你好${user.getSname()}，欢迎登录！

        </div>
        <ul>
            <li class="nav-item-1"><a href="">我的首页</a></li>
            <li class="nav-item-2"><a href="/ams/user/activity">活动中心</a></li>
            <li class="nav-item-3"><a href="/ams/user/information">信息查看</a></li>
            <li class="nav-item-4"><a href="/ams/user/detail">我的信息</a></li>
        </ul>
    </div>

    <%--内容展示部分了--%>
    <div class="content">
        <div class="statusbox">
            状态栏，此处做一个地址栏
        </div>
        <div class="panel-center">
            <div class="displayfram-1">
                展示框1
            </div>
            <div class="displayfram-2">
                展示框2
            </div>
            <div class="displayfram-3">
                展示框3
            </div>
            <div class="displayfram-4">
                展示框4
            </div>
        </div>

    </div>

</div>
</body>
</html>
