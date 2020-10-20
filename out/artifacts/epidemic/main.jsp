<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 2020/10/13
  Time: 16:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>主页面</title>
    <jsp:include page="template/common.jsp"/>
</head>
<body>
<div class="container">
    <%--头部--%>
    <jsp:include page="template/top.jsp"/>

    <div class="row">
        <%--菜单--%>
        <jsp:include page="template/menu.jsp"/>

        <div class="col-md-9">
            <ul class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/main.jsp">主页</a></li>
                <li>数据录入</li>
            </ul>
        </div>

    </div>

</div>


<script src="${pageContext.request.contextPath}/bootstrap/js/jquery-1.11.2.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>
</body>
</html>
