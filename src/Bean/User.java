package Bean;

public class User {
    private int UID;//用户ID
    private String Uname;//用户名
    private String password;//密码
    private String UEmail;//电子邮件
    private String UBirthday;//生日
    private String USex;//性别
    private String USatement;//用户备注

    public User(String uname,String password){
        Uname = uname;
        this.password = password;
    }

    public String getUname() {
        return Uname;
    }

    public void setUname(String uname) {
        Uname = uname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUEmail() {
        return UEmail;
    }

    public void setUEmail(String UEmail) {
        this.UEmail = UEmail;
    }

    public String getUBirthday() {
        return UBirthday;
    }

    public void setUBirthday(String UBirthday) {
        this.UBirthday = UBirthday;
    }

    public String getUSex() {
        return USex;
    }

    public void setUSex(String USex) {
        this.USex = USex;
    }

    public String getUSatement() {
        return USatement;
    }

    public void setUSatement(String USatement) {
        this.USatement = USatement;
    }
}
