package book.service;

import book.bean.User;

import java.util.List;

/**
 * @description:BAM
 * @author:Nancy
 * @version:${VERSION}
 * @date:2018/8/28
 */
public interface IUserService {
    //添加用户
    boolean addUser(User user);

    //删除用户
    boolean moveUser(String accountname);

    //修改用户密码
    boolean alterUserPwd(User user);

    //修改用户个人信息
    boolean alterUserProfile(User user);

    //查看用户个人信息
    public User readUserProfile(String accountname);

    //登陆检查，根据账户名查找密码是否对应
    public User checkLogin(String accountname, String password);

    //列出所有用户
    List<User> findAllUser();
}
