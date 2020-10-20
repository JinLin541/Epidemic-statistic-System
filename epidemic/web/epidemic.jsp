<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>疫情信息</title>
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="row" style="height: 600px;background-color: #fff;">
            <div class="col-md-12" id="myMap" style="height: 600px;" >

            </div>
    </div>
    <div class="row" style="height: 500px;background-color: #fff;overflow: auto;margin-bottom: 5px;margin-top: 5px;">
        <div class="col-md-12">
            <table class="table table-hover table-striped table-bordered" data-toggle="table">
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
                <tbody id="tbody1">
                </tbody>
            </table>
        </div>
    </div>
    <div class="row" style="height: 500px;background-color: #fff;border: solid 1px gray;">
            <div class="col-md-12" id="myEchats" style="height: 500px;">

            </div>
    </div>
    <div class="row">
        <a href="login.jsp">登录</a>
    </div>
</div>


</body>
</html>
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="${pageContext.request.contextPath}/bootstrap/js/jquery-1.11.2.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>
<%--加载echarts的js文件--%>
<script src="${pageContext.request.contextPath}/Echarts/echarts.js"></script>

<script>

    $(function () {
        var myMap;  //中国地图
        $.get("${pageContext.request.contextPath}/epidemicData/ajax/getLastData",{},function (resp) {
            if(resp.code<0){
                alert(resp.msg);
            }else{
                console.info(resp.data);
                fillDataToTable(resp.data);
                fillChatsData(resp.data);
                fillToMap(resp.data);

            }
        },"json");


        //加载中国地图
        var myMap = echarts.init($("#myMap").get(0));
        //获取地图json数据，显示中国地图china
        $.getJSON("${pageContext.request.contextPath}/Echarts/china.json", {}, function (chinaJson) {
            echarts.registerMap("china", chinaJson);
            var option = {
                title: {
                    text: "2020-10-20 全国疫情分布图"
                },
                legend: {
                    data: ["累计确诊人数"]
                },
                tooltip: {},
                visualMap: {
                    type: 'piecewise',
                    min: 0,
                    max: 10000,
                    splitList:
                        [{
                            start: 1000,
                            end: 10000
                        }, {
                            start: 500,
                            end: 1000
                        }, {
                            start: 100,
                            end: 500
                        }, {
                            start: 0,
                            end: 100
                        }],
                    textStyle:
                        {
                            color: 'orange'
                        }
                },
                series: [
                    {
                        name: '累计确诊人数',
                        type: 'map',
                        mapType: 'china',
                        data: []
                    }
                ]
            };
            myMap.setOption(option);
        }, "json");
        //将数据填充到地图中
        function fillToMap(epidemics) {
            var data = [];
            $.each(epidemics, function (index, epidemic) {
                var obj = {};
                obj.name = epidemic.provinceName;
                obj.value = epidemic.affirmedTotal;
                data.push(obj);
            });
            myMap.setOption({
                series: [
                    {
                        name: '累计确诊人数',
                        type: 'map',
                        mapType: 'china',
                        data: data
                    }
                ]
            });
        };


        function fillChatsData(data) {
            var provinceArray=[];
            var affiredData=[];
            $.each(data,function (index,cdata) {
                provinceArray.push(cdata.provinceName);
                affiredData.push(cdata.affirmedTotal);
            })
            myChart.setOption({
                xAxis: {
                    data: provinceArray
                },
                series: [{
                    name: '确诊人数',
                    data: affiredData
                }]
            });
        }


        //初始化一个echats的实例
        var myChart = echarts.init($("#myEchats").get(0)); //$("#myEchats").get(0):把jquery对象转换成js对象
        //设置参数
        var option =  {
            title: {
                text: '当日疫情数据'
            },
            // 提示框
            tooltip: {},
            // 图例，单击后可隐藏对应的系列
            legend: {
                data:['确诊人数']
            },
            // X 轴上的类目名称数组
            xAxis: {
                data: []
            },
            // Y 轴
            yAxis: {},
            //series 值是一个数组。
            series: [{
                name: '2020-10-20',
                type: 'bar',
            // 和 xAxis.data 定义的类目对应的数值
                data: []
            }]
        };
        // 将配置项和数据设置到 echarts 实例中，就会显示图表
        myChart.setOption(option);
    });

    function fillDataToTable(epidemics) {
        var tbody1 = $("#tbody1");
        tbody1.empty();
        $.each(epidemics,function (index, epidemic) {
            var tr = $("<tr>");
            var td=$("<td>");
            td.text(epidemic.provinceName);
            tr.append(td);

            td=$("<td>");
            td.html(""+epidemic.affirmedTotal+"<span class='small'>+"+epidemic.affirmed+"</span>");
            tr.append(td);

            td=$("<td>");
            td.html(""+epidemic.suspectedTotal+"<span class='small'>+"+epidemic.suspected+"</span>");
            tr.append(td);

            td=$("<td>");
            td.html(""+epidemic.isolatedTotal+"<span class='small'>+"+epidemic.isolated+"</span>");
            tr.append(td);

            td=$("<td>");
            td.html(""+epidemic.curedTotal+"<span class='small'>+"+epidemic.cured+"</span>");
            tr.append(td);

            td=$("<td>");
            td.html(""+epidemic.deadTotal+"<span class='small'>+"+epidemic.dead+"</span>");
            tr.append(td);

            tbody1.append(tr);
        })
    }
</script>
