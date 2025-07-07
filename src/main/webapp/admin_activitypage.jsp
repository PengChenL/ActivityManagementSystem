<%--
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
    <title>管理员活动管理界面</title>
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

            <div class="search-area">
                活动名称：<input type="text" id="searchbyname" name="searchbyname">
                活动组织方：<input type="text" id="searchbyorg" name="searchbyorg">
                活动状态：
                <select id="actstatus">
                    <option value="null" id="s0"></option>
                    <option value="signing" id="s1">报名中</option>
                    <option value="signupddl" id="s2">报名截止</option>
                    <option value="end" id="s3">活动结束</option>
                </select>
                <button id="seach" onclick="search()">搜索</button>
            </div>



            <div class="displayfram-1">
                <table id="activityTable" style="border: black 1px solid" >
                    <tr>
                        <th>活动名称</th>
                        <th>时间</th>
                        <th>组织方</th>
                        <th>活动状态</th>
                        <th>报名人数</th>
                        <th>联系人</th>
                        <th>操作</th>
                        <th>信息查看</th>
                    </tr>

                    <c:forEach items="${activityList}" var="item">
                        <tr>
                            <td>${item.getAcname()}</td>
                            <td>${item.getActime()}</td>
                            <td>${item.getAcorg()}</td>
                            <td>${item.getAcstatus()}</td>
                            <td>${item.getParticipantnum()}</td>
                            <td>${item.getAccontact()}</td>
                            <td><button data-activity-id="${item.getActid()}" class="view-signup-btn">查看报名表</button>
                                <button>修改</button></td>
                            <td>
                                <button class="signup-details-btn">报名详情</button>
                            </td>
                        </tr>
                    </c:forEach>

                </table>
                <div id="releaseactivity">
                    <button i="rela" onclick="toggleDrawer()">发布活动</button>
                    <div id="drawer" class="drawer">
                        <!-- 添加关闭抽屉按钮 -->
                        <div class="close-drawer">
                            <button onclick="toggleDrawer()" id="close">关闭</button>
                        </div>
                        <form id="dynamic-form">
                            活动编号：<input type="text" id="actid" name="actid"><br>
                            活动名称：<input type="text" id="actname" name="actname"><br>
                            活动时间：<input type="text" id="actime" name="actime"><br>
                            活动组织：<input type="text" id="acorg" name="acorg" value="${admin.getAorg()}"><br>
                            活动简介：<input type="text" id="acinfo" name="acinfo"><br>
                            活动状态：<input type="text" id="acstatus" name="acstatus"><br>
                            活动联系人：<input type="text" id="accontact" name="accontact"><br>
                            请在下方区域设计报名表！<br>
                            <div id="form-fields" class="sortable">
                                <!-- 这里将动态生成表单项 -->
                            </div>
                            <button type="button" onclick="addFormField()" id="addcolum">添加信息</button>
                            <button type="button" onclick="submitForm()" id="subm">提交</button>
                        </form>
                    </div>
                </div>
                <div id="entry-questions-container">
                    报名表展示区域
                </div>

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

        // 获取搜索条件
        var name = document.getElementById('searchbyname').value;
        var organization = document.getElementById('searchbyorg').value;
        var status = document.getElementById('actstatus').value;

        // 执行ajax请求
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "/ams/admin/activity", true); // 替换成你的服务器端 URL
        xhr.setRequestHeader("Search", "Search");
        // 监听请求状态变化事件
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    // 请求成功，处理返回的数据
                    var response = JSON.parse(xhr.responseText);
                    // 进行相应的操作，如更新页面内容等
                    console.log(response);
                } else {
                    // 请求失败，显示错误信息
                    console.error('搜索请求失败');
                }
            }
        };
        xhr.send();



}

    // 获取所有的查看报名表按钮
    var viewSignupBtns = document.getElementsByClassName("view-signup-btn");

    // 遍历每个按钮，为其添加事件监听器
    for (var i = 0; i < viewSignupBtns.length; i++) {
        viewSignupBtns[i].addEventListener("click", function(e) {
            // 获取按钮上的活动 ID
            var activityId = e.target.getAttribute("data-activity-id");

            // alert(activityId);
            // 执行 AJAX 请求
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "/ams/admin/activity", true); // 替换成你的服务器端 URL
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                    // alert("成功！")
                    // 处理响应
                    var response = xhr.responseText;
                    // console.log(response);

                    // 处理响应
                    var response = JSON.parse(xhr.responseText);
                    // console.log(response.entryform);

                    for (var i = 0; i < response.entryform.length; i++) {
                        var item = response.entryform[i];
                        console.log(item.acty);
                        console.log(item.qusnum);
                        console.log(item.actid);
                    }
                    handleEntryQuestions(response.entryform);
                }
            };
            xhr.setRequestHeader("X-Requested-With", "ShowEntryForm"); // 设置 X-Requested-With 请求头字段
            xhr.send("activityId=" + encodeURIComponent(activityId));
        });
    }

    //处理后端传来的报名信息表，用于整合显示到前端
    function handleEntryQuestions(entryQuestions) {
        // 在这个函数中进行entryQuestions数据的展示和处理
        // 例如，可以将问题展示在页面上的表单中，并且根据需要进行处理
        // 在这里可以进行entryQuestions数据的展示和处理
        var entryQuestionsContainer = document.getElementById("entry-questions-container");

        // 清空容器中的内容
        entryQuestionsContainer.innerHTML = "";

        // 创建表格元素
        var table = document.createElement("table");
        table.setAttribute("border", "1");

        // 表格头部
        var thead = document.createElement("thead");
        var headers = ["序号", "问题"]; // 表头标题数组

        // 创建表头行
        var headerRow = document.createElement("tr");
        headers.forEach(function (header) {
            var th = document.createElement("th");
            th.textContent = header;
            headerRow.appendChild(th);
        });
        thead.appendChild(headerRow);
        table.appendChild(thead);

        // 表格主体
        var tbody = document.createElement("tbody");

        // 判断是否有问题数据
        if (Array.isArray(entryQuestions) && entryQuestions.length > 0) {
            // 遍历 entryQuestions 数组，为每个问题创建一行
            entryQuestions.forEach(function (item) {
                var question = item.qusnum;
                var answer = item.qusname;

                var row = document.createElement("tr");
                var questionCell = document.createElement("td");
                var answerCell = document.createElement("td");

                questionCell.textContent = question;
                answerCell.textContent = answer;

                row.appendChild(questionCell);
                row.appendChild(answerCell);
                tbody.appendChild(row);
            });

            table.appendChild(tbody);
            entryQuestionsContainer.appendChild(table);
        } else {
            // 如果没有问题数据，则显示提示信息
            entryQuestionsContainer.textContent = "报名表查看失败！";
        }
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


    function addFormField() {
        var formFields = document.getElementById("form-fields");

        // 创建新的表单项
        var newField = document.createElement("div");
        newField.className = "form-item";
        newField.id = "field" + formFieldsCount;
        newField.innerHTML =
            '序号<span class="item-number">' + (formFieldsCount + 1) + '</span>' +
            // '<label for="field' + formFieldsCount + '">字段' + formFieldsCount + '：</label>' +
            '<input type="text" name="field' + formFieldsCount + '" id="field' + formFieldsCount + '">' +
            '<button class="remove-field" onclick="removeFormField(' + formFieldsCount + ')">删除</button>';

        // 将新的表单项添加到表单中
        formFields.appendChild(newField);

        renumberItems();

        formFieldsCount++;

        makeSortable();
    }

    function removeFormField(fieldId) {
        var formFields = document.getElementById("form-fields");
        var fieldToRemove = document.getElementById("field" + fieldId);
        formFields.removeChild(fieldToRemove);
        formFieldsCount--;
    }

    function submitForm() {
        // 先看看几个框框是否为空，空的话不让提交
        var id = document.getElementById("actid").value;
        var name = document.getElementById("actname").value;
        var time = document.getElementById("actime").value;
        var org = document.getElementById("acorg").value;
        var info = document.getElementById("acinfo").value;
        var status = document.getElementById("acstatus").value;
        var contact = document.getElementById("accontact").value;

        if(isEmpty(id) || isEmpty(name) || isEmpty(time) || isEmpty(org) || isEmpty(info) ||
            isEmpty(status) || isEmpty(contact)){
            alert("不能有空哦！")
            return;
        }

        var form = document.getElementById("dynamic-form");
        var formData = new FormData(form);

        // 在这里对表单数据进行操作，例如发送到服务器处理
        // 创建一个AJAX请求
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "/ams/admin/activity", true); // 替换成你的服务器URL

        // 设置请求头（可选）
        // xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

        // 定义响应处理函数
        xhr.onload = function() {
            if (xhr.status === 200) {
                // 请求成功处理逻辑
                console.log(xhr.responseText);
            } else {
                // 请求失败处理逻辑
                console.error("请求失败：" + xhr.status);
            }
        };

        // 发送请求
        xhr.setRequestHeader("Submit", "Submit");

        xhr.send(formData);

        form.reset();

        toggleDrawer();
    }

    function makeSortable() {
        var formFields = document.getElementById("form-fields");
        new Sortable(formFields, {
            animation: 150,
            handle: ".item-number",
            onEnd: function(evt) {
                renumberItems();
            }
        });
    }


    function removeFormField(fieldId) {
        var formFields = document.getElementById("form-fields");
        var fieldToRemove = document.getElementById("field" + fieldId);
        formFields.removeChild(fieldToRemove);

        renumberItems();
    }

    function renumberItems() {
        var formItems = document.getElementsByClassName("form-item");
        for (var i = 0; i < formItems.length; i++) {
            var itemNumber = formItems[i].getElementsByClassName("item-number")[0];
            itemNumber.innerText = i + 1;
        }
    }


    // 下面是查看报名情况的相关js代码
    var signupDetailsBtns = document.getElementsByClassName('signup-details-btn');

    for (var i = 0; i < signupDetailsBtns.length; i++) {
        signupDetailsBtns[i].addEventListener('click', function() {
            // 获取活动ID
            var activityId = this.parentElement.parentNode.querySelector('.view-signup-btn').getAttribute('data-activity-id');

            // 根据活动ID拼接新的URL，并进行页面跳转
            var detailsURL = 'http://localhost:8080/ams/admin/activity/registrations/' + activityId;
            window.location.href = detailsURL;
        });
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



