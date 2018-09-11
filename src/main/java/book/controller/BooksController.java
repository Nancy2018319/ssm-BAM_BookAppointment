package book.controller;

import book.bean.Books;
import book.service.IBooksService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * @description:BAM
 * @author:Nancy
 * @version:${VERSION}
 * @date:2018/8/28
 */
@Controller
public class BooksController {
    @Autowired
    @Qualifier("booksService")
    private IBooksService booksService;

    public IBooksService getBooksService() {
        return booksService;
    }

    public void setBooksService(IBooksService booksService) {
        this.booksService = booksService;
    }
//    后台添加书籍，暂为测试任务
    @RequestMapping("/addBook.do")
    public String doInsertBooks(Books book){
        if(booksService.addBook(book)){
            return "/WEB-INF/book/addBook.jsp";
        }else{
            return "/WEB-INF/book/addBook.jsp";
        }

    }
    /*获取图书列表*/
    @RequestMapping("/selectAllBooks.do")
    public String doSelectAllBooks(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model) {
        int pageSize = 5;
        PageHelper.startPage(pn, pageSize);
        List<Books> books = booksService.findAllBook();
        PageInfo page = new PageInfo(books, pageSize);
        model.addAttribute("pageInfo", page);
        return "/WEB-INF/book/listBooks.jsp";
    }
    /*根据书名字段查询书籍*/
    @RequestMapping("/selectBbyName.do")
    public String doselectBbyName(@RequestParam(value = "pn", defaultValue = "1") Integer pn,Books books ,Model model) {
        String book_name = books.getBook_name();
        model.addAttribute("bookName", book_name);
        int pageSize = 5;
        PageHelper.startPage(pn, pageSize);
        List<Books> book = this.booksService.findBookByName(book_name);
        if (book != null && !book.isEmpty()&&!book_name.isEmpty()) {
            PageInfo page = new PageInfo(book, 5);
            model.addAttribute("pageInfo", page);
            return "/WEB-INF/book/showBdetail.jsp";
        }
        return "/WEB-INF/book/showBdetailNone.jsp";
    }

//        查看某图书的详细情况
    @RequestMapping("/showBookDetail.do")
    public String detail(int id, Model model){
        Date myDate = new Date();
        Calendar calendar=Calendar.getInstance();
        calendar.setTime(myDate);
        calendar.add(Calendar.DAY_OF_WEEK,calendar.get(Calendar.DAY_OF_WEEK)+3);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String startDate = sdf.format(myDate);
        String finishDate = sdf.format(calendar.getTime());
        if(id<0){
            return "redirect:selectAllBooks.do";
        }
        Books book=booksService.selectBookById(id);
        if(book==null){
            return "forward:selectAllBooks.do";
        }
        model.addAttribute("startDate", startDate);
        model.addAttribute("finishDate", finishDate);
        model.addAttribute("book",book);
        return "/WEB-INF/book/detail.jsp";
    }
}

