package book.controller;

import book.bean.Admin;
import book.service.IAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @description:BAM
 * @author:Nancy
 * @version:${VERSION}
 * @date:2018/8/25
 */
/*后台管理模块，暂未实现*/
@Controller
public class AdminController {
    @Autowired
    @Qualifier("adminService")
    private IAdminService service;

    public IAdminService getService() {
        return service;
    }

    public void setService(IAdminService service) {
        this.service = service;
    }
    //添加管理员
    @RequestMapping("/registerAdmin.do")
    public String doInsertAdmin(Admin admin) {

        if (service.addAdmin(admin)) {
            return "/WEB-INF/user/addAdmin.jsp";
        } else {
            return "/WEB-INF/user/addAdmin.jsp";
        }


    }

}

