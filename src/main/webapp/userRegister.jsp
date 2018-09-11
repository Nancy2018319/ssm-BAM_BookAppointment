<%--
  Created by IntelliJ IDEA.
  User: TIANYANZHI
  Date: 2018/8/11 0011
  Time: 23:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>用户注册</title>
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="${pageContext.request.contextPath}/js/jquery-3.0.0.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>
</head>
<body>
<div style="background: url(img/register3.jpg);height: 100%;" class="jumbotron">
    <div class="row"><h1>&nbsp;</h1></div>
    <div style="height: 500px;" class="container">
        <div class="center-block">

            <div class="col-xs-12 col-sm-6 col-md-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title" align="center"><big>用户注册</big></h3>
                    </div>
                    <div class="panel-body">
                        <form name="resform" class="form-horizontal" action="${pageContext.request.contextPath}/addUser.do" method="post">
                            <div class="form-group">
                                <label for="input1" class="col-sm-2 control-label" style="color:#313335;">账号</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="input1" name="accountname" required placeholder="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="input2" class="col-sm-2 control-label" style="color:#313335;">密码</label>
                                <div class="col-sm-10">
                                    <input type="password" class="form-control" id="input2" name="password" required pattern="^\w{3,20}$" minlength="6" maxlength="12" placeholder="6-12位数字与字母的结合">
                                </div>
                            </div>
                            <%--<div class="form-group">--%>
                                <%--<label for="input3" class="col-sm-2 control-label" style="color:#313335;">确认密码</label>--%>
                                <%--<div class="col-sm-10">--%>
                                    <%--<input type="password" class="form-control" id="input3" required pattern="^\w{3,20}$" minlength="6" maxlength="12" placeholder="6-12位数字与字母的结合">--%>
                                <%--</div>--%>
                            <%--</div>--%>
                            <div class="form-group">
                                <label for="input4" class="col-sm-2 control-label" style="color:#313335;">您的姓名</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="input4" name="name" required placeholder="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" style="color:#313335;">性别</label>
                                <div class="col-sm-10">
                                    <div class="radio3 radio-check radio-success radio-inline">
                                        <input type="radio" id="radio4" name="sex" required value="1">
                                        <label for="radio4">
                                            男
                                        </label>
                                    </div>
                                    <div class="radio3 radio-check radio-success radio-inline">
                                        <input type="radio" id="radio5" name="sex" value="2">
                                        <label for="radio5">
                                            女
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="input6" class="col-sm-2 control-label" style="color:#313335;">电话</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="input6" name="phone" required placeholder="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="input8" class="col-sm-2 control-label" style="color:#313335;">身份证号</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="input8" name="idnumber" required placeholder="">
                                </div>
                            </div>

                            <div class="form-group ">
                                <div class="col-sm-offset-5 col-sm-10">
                                    <button type="submit" class="btn btn-default" >注册</button>
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
<jsp:include page="/footer.jsp" />
</body>
<%--<script type="text/javascript">--%>
    <%--function docheckpwd(){--%>
        <%--var p1=$("#input2").val();//获取密码框的值--%>
        <%--var p2=$("#input3").val();//获取重新输入的密码值--%>
        <%--if(p1!=p2){//判断两次输入的值是否一致，不一致则显示错误信息--%>
            <%--alert("两次密码不一致！");--%>
            <%--resform.password.focus() ;--%>
            <%--return false;--%>
        <%--}else if(resform.password.value.length<6){--%>
            <%--alert("位数不能少于6位");--%>
            <%--resform.password.focus() ;--%>
            <%--return false;--%>
        <%--}--%>
        <%--else{--%>
            <%--alert("注册成功");//密码一致，可以继续下一步操作--%>
            <%--return true;--%>
        <%--}--%>
    <%--}--%>
<%--</script>--%>
</html>
