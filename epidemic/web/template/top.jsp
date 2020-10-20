<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="row" style="background: #026CC4;margin-bottom: 80px;">
    <div class="col-md-6 logo">疫情数据发布系统</div>
    <div class="col-md-3 col-md-offset-3" style="height: 79px;line-height: 79px;">
        <span style="color: white;">欢迎您：</span><strong style="color: yellow;">${loginedUser.userName}&nbsp;&nbsp;</strong>
        <a href="${pageContext.request.contextPath}/user/loginOut" class="btn btn-primary btn-danger">注销</a>
    </div>
</div>
