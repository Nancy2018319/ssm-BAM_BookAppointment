<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>添加管理员</title>
</head>

<body>
	<center>
		<form action="registerAdmin.do" method="post">
			账号：<input type="text" name="accountname"><br/><br/>
			密码：<input type="text" name="password"><br/><br/>
			姓名：<input type="text" name="name"><br/><br/>
			性别：<select name="sex">
				<option value ='1'>男</option>
				<option value ='2'>女</option>
			    </select><br/><br/>
			电话：<input type="text" name="phone"><br/><br/>
			<input type="submit" value="添加">
		</form>
	</center>
</body>
</html>
