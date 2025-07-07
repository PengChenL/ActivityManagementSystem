<%--
  Created by IntelliJ IDEA.
  User: Peng'chen
  Date: 2023/7/8
  Time: 21:51
  To change this template use File | Settings | File Templates.
  这是一个专门用于测试的jsp文件
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <style>
        /* 抽屉容器样式 */
        .drawer-container {
            position: fixed;
            top: 0;
            left: -300px; /* 抽屉默认隐藏在页面左侧 */
            width: 300px;
            height: 100vh;
            background-color: #f5f5f5;
            transition: left 0.3s ease; /* 添加过渡效果 */
        }

        /* 抽屉内容样式 */
        .drawer-content {
            padding: 20px;
        }

        /* 按钮样式 */
        .toggle-button {
            position: fixed;
            top: 20px;
            right: 20px;
            z-index: 9999;
        }
    </style>
</head>
<body>

<!-- 抽屉容器 -->
<div class="drawer-container" id="drawerContainer">
    <div class="drawer-content">
        <!-- 抽屉内容 -->
        <h2>抽屉内容</h2>
        <p>这里是抽屉中的内容。</p>
    </div>
</div>

<!-- 页面内容 -->
<div>
    <button class="toggle-button" onclick="toggleDrawer()">切换抽屉</button>
    <h1>页面内容</h1>
    <p>这里是页面的主要内容。</p>

   <%-- 弹出新的窗口 --%>
    <a href="http://localhost:8080/ams/test_drawer.jsp" target="_blank" onclick="window.open('http://localhost:8080/ams/test_drawer.jsp', 'newwindow', 'width=600,height=400');
    return false;">点击打开弹出窗口</a>

</div>



<script type="text/javascript" src="webjars/jquery/3.6.0/jquery.js"></script>
<script type="text/javascript">
    function toggleDrawer() {
        var drawer = document.getElementById("drawerContainer");
        if (drawer.style.left === "-300px") { // 当抽屉隐藏时
            drawer.style.left = "0"; // 显示抽屉
        } else {
            drawer.style.left = "-300px"; // 隐藏抽屉
        }
    }

</script>


</body>
</html>