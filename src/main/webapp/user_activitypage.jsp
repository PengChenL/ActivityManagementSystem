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
    <title>用户活动查看界面</title>
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
            你好${user.getSname()}，欢迎登录！

        </div>
        <ul>
            <li class="nav-item-1"><a href="/ams/user/my">我的首页</a></li>
            <li class="nav-item-2"><a href="">活动中心</a></li>
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
                            <td>${item.getAccontact()}</td>
                            <td><button>信息</button></td>
                            <td>
                                <button class="signup-btn" data-activity-id="${item.getActid()}">报名</button>
                            </td>
                        </tr>
                    </c:forEach>

                </table>
                <div id="signupforact">
                    <div id="drawer" class="drawer">
                        <!-- 添加关闭抽屉按钮 -->
                        <div class="close-drawer">
                            <button onclick="toggleDrawer()" id="close">关闭</button>
                        </div>
                        <div id="entry-area">
                            报名表区域
                        </div>
                    </div>
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
        xhr.open("POST", "/ams/user/activity", true);
        xhr.setRequestHeader("Search", "Search");
        // 监听请求状态变化事件
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    // 处理响应
                    var response = xhr.responseText;
                    console.log(response);

                    // 处理响应
                    // var response = JSON.parse(xhr.responseText);
                    // console.log(response.entryform);
                } else {
                    // 请求失败，显示错误信息
                    console.error('搜索请求失败');
                }
            }
        };
        // 创建 FormData 对象并添加参数
        var formData = new FormData();
        formData.append('name', name);
        formData.append('organization', organization);
        formData.append('status', status);
        xhr.send(formData);



    }

    // 获取所有的查看报名表按钮
    var viewSignupBtns = document.getElementsByClassName("signup-btn");

    // 遍历每个按钮，为其添加事件监听器
    for (var i = 0; i < viewSignupBtns.length; i++) {
        viewSignupBtns[i].addEventListener("click", function(e) {
            // 获取按钮上的活动 ID
            var activityId = e.target.getAttribute("data-activity-id");

            // alert(activityId);

            toggleDrawer();
            // 执行 AJAX 请求
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "/ams/user/activity", true); // 替换成你的服务器端 URL
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

    // 全局变量，用于存储表格中填写的信息
    // var formData = [];

    function handleEntryQuestions(entryQuestions) {
        // 在这个函数中进行entryQuestions数据的展示和处理
        // 例如，可以将问题展示在页面上的表单中，并且根据需要进行处理
        // 在这里可以进行entryQuestions数据的展示和处理
        var entryQuestionsContainer = document.getElementById("entry-area");

        // 清空容器中的内容
        entryQuestionsContainer.innerHTML = "";

        // 创建表格元素
        var table = document.createElement("table");
        table.setAttribute("border", "1");

        // 表格头部
        var thead = document.createElement("thead");
        var headers = ["序号", "问题", "填写信息"]; // 更新表头标题数组

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

        // 判断数据是否有问题
        if (Array.isArray(entryQuestions) && entryQuestions.length > 0) {
            // 遍历 entryQuestions 数组，为每个问题创建一行
            entryQuestions.forEach(function (item, index) {
                var question = item.qusnum;
                var answer = item.qusname;

                var row = document.createElement("tr");
                var questionCell = document.createElement("td");
                var answerCell = document.createElement("td");

                questionCell.textContent = question;
                answerCell.textContent = answer;

                row.appendChild(questionCell);
                row.appendChild(answerCell);

                // 添加新的单元格用于填写信息
                var infoCell = document.createElement("td");
                var input = document.createElement("input");
                var inputId = "input-" + index; // 为每个输入框创建唯一的ID
                input.type = "text";
                input.id = inputId;
                infoCell.appendChild(input);
                row.appendChild(infoCell);

                // formData.push({ id: inputId, value: "" }); // 初始化formData数组，为每个输入框创建占位数据

                tbody.appendChild(row);
            });

            table.appendChild(tbody);
            entryQuestionsContainer.appendChild(table);

            // 创建提交按钮
            var submitButton = document.createElement("button");
            submitButton.textContent = "提交";
            submitButton.addEventListener("click", submitForm);
            entryQuestionsContainer.appendChild(submitButton);
        } else {
            // 如果没有问题数据，则显示提示信息
            entryQuestionsContainer.textContent = "管理员暂未发布报名表！";
        }
    }

    // 提交表单数据的函数
    function submitForm() {
        // 在这里可以将收集到的formData数据发送到后端或进行其他处理
        // 例如，可以使用AJAX请求将数据发送到后端API
        var formData = new FormData(); // 创建新的 FormData 对象

        var entryQuestions = document.querySelectorAll("[id^='input-']");
        entryQuestions.forEach(function (input) {
            formData.append(input.id, input.value); // 将输入框的值添加到 FormData
        });
        console.log(formData);

        // 创建一个AJAX请求
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "/ams/user/activity", true); // 替换成你的服务器URL

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
        xhr.setRequestHeader("SubmitEntryForm", "SubmitEntryForm");

        xhr.send(formData);

        // form.reset();
        alert("报名成功！");

        toggleDrawer();
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



    function removeFormField(fieldId) {
        var formFields = document.getElementById("form-fields");
        var fieldToRemove = document.getElementById("field" + fieldId);
        formFields.removeChild(fieldToRemove);
        formFieldsCount--;
    }

    function submitForm_old() {
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



