package br.com.curso.model;

public class User {
    private String userName;
    private String userEmail;
    private String userPass;
    private String userType;

    public User(String name, String email, String pass, String type){
        this.userName = name;
        this.userEmail = email;
        this.userPass = pass;
        this.userType = type;
    }
    public User(String name, String email, String type){ // OVERLOAD PARA O LISTUSER
        this.userName = name;
        this.userEmail = email;
        this.userType = type;
    }
    public String getUserName() {
        return userName;
    }

    public void setUserName(String name) {
        this.userName = name;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserPass() {
        return userPass;
    }

    public void setUserPass(String userPass) {
        this.userPass = userPass;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }
}
