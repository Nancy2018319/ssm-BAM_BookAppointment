package book.bean;

import net.sf.jsqlparser.expression.DateTimeLiteralExpression;

/**
 * @description:BAM
 * @author:Nancy
 * @version:${VERSION}
 * @date:2018/8/27
 */
public class Orders {
    private Integer order_id;
    private String user_acname;
    private int book_id;
    private String starttime;
    private String finishtime;
    private int status;
    private Books book;
    public Orders(){
        super();
    }

    public Orders(String user_acname, int book_id, String starttime, String finishtime, int status) {
        this.user_acname = user_acname;
        this.book_id = book_id;
        this.starttime = starttime;
        this.finishtime = finishtime;
        this.status = status;
    }

    public Integer getOrder_id() {
        return order_id;
    }

    public void setOrder_id(Integer order_id) {
        this.order_id = order_id;
    }

    public String getUser_acname() {
        return user_acname;
    }

    public void setUser_acname(String user_acname) {
        this.user_acname = user_acname;
    }

    public int getBook_id() {
        return book_id;
    }

    public void setBook_id(int book_id) {
        this.book_id = book_id;
    }

    public String getStarttime() {
        return starttime;
    }

    public void setStarttime(String starttime) {
        this.starttime = starttime;
    }

    public String getFinishtime() {
        return finishtime;
    }

    public void setFinishtime(String finishtime) {
        this.finishtime = finishtime;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Books getBook() {
        return book;
    }

    public void setBook(Books book) {
        this.book = book;
    }
}
