package book.dao;

import book.bean.User;

import java.util.List;

/**
 * @description:BAM
 * @author:Nancy
 * @version:${VERSION}
 * @date:2018/8/28
 */
public interface IUserDao {
    //添加一个用户
    int insertUser(User user);

    //删除用户
    int deleteUser(String accountname);

    //修改密码
    int updateUserPwd(User user);

    //修改用户个人信息
    int updateUserProfile(User user);

    //查看用户个人信息
    User showUserProfile(String accountname);

    //登陆的实现，根据账户名查找密码
    User selectUserByAcname(String accountname);

    //列出所有用户，管理员功能
    List<User> selectAllUser();


}
