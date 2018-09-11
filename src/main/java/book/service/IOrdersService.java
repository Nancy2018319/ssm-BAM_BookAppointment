package book.service;

import book.bean.Orders;

import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @description:BAM
 * @author:Nancy
 * @version:${VERSION}
 * @date:2018/9/3
 */
public interface IOrdersService {
    //通过图书ID和用户名预约书籍，并插入
//    AppointExecution addOrder(@Param("user_acname") String user_acname, @Param("book_id") int book_id);
//      boolean addOrder(@Param("user_acname") String user_acname, @Param("book_id") int book_id);
    boolean addOrder(Orders order);

    //订单状态更改
    boolean alterOrderStatus(@Param("order_id") int order_id,@Param("status") int status,@Param("id") int id);

    //通过一个用户账号名查询已经预约了哪些书。
    List<Orders> selectAndReturn(String accountname);

    //用户根据用户名（当前用户名）与订单状态的不同来查询订单详情
    List<Orders> findOrdersByStatusAndName(int status,String user_acname);
}
