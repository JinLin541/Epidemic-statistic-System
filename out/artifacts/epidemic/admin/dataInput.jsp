<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>bootstrap</title>
    <jsp:include page="../template/common.jsp"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/datepicker/bootstrap-datepicker3.css">
    <link rel="stylesheet" href="../css/common.css">
</head>
<body>
<div class="container">
    <%--头部--%>
    <jsp:include page="../template/top.jsp"/>

    <div class="row">
        <%--菜单--%>
        <jsp:include page="../template/menu.jsp"/>

        <div class="col-md-9">
            <ul class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/main.jsp">主页</a></li>
                <li>数据录入</li>
            </ul>
            <div class="row">
                <div class="col-md-4">
                    <div class="input-group date" id="datepicker" data-date-format="yyyy-mm-dd">
                        <div class="input-group-addon">数据日期：</div>
                        <input class="form-control" size="16" type="text" value="" readonly id="dataDate">
                        <div class="input-group-addon"><span class="add-on glyphicon glyphicon-calendar"></span></div>
                    </div>
                </div>
                <div class="col-md-4">
                    <button type="button" class="btn btn-primary" id="btnSubmit">提交 <span
                            class="glyphicon glyphicon-log-in"></span></button>
                </div>
            </div>
            <br/>
            <div class="row">
                <table class="table table-condensed table-bordered table-striped table-hover">
                    <thead>
                    <tr>
                        <th>省份</th>
                        <th>确诊人数</th>
                        <th>疑似人数</th>
                        <th>隔离人数</th>
                        <th>治愈人数</th>
                        <th>死亡人数</th>
                    </tr>
                    </thead>
                    <tbody id="body1">
                    <tr>
                        <td>湖北</td>
                        <td><input type="text" name="affirmed" size="4" maxlength="4" class="form-control"/></td>
                        <td><input type="text" name="suspected" size="4" maxlength="4" class="form-control"/></td>
                        <td><input type="text" name="isolated" size="4" maxlength="4" class="form-control"/></td>
                        <td><input type="text" name="cured" size="4" maxlength="4" class="form-control"/></td>
                        <td><input type="text" name="dead" size="4" maxlength="4" class="form-control"/></td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="row">
                <div id="msg"></div>
            </div>
        </div>

    </div>

</div>


<script src="${pageContext.request.contextPath}/bootstrap/js/jquery-1.11.2.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/datepicker/bootstrap-datepicker.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/datepicker/bootstrap-datepicker.zh-CN.min.js"></script>
</body>
</html>

<script>
    var provinces;  //存储所有的省份信息
    //解决中文乱码问题
    $.fn.datepicker.dates['zh-CN'] = {
        days: ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六", "星期日"],
        daysShort: ["周日", "周一", "周二", "周三", "周四", "周五", "周六", "周日"],
        daysMin:  ["日", "一", "二", "三", "四", "五", "六", "日"],
        months: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
        monthsShort: ["1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月"],
        today: "今天",
        suffix: [],
        meridiem: ["上午", "下午"]};

    $(function () {
        //找到日历控件
        var datePicker = $("#datepicker");
        datePicker.datepicker({language: 'zh-CN', autoclose: 'true'});  //初始化
        datePicker.datepicker("setDate", new Date());
        var currentTime = new Date();  //当前日期
        var date1 = new Date();
        date1.setDate(currentTime.getDate() - 7);  //把时间往前推了一周
        datePicker.datepicker("setStartDate", date1);  //设置日期控件的开始时间
        datePicker.datepicker("setEndDate", currentTime); //设置结束时间点

        //给日历控制一个事件，当日期发生改变的时候触发
        datePicker.datepicker().on("changeDate",loadProvincesData);

        loadProvincesData();

        //提交事件
        $("#btnSubmit").click(checkAndSubmitData);
    });

    //检查录入数据的合法性并且提交数据
    function checkAndSubmitData() {
        var valid = true; //标记录入的数据是否合法
        var affirmed = $("input[name=affirmed]");
        var suspected = $("input[name=suspected]");
        var isolated = $("input[name=isolated]");
        var cured = $("input[name=cured]");
        var dead = $("input[name=dead]");
        //遍历affirmed
        $.each(affirmed,function (index, element) {
            if(isNaN(Number(element.value))){
                valid = false;
            }
        })

        $.each(suspected,function (index, element) {
            if(isNaN(Number(element.value))){
                valid = false;
            }
        })

        $.each(isolated,function (index, element) {
            if(isNaN(Number(element.value))){
                valid = false;
            }
        })

        $.each(cured,function (index, element) {
            if(isNaN(Number(element.value))){
                valid = false;
            }
        })

        $.each(dead,function (index, element) {
            if(isNaN(Number(element.value))){
                valid = false;
            }
        })

        if(valid){  //说明录入的数据是合法的
            var dataArray=[];  //创建一个数组
            //遍历这6个省份
            for (var i = 0; i < provinces.length; i++) {
                var obj={}; //新建了一个对象
                obj.provinceId = provinces[i].provinceId;
                obj.affirmed = affirmed[i].value;
                obj.suspected = suspected[i].value;
                obj.isolated = isolated[i].value;
                obj.cured = cured[i].value;
                obj.dead = dead[i].value;
                dataArray.push(obj); //把封闭好的对象追加在数组当中
            }

            //获取当前选中的日期
            var date = $("#dataDate").val();
            var data={};  //再新建一个对象
            data.date = date;
            data.arrayData = dataArray;
            console.info(data);
            $.ajax({
                url:"${pageContext.request.contextPath}/epidemicData/ajax/input",
                contentType:"application/json;charset=utf-8",
                type:"post",
                data:JSON.stringify(data),
                dataType:"json",
                success:function (resp) {
                    if(resp.code<0){
                        alert(resp.msg);
                    }else{
                        fillProvinceToTable(resp.data); //如果保存成功之后，除了把数据保存到数据库epidemic表当中，还要生成新的没有录入过的6个省份信息
                    }
                }
            });
        }else{
            alert("请检查你录入的数据，确保是一个正确的数值！");
        }

    }

    function loadProvincesData() {
        $("#msg").html("");//清空内容
        var date = $("#dataDate").val();
        $.get("${pageContext.request.contextPath}/province/ajax/noDataList",{date:date},function (resp) {
            console.info(resp);
            if(resp.code<0){
                alert(resp.msg);
            }else{
                fillProvinceToTable(resp.data);
            }
        },"json");
    }

    //填充省份数据到表格中
    function fillProvinceToTable(array) {
        //清空表格,把旧的数据清空掉
        var body1=$("#body1");
        body1.empty();

        if(array!=null&&array.length>0){
            provinces = array;
            for (var i = 0; i < array.length; i++) {
                var tr = $("<tr>");
                var td=$("<td>");
                td.text(array[i].provinceName);
                tr.append(td);

                td=$("<td>");
                td.html('<input type="text" name="affirmed" size="4" maxlength="4" class="form-control" value="0"/>');
                tr.append(td);

                td=$("<td>");
                td.html('<input type="text" name="suspected" size="4" maxlength="4" class="form-control" value="0"/>');
                tr.append(td);

                td=$("<td>");
                td.html('<input type="text" name="isolated" size="4" maxlength="4" class="form-control" value="0"/>');
                tr.append(td);

                td=$("<td>");
                td.html('<input type="text" name="cured" size="4" maxlength="4" class="form-control"  value="0"/>');
                tr.append(td);

                td=$("<td>");
                td.html('<input type="text" name="dead" size="4" maxlength="4" class="form-control"  value="0"/>');
                tr.append(td);
                body1.append(tr);
            }
        }else{
            $("#msg").html("当日的所有省份的数据都已经录入完了！");
        }
    }
</script>
