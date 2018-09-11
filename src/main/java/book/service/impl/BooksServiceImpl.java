package book.service.impl;

import book.bean.Books;
import book.dao.IBooksDao;
import book.service.IBooksService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @description:BAM
 * @author:Nancy
 * @version:${VERSION}
 * @date:2018/8/28
 */
@Service("booksService")
public class BooksServiceImpl implements IBooksService {
    @Autowired
    @Qualifier("IBooksDao")
    private IBooksDao booksDao;

    public IBooksDao getBooksDao() {
        return booksDao;
    }

    public void setBooksDao(IBooksDao booksDao) {
        this.booksDao = booksDao;
    }
    @Override
    public boolean addBook(Books book){
        int count=booksDao.insertBook(book);
        if(count>0){
            return true;
        }
        return false;
    }

    @Override
    public boolean moveBook(String book_name){
        int count=booksDao.deleteBook(book_name);
        if(count>0){
            return true;
        }
        return false;
    }
    @Override
    public boolean alterBookProfile(Books book){
        int count=booksDao.updateBookProfile(book);
        if(count>0){
            return true;
        }
        return false;
    }
    @Override
    public Books readBookProfile(String book_name) {
        return booksDao.showBookProfile(book_name);
    }

    @Override
    public Books selectBookById(int id){ return booksDao.queryBookById(id); }
    @Override
    public List<Books> findAllBook() {
        List<Books> books = booksDao.selectAllBook();
        if (books.size() > 0) {
            return books;
        } else {
            return null;
        }
    }


    @Override
    public List<Books> findBookByName(String book_name) {
        List<Books> books = booksDao.selectBookByName(book_name);
        if (books.size() > 0) {
            return books;
        } else {
            return null;
        }
    }
}
