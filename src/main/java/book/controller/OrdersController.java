package book.controller;


import book.bean.Orders;
import book.bean.User;
import book.service.IOrdersService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @description:BAM
 * @author:Nancy
 * @version:${VERSION}
 * @date:2018/9/3
 */
@Controller
public class OrdersController {
    @Autowired
    @Qualifier("ordersService")
    private IOrdersService ordersService;

    public IOrdersService getOrdersService() {
        return ordersService;
    }

    public void setOrdersService(IOrdersService ordersService) {
        this.ordersService = ordersService;
    }

    //预约书籍，用户业务
    @RequestMapping("/inserOrder.do")
    public String insertOrder(Orders order, Model model,int book_number,int book_id,HttpServletRequest request) {
        int flag=0;
        HttpSession session =request.getSession();
        User user = (User) session.getAttribute("user");
        int id=order.getBook_id();
        List<Orders> orders=ordersService.selectAndReturn(user.getAccountname());
        if (book_number>0) {
            if(orders!=null) {
                for (Orders it : orders) {
                    if (it.getBook_id() == book_id && it.getStatus() == 1) {
                        flag = 1;
                        break;
                    }
                }
            }
                if(flag==1){
                    model.addAttribute("msgn", "预约失败，重复预约");
                    return "forward:/showBookDetail.do?id="+id;
                }else {
                    if (ordersService.addOrder(order)) {
                        model.addAttribute("msgn", "预约成功！请在五天内借书哦！或您可在已预约中取消预约。");
                        return "forward:/showBookDetail.do?id="+id;
                    }
                }
        }
        model.addAttribute("msgn", "预约失败，库存不足");
        return "forward:/showBookDetail.do?id="+id;
    }
    //用户查询所有记录
    @RequestMapping(value ="/appoint.do")
    public String appointBooks(@RequestParam("user_acname") String user_acname,@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model) {
        int pageSize = 5;
        PageHelper.startPage(pn, pageSize);
        List<Orders> order = ordersService.selectAndReturn(user_acname);
        if(order!=null&&!order.isEmpty()){
            PageInfo page = new PageInfo(order, pageSize);
            model.addAttribute("pageInfo", page);
            return "/WEB-INF/order/orderForUserAless.jsp";
        }
        model.addAttribute("msg", "暂无记录，您可以去预约书籍添加记录哦！");
      return "/WEB-INF/order/orderForUserAless.jsp";
    }
    //用户取消已预约书籍
    @RequestMapping("cancelAppointment.do")
    public String doCancelAppointment(@RequestParam("order_id")int order_id,@RequestParam("status") int status,@RequestParam("id") int id,HttpServletRequest request,Model model){
        HttpSession session =request.getSession();
        User user = (User) session.getAttribute("user");
        if (ordersService.alterOrderStatus(order_id,status,id)) {
            return "redirect:/appoint.do?user_acname=" + user.getAccountname();
        }
        model.addAttribute("msg","取消预约失败");
        return "/WEB-INF/order/orderForUser.jsp";
    }

    //用户根据自己的账户名与订单状态查询相应订单
    @RequestMapping("showOrdersByStaAndName.do")
    public String doShowOrdersByStaAndName(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model, int status, String user_acname){
        int pageSize = 5;
        PageHelper.startPage(pn, pageSize);
        List<Orders> order = ordersService.findOrdersByStatusAndName(status,user_acname);
        if(order!=null&&!order.isEmpty()){
            PageInfo page = new PageInfo(order, 5);
            model.addAttribute("pageInfo", page);
            if(status==1){
                return "/WEB-INF/order/orderForUser.jsp";
            }else{
                return "/WEB-INF/order/orderForUserless.jsp";
            }
        }
        model.addAttribute("msg", "暂无记录，您可以去预约书籍添加记录哦！");
        return "/WEB-INF/order/orderForUserless.jsp";
    }
}

