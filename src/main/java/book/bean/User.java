package book.bean;

/**
 * @description:BAM
 * @author:Nancy
 * @version:${VERSION}
 * @date:2018/8/27
 */
public class User {
    private Integer id;
    private String accountname;
    private String password;
    private String name;
    private int sex;
    private String phone;
    private String idnumber;

    public User(){
        super();
    }

    public User(String accountname, String password, String name, int sex, String phone, String idnumber) {
        this.accountname = accountname;
        this.password = password;
        this.name = name;
        this.sex = sex;
        this.phone = phone;
        this.idnumber = idnumber;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAccountname() {
        return accountname;
    }

    public void setAccountname(String accountname) {
        this.accountname = accountname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getSex() {
        return sex;
    }

    public void setSex(int sex) {
        this.sex = sex;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getIdnumber() {
        return idnumber;
    }

    public void setIdnumber(String idnumber) {
        this.idnumber = idnumber;
    }
}
