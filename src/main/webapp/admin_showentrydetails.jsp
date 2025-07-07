<%@ page import="java.util.Map" %><%--
  Created by IntelliJ IDEA.
  User: Peng'chen
  Date: 2023/7/8
  Time: 18:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>管理员活动管理界面-报名情况查看</title>
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
            padding: 0;
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
            padding: 0;

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

        .navigation .nav-item-2 a {
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
            /*background-color: #cccccc;*/
            height: 300px;
            width: 90%;
            padding: 20px;
            margin: 0 20px;

        }

        .search-area{
            float: left;
            /*background-color: #cccccc;*/
            height: 20px;
            width: 90%;
            padding: 20px;
            margin: 20px;
            font-size: 19px;
        }



        table {
            border-collapse: collapse;
            width: 100%;
            font-family: Arial, sans-serif;
            font-size: 18px;
        }

        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: center;
        }

        th {
            background-color: #d5d5d5;
            font-weight: bold;
        }

        td{
            background-color: white;
        }

        button {
            padding: 5px 10px;
            background-color: #4CAF50;
            border: none;
            color: white;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }


        .search-area {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 20px;
            font-family: Arial, sans-serif;
        }

        input[type="text"] {
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 3px;
            font-size: 14px;
        }

        select {
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 3px;
            font-size: 14px;
        }

        #signupforact {
            display: flex;
            /*justify-content: center;*/
            /*align-items: center;*/
        }

        button[i="rela"] {
            width: 100px;
            height: 100px;
            background-color: white;
            border: none;
            color: black;
            cursor: pointer;
            font-size: 28px;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 30px 0;
        }

        /*设置抽屉*/
        .drawer {
            width: 800px;
            height: 100%;
            background-color: #f1f1f1;
            position: fixed;
            top: 0;
            right: -1000px;
            transition: right 0.3s ease-in-out;
            z-index: 9999;
            padding: 20px;
        }

        /* 添加遮罩层样式 */
        .mask {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5); /* 调整透明度 */
            display: none;
            z-index: 9998; /* 小于抽屉的 z-index */
        }

        /*抽屉中的css*/
        /* 表单布局和样式 */
        #dynamic-form {
            margin-top: 20px;
        }

        #dynamic-form input[type="text"] {
            width: 80%;
            padding: 5px;
            margin-bottom: 10px;
            margin-right: 10px;
            margin-left: 10px;
        }

        #form-fields {
            margin-top: 20px;
            min-height: 100px;
            max-height: 400px;
            border: 1px solid #ccc;
            padding: 10px;
            overflow-y: auto; /* 添加垂直滚动条 */
        }

        .sortable {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        .sortable li {
            background-color: #f1f1f1;
            padding: 5px;
            margin-bottom: 5px;
        }

        .sortable li:hover {
            background-color: #e1e1e1;
        }

        #addcolum {
            background-color: #4CAF50;
            color: #fff;
            border: none;
            padding: 10px 20px;
            margin-top: 10px;
            cursor: pointer;
        }

        #addcolum:hover {
            background-color: #45a049;
        }

        #subm {
            background-color: #4CAF50;
            color: #fff;
            border: none;
            padding: 10px 20px;
            margin-top: 10px;
            cursor: pointer;
        }

        #subm:hover {
            background-color: #45a049;
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
            你好${admin.getAname()}，欢迎登录！

        </div>
        <ul>
            <li class="nav-item-1"><a href="/ams/admin/my">我的首页</a></li>
            <li class="nav-item-2"><a href="">活动管理</a></li>
            <li class="nav-item-3"><a href="/ams/admin/information">信息发布</a></li>
            <li class="nav-item-4"><a href="/ams/admin/org">我的组织</a></li>
        </ul>
    </div>

    <%--内容展示部分了--%>
    <div class="content">
        <div class="statusbox">
            状态栏，此处做一个地址栏
        </div>
        <div class="panel-center">

            <div class="goBack">
                <button onclick="goBack()">返回</button>
            </div>



            <div class="displayfram-1">

                <%
                    Map<String, Map<String, String>> detailMap = (Map<String, Map<String, String>>) request.getAttribute("detail");
                %>

                <table>
                    <thead>
                    <tr>
                        <% if (detailMap != null && !detailMap.isEmpty()) { %>
                        <% String activityId = detailMap.keySet().iterator().next(); %>
                        <% Map<String, String> activityData = detailMap.get(activityId); %>
                        <% for (String innerKey : activityData.keySet()) { %>
                        <th><%= innerKey %></th>
                        <% } %>
                        <% } %>
                    </tr>
                    </thead>
                    <tbody>
                    <% if (detailMap != null && !detailMap.isEmpty()) { %>
                    <% for (String activityId : detailMap.keySet()) { %>
                    <tr>
                        <% Map<String, String> activityData = detailMap.get(activityId); %>
                        <% for (String innerKey : activityData.keySet()) { %>
                        <td><%= activityData.get(innerKey) %></td>
                        <% } %>
                    </tr>
                    <% } %>
                    <% } else { %>
                    <tr>
                        <td colspan="10">暂无报名信息</td>
                    </tr>
                    <% } %>
                    </tbody>
                </table>

            </div>


        </div>


    </div>

</div>
<div id="mask" class="mask"></div> <!-- 添加遮罩层 -->


<script type="text/javascript" src="webjars/jquery/3.6.0/jquery.js"></script>
<script src="webjars/jquery/3.1.1/jquery.min.js"></script>

<script type="text/javascript">
    function search(){
    //    接收要搜索的信息
        alert("点击了搜索")
    }
    function goBack() {
        history.back();
    }




    <!-- ·························   下面是抽屉相关的js代码  ··························· -->

    var formFieldsCount = 0;

    function toggleDrawer() {
        var drawer = document.getElementById("drawer");
        if (drawer.style.right === "0px") {
            drawer.style.right = "-1000px";
            mask.style.display = "none"; // 隐藏遮罩层
            //关闭的时候清空动态区域
            var formFields = document.getElementById("form-fields");
            formFields.innerHTML = "";

            //关闭的时候置零
            formFieldsCount = 0;

        } else {
            drawer.style.right = "0px";
            mask.style.display = "block"; // 显示遮罩层
        }
    }



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



