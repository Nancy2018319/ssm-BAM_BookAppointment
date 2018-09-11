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
    <title>预约记录</title>
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
            <h3>您的预约记录</h3>
        </div>
        <div class="panel-body">
            <table class="table table-hover">
                <thead>
                <tr>

                    <th>图书ID</th>
                    <th>图书名称</th>
                    <th>图书类型</th>
                    <th>预约时间</th>
                    <th>预约数量</th>
                    <th>预约状态</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${pageInfo.list}" var="sk">
                    <tr>
                        <td>${sk.book_id}</td>
                        <td>${sk.book.getBook_name()}</td>
                        <td>${sk.book.getBook_type()}</td>
                        <td>${sk.starttime}</td>
                        <td>1</td>
                        <td> <c:if test="${sk.status eq '0'}">已取消</c:if>
                            <c:if test="${sk.status eq '1'}">已预约</c:if>
                            <c:if test="${sk.status eq '2'}">已借入</c:if>
                            <c:if test="${sk.status eq '3'}">已归还</c:if>
                            <c:if test="${sk.status eq '4'}">已逾期</c:if>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <br>
            <br>
            <br>
            <br>
            <br>
            <center>${msg}</center>
            <br>
            <br>
            <br>
            <br>
            <br>
        </div>
    </div>
    <!--分页信息-->
    <div class="row">
        <%--分页文字信息--%>
        <div class="col-md-6">
            当前为第${pageInfo.pageNum}页，总共有${pageInfo.pages}页，共有${pageInfo.total}条记录
        </div>
        <%--	分页条--%>
        <div class="col-md-6">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li><a href="${pageContext.request.contextPath}/appoint.do?pn=1&&user_acname=${user.accountname}">首页</a></li>
                    <li>
                        <c:if test="${pageInfo.hasPreviousPage}">
                            <a href="${pageContext.request.contextPath}/appoint.do?pn=${pageInfo.pageNum-1}&&user_acname=${user.accountname}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </c:if>
                    </li>
                    <c:forEach items="${pageInfo.navigatepageNums}" var="page_num">
                        <c:if test="${page_num==pageInfo.pageNum}">
                            <li class="active"><a href="${pageContext.request.contextPath}/appoint.do?pn=${page_num}&&user_acname=${user.accountname}">${page_num}</a></li>
                        </c:if>
                        <c:if test="${page_num!=pageInfo.pageNum}">
                            <li><a href="${pageContext.request.contextPath}/appoint.do?pn=${page_num}&&user_acname=${user.accountname}">${page_num}</a></li>
                        </c:if>
                    </c:forEach>

                    <li>
                        <c:if test="${pageInfo.hasNextPage}">
                            <a href="${pageContext.request.contextPath}/appoint.do?pn=${pageInfo.pageNum+1}&&user_acname=${user.accountname}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </c:if>
                    </li>
                    <li><a href="${pageContext.request.contextPath}/appoint.do?pn=${pageInfo.pages}&&user_acname=${user.accountname}">末页</a></li>
                </ul>
            </nav>
        </div>
    </div>
</div>
<jsp:include page="/footer.jsp" />
</body>
</html>
