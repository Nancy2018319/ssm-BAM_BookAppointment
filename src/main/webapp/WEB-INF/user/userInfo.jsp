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
    <title>个人中心</title>
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="${pageContext.request.contextPath}/js/jquery-3.0.0.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>
</head>
<body>
<%--引入导航条--%>
<c:if test="${!empty user.accountname}"><jsp:include page="/navbar.jsp" /></c:if>
<c:if test="${empty user.accountname}"><jsp:include page="/navbarLess.jsp" /></c:if>
<br>
<br>
<div class="jumbotron">
    <div style="height: 500px;" class="container">
        <div class="panel panel-default">
            <!-- Default panel contents -->
            <div class="panel-heading"><big>个人信息</big></div>
            <%--<div class="panel-body">
                <p>...</p>
            </div>--%>
            <!-- List group -->
            <ul class="list-group">
                <li class="list-group-item">账号：<strong>&nbsp;${user.accountname}</strong></li>
                <li class="list-group-item">姓名：<strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${user.name}</strong></li>
                <li class="list-group-item">性别：<strong>&nbsp;&nbsp;&nbsp;&nbsp;
                    <c:if test="${user.sex eq '1'}">男</c:if>
                    <c:if test="${user.sex eq '2'}">女</c:if></strong>
                </li>
                <li class="list-group-item">身份证：<strong>&nbsp;${user.idnumber}</strong></li>
                <li class="list-group-item">电话：<strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${user.phone}</strong></li>

            </ul>
        </div>
        <div class="btn-group" role="group" aria-label="...">
            <button type="button" class="btn btn-default" data-toggle="modal" data-target="#modalPrimary">修改密码</button>
            <button type="button" class="btn btn-default" data-toggle="modal" data-target="#modalPrimary2">修改个人信息</button>

        </div>
    </div>
</div>
<!-- Modal1 -->
<div class="modal fade modal-primary" id="modalPrimary" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">更改密码</h4>
            </div>
            <div class="modal-body">
                <%--<iframe src="${pageContext.request.contextPath}/jumpUpAdPwd.do" width="100%" height="50%" scrolling="no" frameborder="0"> </iframe>--%>
                <form class="form-horizontal" action="updateUserPwd.do" method="post">
                    <div class="form-group">
                        <label for="inputPassword2" class="col-sm-2 control-label">新密码</label>
                        <div class="col-sm-10">
                            <input type="hidden" name="accountname" value=${user.accountname}>
                            <input type="password" class="form-control" name="password" id="inputPassword2" required pattern="^\w{3,20}$" minlength="6" maxlength="12" placeholder="6-12位数字与字母的结合">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">确认密码</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="inputPassword3" required pattern="^\w{3,20}$" minlength="6" maxlength="12" placeholder="6-12位数字与字母的结合">
                        </div>
                    </div>
                    <div id="msg" style="color:red;"></div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-primary" onclick="return checkpwd()">确认修改</button>&nbsp;&nbsp;*更改密码后需要重新登陆
                        </div>
                    </div>
                </form>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Modal2 -->
<div class="modal fade modal-primary" id="modalPrimary2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel2">修改个人信息</h4>
            </div>
            <div class="modal-body">
                <%--<iframe src="${pageContext.request.contextPath}/jumpUpAdPf.do" width="100%" height="50%" scrolling="no" frameborder="0"> </iframe>--%>
                <form class="form-horizontal" action="updateUserProfile.do" method="post">
                    <div class="form-group">
                        <label for="inputName" class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <input type="hidden" name="accountname" value=${user.accountname}>
                            <input type="text" name="name" class="form-control" id="inputName" required placeholder="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <div class="radio3 radio-check radio-success radio-inline">
                                <input type="radio" id="radio4" name="sex" required value="1">
                                <label for="radio4">
                                    男
                                </label>
                            </div>
                            <div class="radio3 radio-check radio-success radio-inline">
                                <input type="radio" id="radio5" name="sex" value="0">
                                <label for="radio5">
                                    女
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPhone" class="col-sm-2 control-label">电话</label>
                        <div class="col-sm-10">
                            <input type="text" name="phone" class="form-control" id="inputPhone" required placeholder="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputID" class="col-sm-2 control-label">身份证</label>
                        <div class="col-sm-10">
                            <input type="text" name="idnumber" class="form-control" id="inputID" required placeholder="">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-primary">确认修改</button>&nbsp;&nbsp;
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

</body>
<script type="text/javascript">
    function checkpwd(){
        var p1=$("#inputPassword2").val();//获取密码框的值
        var p2=$("#inputPassword3").val();//获取重新输入的密码值
        if(p1!=p2){//判断两次输入的值是否一致，不一致则显示错误信息
            alert("两次密码不一致！");
            return false;
        }else{
            //密码一致，可以继续下一步操作
        }
    }
</script>
</html>