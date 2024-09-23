package model;

public class User {
    private int id;
    private String userName;
    private String email;
    private String mobile;

    public User(int id, String userName, String email, String mobile) {
        this.id = id;
        this.userName = userName;
        this.email = email;
        this.mobile = mobile;
    }

    public int getId() {
        return id;
    }

    public String getUserName() {
        return userName;
    }

    public String getEmail() {
        return email;
    }

    public String getMobile() {
        return mobile;
    }
}
