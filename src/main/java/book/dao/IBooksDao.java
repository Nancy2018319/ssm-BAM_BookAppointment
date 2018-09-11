package book.dao;

import book.bean.Books;

import java.util.List;

/**
 * @description:BAM
 * @author:Nancy
 * @version:${VERSION}
 * @date:2018/8/28
 */
public interface IBooksDao {
    //添加一本书籍
    int insertBook(Books book);

    //删除一本书籍
    int deleteBook(String book_name);

    //修改书籍的信息
    int updateBookProfile(Books book);


    //查看书籍的信息
    //int showAdminProfile(String accountname);
    Books showBookProfile(String book_name);

    /*
     * 根据id查询书
     *
     */
    Books queryBookById(int id);

    //查找所有书籍（在页面上显示，需要分页）
    List<Books> selectAllBook();

    //根据书名模糊查询书籍
    List<Books> selectBookByName(String book_name);
    /*减少库存数量
     * 用返回值可判断当前库存是否还有书
     */
    int reduceNumber(int id);
    //客户取消预订，加库存
    int addNumber(int id);

}
