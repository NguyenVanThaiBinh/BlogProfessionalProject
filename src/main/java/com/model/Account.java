package com.model;

import java.io.Serializable;

public class Account implements Serializable {
     private String user,password,email,name;

    public String getUser() {
        return user;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Account(String user, String password,String name, String email ) {
        this.user = user;
        this.password = password;
        this.email = email;
        this.name = name;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Account( int id,String user, String password,String name, String email) {
        this.user = user;
        this.name = name;
        this.password = password;
        this.email = email;
        this.id = id;
    }

    public Account() {
    }

    private int id;


    public class Post {
    }
}
