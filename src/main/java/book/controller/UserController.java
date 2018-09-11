package book.controller;

import book.bean.User;
import book.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @description:BAM
 * @author:Nancy
 * @version:${VERSION}
 * @date:2018/8/28
 */
@Controller
public class UserController {
    @Autowired
    @Qualifier("userService")
    private IUserService userService;

    public IUserService getUserService() {
        return userService;
    }

    public void setUserService(IUserService userService) {
        this.userService = userService;
    }

    /***********************************用户注册********************************/
    @RequestMapping("/addUser.do")
    public String doaddUser(User user, Model model) {
        int flag = 0;
        List<User> users = userService.findAllUser();
        if (users != null) {
            for (User it : users) {
                if (it.getAccountname().equals(user.getAccountname())) {
                    flag = 1;
                    break;
                }
            }
        }
        if (flag == 1) {
            model.addAttribute("msg", "注册失败，该账号已存在");
            return "/userRegister.jsp";
        } else {
            if (userService.addUser(user)) {
                model.addAttribute("msg", "注册成功，请登录或返回书库");
                return "userLogin.jsp";
            } else
                model.addAttribute("msg", "注册失败，请重新注册");
            return "/userRegister.jsp";
        }
    }
    /***********************************用户注册*********************************/


    /***********************************用户登陆*********************************/
    @RequestMapping("/userLogin.do")
    public String login() {
        return "redirect:selectAllBooks.do";
    }

    @RequestMapping("/userCheckLogin.do")
    public String checkLogin(User user, Model model, HttpSession session) {

        user = userService.checkLogin(user.getAccountname(), user.getPassword());
        if (user != null) {
            session.setAttribute("user", user);
            model.addAttribute("user", user);
            return "redirect:selectAllBooks.do";
        }
        model.addAttribute("msg", "用户名或密码错误，请重新登录！");
        return "userLogin.jsp";
    }

    @RequestMapping("/outLogin.do")
    public String outLogin(HttpSession session) {
        session.invalidate();
        return "redirect:userLogin.do";
    }
/***********************************用户登陆*****************2*****************/
}