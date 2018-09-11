# ssm-BAM_BookAppointment
整合SSM框架：SpringMVC + Spring + MyBatis（图书预约系统）


这个系统暂时只有用户前台模块，首页设计以及后台管理员模块将在后续开发，后期也会延展到用户预约后借书还书模块等。现在我们就来看看已完成的内容的效果：
首先在这里友情提示下载了的朋友，在成功导入项目后，配置tomcat时URLl按着下图填写（呜呜呜，因为没想好首页写啥，就这样子啦）

![Image](https://github.com/Nancy2018319/ssm-BAM_BookAppointment/blob/master/src/main/resources/imgForGit/1.0.PNG)

项目运行起来，如下图为图书预约系统的书库页面（暂定首页），不用登陆即可查看、搜索系统已有图书。

![Image](https://github.com/Nancy2018319/ssm-BAM_BookAppointment/blob/master/src/main/resources/imgForGit/1.1.PNG)

在注册时，账号名不可重复，若该账号名已存在，会注册失败并有提示信息。注册成功后登录

![Image](https://github.com/Nancy2018319/ssm-BAM_BookAppointment/blob/master/src/main/resources/imgForGit/1.2.PNG)

在书库中点击详情进入预约界面，点击预约按钮进行预约，此时若没有登录的话会被拦截跳转到登录页面，提示用户登录。这里的登录信息保存在session中，
关闭路径窗口后才失效。预约成功页面

![Image](https://github.com/Nancy2018319/ssm-BAM_BookAppointment/blob/master/src/main/resources/imgForGit/1.4.PNG)


当图书库存为0时，预约失败页面

![Image](https://github.com/Nancy2018319/ssm-BAM_BookAppointment/blob/master/src/main/resources/imgForGit/1.6.PNG)


同一用户重复预约同一本图书时，提示信息

![Image](https://github.com/Nancy2018319/ssm-BAM_BookAppointment/blob/master/src/main/resources/imgForGit/1.5.PNG)

预约图书成功后可在已预约列表里取消预约，同时限定用户在预约后5天内借走书籍，否则预约失效。

![Image](https://github.com/Nancy2018319/ssm-BAM_BookAppointment/blob/master/src/main/resources/imgForGit/1.7.PNG)


