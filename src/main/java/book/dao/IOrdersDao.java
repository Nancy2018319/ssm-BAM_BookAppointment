package book.dao;

import book.bean.Orders;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @description:BAM
 * @author:Nancy
 * @version:${VERSION}
 * @date:2018/9/3
 */
public interface IOrdersDao {
    //预约书籍
//    int insertOrder(@Param("user_acname") String user_acname,@Param("book_id") int book_id);
    int insertOrder(Orders order);

    //改变订单状态
    int updateOrderStatus(@Param("order_id") int order_id,@Param("status") int status);

    //通过一个用户账号名查询已经预约了哪些书。
    List<Orders> quaryAndReturn(String accountname);

    //用户自己的订单管理，根据当前用户名与订单状态的不同来查询
    List<Orders> selectOrdersByStaAndName(@Param("status") int status, @Param("user_acname") String user_acname);
}
