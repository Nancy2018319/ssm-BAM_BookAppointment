package book.service.impl;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import book.bean.Orders;
import book.dao.IBooksDao;
import book.dao.IOrdersDao;
import book.service.IOrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @description:BAM
 * @author:Nancy
 * @version:${VERSION}
 * @date:2018/9/3
 */
@Service("ordersService")
public class OrdersServiceImpl implements IOrdersService {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    @Qualifier("IOrdersDao")
    private IOrdersDao ordersDao;

    public IOrdersDao getOrdersDao() {
        return ordersDao;
    }

    public void setOrdersDao(IOrdersDao ordersDao) {
        this.ordersDao = ordersDao;
    }

    @Autowired
    @Qualifier("IBooksDao")
    private IBooksDao booksDao;


    @Override
//    @Transactional
//    /**
//     * 使用注解控制事务方法的优点： 1.开发团队达成一致约定，明确标注事务方法的编程风格
//     * 2.保证事务方法的执行时间尽可能短，不要穿插其他网络操作，RPC/HTTP请求或者剥离到事务方法外部
//     * 3.不是所有的方法都需要事务，如只有一条修改操作，只读操作不需要事务控制
//     */
//    public AppointExecution addOrder(String user_acname,int book_id){
//        try{													  //返回成功预约的类型。
//            int update=booksDao.reduceNumber(book_id);//减库存
//            if(update<=0){//已经无库存！
//                throw new NoNumberException("no number");
//            }else{
//                //执行预约操作
//                int insert=ordersDao.insertOrder(user_acname, book_id);
//                if(insert<=0){//重复预约
//                    throw new RepeatAppointException("repeat appoint");
//                }else{//预约成功
//                    return new AppointExecution(book_id, AppointStateEnum.SUCCESS);
//                }
//
//            }
//        } catch (NoNumberException e1) {
//            throw e1;
//        } catch (RepeatAppointException e2) {
//            throw e2;
//        } catch (Exception e) {
//            logger.error(e.getMessage(), e);
//            // 所有编译期异常转换为运行期异常
//            throw new AppointException("appoint inner error:" + e.getMessage());
//        }
//    }

    public boolean addOrder(Orders order) {
        int update = booksDao.reduceNumber(order.getBook_id());//减库存
        int insert = ordersDao.insertOrder(order);
        if (update >0 && insert > 0) {
            return true;
        }
        return false;
    }

    @Override
    public boolean alterOrderStatus(@Param("order_id") int order_id,@Param("status") int status,@Param("id") int id){
        int update = booksDao.addNumber(id);//加库存
        int count = ordersDao.updateOrderStatus(order_id,status);
        if (update >0 && count > 0) {
            return true;
        }
        return false;
    }

    @Override
    public List<Orders> selectAndReturn(String accountname) {
        List<Orders> order = ordersDao.quaryAndReturn(accountname);
        if (order.size() > 0) {
            return order;
        } else {
            return null;
        }
    }
    @Override
    public List<Orders> findOrdersByStatusAndName(int status, String user_acname) {
        List<Orders> orders = ordersDao.selectOrdersByStaAndName(status,user_acname);
        if (orders.size() > 0) {
            return orders;
        } else {
            return null;
        }
    }
}
