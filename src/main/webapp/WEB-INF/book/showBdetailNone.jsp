<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="${pageContext.request.contextPath}/js/jquery-3.0.0.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>
    <%@ page isELIgnored="false" %>
    <title>图书列表</title>
</head>

<body>
<%--引入导航条--%>
<c:if test="${!empty user.accountname}"><jsp:include page="/navbar.jsp" /></c:if>
<c:if test="${empty user.accountname}"><jsp:include page="/navbarLess.jsp" /></c:if>

<br>
<br>
<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading text-center">
            <h3>图书列表</h3>
        </div>
        <div class="panel-body">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>图书ID</th>
                    <th>图书名称</th>
                    <th>图书类型</th>
                    <th>出版社</th>
                    <th>图书价格</th>
                    <th>出版时间</th>
                    <th>馆藏数量</th>
                    <th>详细</th>
                </tr>
                </thead>
            </table>
             <br>
            <br>
            <br>
            <br>
            <br>
            <center>查无此书，请重新检索哦！</center>
            <br>
            <br>
            <br>
            <br>
            <br>
        </div>
    </div>
</div>
<jsp:include page="/footer.jsp" />
</body>
</html>
