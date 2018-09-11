package book.service;

import book.bean.Books;

import java.util.List;

/**
 * @description:BAM
 * @author:Nancy
 * @version:${VERSION}
 * @date:2018/8/28
 */
public interface IBooksService {
    //添加一本书籍
    boolean addBook(Books book);

    //删除一本书籍
    boolean moveBook(String book_name);

    //修改书籍的信息
    boolean alterBookProfile(Books book);

    //查看书籍的信息
    //int showAdminProfile(String accountname);
    public Books readBookProfile(String book_name);
    //根据id查询书籍
    Books selectBookById(int id);

    //查找所有书籍（在页面上显示，需要分页）
    List<Books> findAllBook();

    //根据书名模糊查询书籍（在页面上显示，需要分页）
    List<Books> findBookByName(String book_name);
}
