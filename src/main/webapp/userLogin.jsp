<%--
  Created by IntelliJ IDEA.
  User: TIANYANZHI
  Date: 2018/8/11 0011
  Time: 23:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>用户登陆</title>
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="${pageContext.request.contextPath}/js/jquery-3.0.0.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>
</head>
<body>
<div style="background: url(img/login.jpg);height: 100%;" class="jumbotron">
<div class="row"><h1>&nbsp;</h1></div>
<div style="height: 500px;" class="container">
    <div class="container">
        <div class="center-block">
            <div class="col-xs-12 col-sm-6 col-md-5">
                <div class="panel panel-default">
                    <div class="panel-heading text-center">
                        <h3 class="panel-title" align="center"><big>用户登陆</big></h3>
                    </div>
                    <div class="panel-body">
                        <form class="form-horizontal" action="${pageContext.request.contextPath}/userCheckLogin.do" method="post">
                            <div class="form-group">
                                <label for="input1" class="col-sm-2 control-label" style="color:#313335;">账号</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="input1" name="accountname" required placeholder="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="input2" class="col-sm-2 control-label" style="color:#313335;">密码</label>
                                <div class="col-sm-10">
                                    <input type="password" class="form-control" id="input2" name="password" required placeholder="">
                                </div>
                            </div>
                            <div class="form-group">
                            <div class="col-sm-offset-5 col-sm-10">
                                <button type="submit" class="btn btn-default">登陆</button>
                            </div>
                                <div class="col-sm-offset-9 col-sm-10">
                                    返回<a href="${pageContext.request.contextPath}/selectAllBooks.do">书库</a>
                                </div>
                        </div>
                            <center>${msg}</center>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<jsp:include page="/footer.jsp" />
</body>

</html>
