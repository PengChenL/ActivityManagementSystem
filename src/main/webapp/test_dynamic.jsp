<%--
  Created by IntelliJ IDEA.
  User: Peng'chen
  Date: 2023/7/9
  Time: 9:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>新增</title>
</head>
<body>
<!-- 楼层信息 -->
<form id="addForm" class="form-horizontal">
    <div class="floor">
        <div class="floor_information">楼层信息
            <div class="floor_information_add"> <button onclick="addFloor()" type="button" class="btn btn-info">+</button></div>
        </div>
        <!-- 层数新增1 -->
        <div  class="layer_add"  id="add">
            <div class="first_layer">第1层</div>
            <div class="layer_information_add"> <button onclick="addTr()" type="button" class="btn btn-info">+</button></div>
        </div>
    </div>
</form>

</body>
</html>
<script type="text/javascript" src="webjars/jquery/3.6.0/jquery.js"></script>
<script type="text/javascript">

    var row =1; //行数
    var floor_number =2; //楼层

    $(function () {
//新增楼层
        addFloor =function () {
            //新增时获取楼层的id,方便定位新增
            var floorObj =document.createElement("div");
            floorObj.id = new Date().getTime();
            floorObj.innerHTML="<div class=\"form-group\">\n" +
                "<div class=\"floor\">\n" +
                " <div class=\"layer_add\">\n" +
                "<div class=\"first_layer\">\n第"+floor_number+"层" +
                "    </div>\n" +
                "  <div class=\"layer_information_add\"> <button οnclick=\"addTr()\" type=\"button\" class=\"btn btn-info\">+</button></div>" +
                "    </div>\n" +
                "</div>\n";
            document.getElementById("addForm").appendChild(floorObj);
            floor_number++;
        }


        addTr = function(){
            //新增行数测试 获取层数的id，进行对应的新增操作
            // console.log(floor_number)

            var trObj =document.createElement("div");
            trObj.id = new Date().getTime();
            trObj.innerHTML =
                " <div class=\"layer_information\">\n" +
                // "        <div class=\"delete_layer\">x</div>\n" +
                "        <div class=\"delete_layer\"><button οnclick='deleteTr(this)'>x</button></div>\n" +
                "   <div> 室号：<input name=\"room\" class=\"common\" type=\"text\"/></div>\n" +
                "       <div> 面积：<input name=\"area\" class=\"common\"  type=\"text\"/></div>\n" +
                "       <div>  用途：<select name=\"way\" class=\"common_way\">\n" +
                "         <option value =\"volvo\">会议室</option>\n" +
                "         <option value =\"saab\">大厅</option>\n" +
                "         <option value=\"opel\">走廊</option>\n" +
                "       <option value=\"audi\">调度室</option>\n" +
                "     </select>\n" +
                "</div>\n";
            document.getElementById("add").appendChild(trObj);
        }

//删除某层的事件
        deleteTr = function(obj){
            var trId = obj.parentNode.parentNode.id;
            var trObj = document.getElementById(trId);
            document.getElementById("add").removeChild(trObj);
        }

//获取点击事件的id
        $('#addForm').click(function(){
            theId = $(this).attr('id');
            console.log(theId)
        })

    })
</script>

<style>
    /* 设置样式 */
    .sstyle {
        color: aqua;
    }
    .floor{
        margin-left: 400px;
        width: 1000px;
    }
    /* 楼层信息 */
    .floor_information{
        display: flex;
        height: 40px;
        width: 1000px;

        border: 1px solid;
    }
    .floor_information_add{
        margin-top: 4px;
        margin-left: 900px;
        width: 25px;
        height: 25px;
        text-align: center;
        background-color: aquamarine;
    }

    /* 层数新增 */
    .layer_add {
        display: inline-block;
        margin-top: 20px;
        width: auto; height: auto;
        border: 1px solid;
    }
    /* 新增 */
    .layer_information_add{
        display: inline-block;
        margin-left: 950px;
        width: 25px;
        height: 25px;
        text-align: center;
        background-color: aquamarine;

    }
    .layer_type_add{
        display: flex;
    }

    .first_layer{
        height: 40px;
        width: 1000px;
        margin-top: 10px;
        border: 1px solid;
        background-color: antiquewhite;
    }
    /* 层数删除 */
    .delete_layer{
        width: 20px;
        height: 20px;
        float: right;
        text-align: center;
        color: white;
        background-color: red;
    }
    /* 层数详细信息 */
    .layer_information{
        float: left;
        margin: 20px 20px;
        height: 120px;
        width: 180px;
        border: 1px solid;
    }

    .layer_information_i {
        /* float: left; */
        margin: 33px 20px;
        height: 120px;
        width: 180px;
        border: 1px solid;
    }
    /* input大小 */
    .common {
        margin-top: 10px;
        width: 80px;
    }
    .common_way{
        margin-top: 10px;
        width: 89px;
    }
</style>

