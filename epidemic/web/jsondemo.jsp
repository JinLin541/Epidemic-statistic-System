<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>json</title>
    <script src="bootstrap/js/jquery-1.11.2.js" type="application/javascript"></script>
</head>
<body>
<button>运行</button>
</body>
</html>
<script>
    $(function () {
        /*对象*/
        var person = {"name":"admin","age":"18","email":"78787878@qq.com"};

        var json2 = {"persons":
                [
                    {"name":"旺财","age":10,"gender":true},
                    {"name":"李四","age":100,"gender":false},
                    {"name":"李四","age":20,"gender":false}
                ]
        };
        $("button").click(function () {
            for(var key in person){
                alert("key:"+key+"---"+person[key]);
            }
            //alert(person.name);
            //alert(person["name"]);
            //alert(json2.persons);
            //console.info(json2.persons[0].name);
        });
    });


</script>
