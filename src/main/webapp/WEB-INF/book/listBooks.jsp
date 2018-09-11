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
        <form name="firstForm" action="<%= request.getContextPath()%>/selectBbyName.do" method="post">
            <div class="panel-heading ">
                <table class="table table-bookName">
                    <thead>
                    <tr>
                        <th width="90" align="lift">图书名称</th>
                        <th width="150" align="lift">
                            <input type="text" name="book_name" class="allInput" placeholder="输入检索书名^o^" />

                        </th>
                        <th>
                            <input type="submit" id="tabSub" value="检索" />
                        </th>
                    </tr>
                    </thead>
                </table>
            </div>

        </form>


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
                <tbody>
                <c:forEach items="${pageInfo.list}" var="books">
                    <tr>
                        <td>${books.id}</td>
                        <td>${books.book_name}</td>
                        <td>${books.book_type}</td>
                        <td>${books.book_publish}</td>
                        <td>${books.book_price}</td>
                        <td>${books.book_newtime}</td>
                        <td>${books.book_number}</td>
                        <td><a class="btn btn-info" href="${pageContext.request.contextPath}/showBookDetail.do?id=${books.id}">详细</a></td>
                    </tr>
                </c:forEach>
                </tbody>

            </table>
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
                    <li><a href="${pageContext.request.contextPath}/selectAllBooks.do?pn=1">首页</a></li>
                    <li>
                        <c:if test="${pageInfo.hasPreviousPage}">
                            <a href="${pageContext.request.contextPath}/selectAllBooks.do?pn=${pageInfo.pageNum-1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </c:if>
                    </li>
                    <c:forEach items="${pageInfo.navigatepageNums}" var="page_num">
                        <c:if test="${page_num==pageInfo.pageNum}">
                            <li class="active"><a href="${pageContext.request.contextPath}/selectAllBooks.do?pn=${page_num}">${page_num}</a></li>
                        </c:if>
                        <c:if test="${page_num!=pageInfo.pageNum}">
                            <li><a href="${pageContext.request.contextPath}/selectAllBooks.do?pn=${page_num}">${page_num}</a></li>
                        </c:if>
                    </c:forEach>

                    <li>
                        <c:if test="${pageInfo.hasNextPage}">
                            <a href="${pageContext.request.contextPath}/selectAllBooks.do?pn=${pageInfo.pageNum+1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </c:if>
                    </li>
                    <li><a href="${pageContext.request.contextPath}/selectAllBooks.do?pn=${pageInfo.pages}">末页</a></li>
                </ul>
            </nav>
        </div>

    </div>

</div>
<jsp:include page="/footer.jsp" />
</body>
</html>
