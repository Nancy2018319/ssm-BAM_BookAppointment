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
    <%--jQuery Cookie操作插件--%>
    <script src="http://cdn.bootcss.com/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
    <%--jQuery countDown倒计时插件--%>
    <script src="http://cdn.bootcss.com/jquery.countdown/2.1.0/jquery.countdown.min.js"></script>
    <title>预约详情页</title>
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
            <h3>图书详情</h3>
        </div>
        <div class="panel-body">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>图书ID</th>
                    <th>图书名称</th>
                    <th>馆藏数量</th>
                    <th>图书简介</th>
                </tr>
                </thead>
                <tbody>

                    <tr>
                        <td>${book.id}</td>
                        <td>${book.book_name}</td>
                        <td>${book.book_number}</td>
                        <td>${book.book_text}</td>
                    </tr>
                </tbody>
            </table>
            <br>
            <br>
            <br>
            <br>
        </div>
        <div class="panel-body text-center">
                            <form class="form-horizontal" action="${pageContext.request.contextPath}/inserOrder.do?book_number=${book.book_number}&book_id=${book.id}" method="post">
                                <input type="hidden" name="user_acname" value="${user.accountname}">
                                <input type="hidden" name="book_id" value="${book.id}">
                                <input type="hidden" name="starttime" value=${startDate}>
                                <input type="hidden" name="finishtime" value="${finishDate}">
                                <input type="hidden" name="status" value=1>
                                <input type="submit" class="btn btn-info"value="预约">
                                <%--<c:if test="${empty book.book_number}">--%>
                                  <%--<script type="application/javascript">--%>
                                      <%--alert("预约失败，库存不足");--%>
                                   <%--</script>--%>
                                <%--</c:if>--%>
                                <center>${msgn}</center>
                            </form>
     </div>
        <br>
    </div>
</div>
</body>
<jsp:include page="/footer.jsp" />
</html>
