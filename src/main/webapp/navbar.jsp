<%--
  Created by IntelliJ IDEA.
  User: TIANYANZHI
  Date: 2018/8/12 0012
  Time: 9:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<nav class="navbar navbar-default  navbar-top">
    <div class="container-fluid">
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="${pageContext.request.contextPath}/selectAllBooks.do">BAM</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <ul class="nav navbar-nav navbar-right">
                <li><a href="${pageContext.request.contextPath}/selectAllBooks.do">书库</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">我的预约 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="${pageContext.request.contextPath}/appoint.do?user_acname=${user.accountname}">所有记录</a></li>
                        <li><a href="${pageContext.request.contextPath}/showOrdersByStaAndName.do?user_acname=${user.accountname}&status=1">已预约</a></li>
                        <li><a href="${pageContext.request.contextPath}/showOrdersByStaAndName.do?user_acname=${user.accountname}&status=0">已取消</a></li>
                        <li><a href="${pageContext.request.contextPath}/showOrdersByStaAndName.do?user_acname=${user.accountname}&status=2">已借入</a></li>
                        <li><a href="${pageContext.request.contextPath}/showOrdersByStaAndName.do?user_acname=${user.accountname}&status=3">已归还</a></li>
                        <li><a href="${pageContext.request.contextPath}/showOrdersByStaAndName.do?user_acname=${user.accountname}&status=4">已逾期</a></li>

                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${user.accountname} <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <%--该功能暂未实现--%>
                        <%--<li><a href="${pageContext.request.contextPath}/jumpShowUser.do">个人信息</a></li>--%>
                        <li role="separator" class="divider"></li>
                        <li><a href="${pageContext.request.contextPath}/outLogin.do">退出</a></li>
                    </ul>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>















