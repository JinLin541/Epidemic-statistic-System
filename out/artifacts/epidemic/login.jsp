<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>登录页面</title>
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css" rel="stylesheet">

    <!--[if lt IE 9]>
    <script src="${pageContext.request.contextPath}/bootstrap/js/html5shiv.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/respond.js"></script>
    <![endif]-->
</head>
<body>
<div class="container">
    <div class = "row">
        <div class = "col-md-8">
            <div style="height: 100px">

            </div>



        </div>


        <div class = "col-md-4">
            <div style="height: 100px"></div>
            <h1 class = "text">
                登录查看疫情数据
            </h1>
                <br/>
                <form action="${pageContext.request.contextPath}/user/login" method="post" >
                    账号：<input type="text" name="userAccount" class = "form-control" style = "width:20em"  /><br/>
                    密码：<input type="password" name="userPassword" class="form-control" style = "width:20em" /><br/>
                    <br/>
                    <button type="submit" class = "btn btn-primary" style="width: 20em">LOGIN</button>
                </form>

            <br/>

                <%--当if中的test返回true的时候，提示框里的内容才会显示出来，否则提示框就不会显示出来--%>
                <c:if test="${not empty msg}">
                    <div class="col-md-12">
                        <div class="alert alert-warning alert-dismissible">
                            <button type="button" class="close" data-dismiss="alert"><span>&times;</span></button>
                            <strong> ${msg}</strong>
                        </div>
                    </div>
                </c:if>

            </div>
    </div>

</div>

<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="${pageContext.request.contextPath}/bootstrap/js/jquery-1.11.2.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>
</body>
</html>
