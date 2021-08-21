package com.model;

import java.io.Serializable;

public class Post implements Serializable {
    private String img_dres;
    private String title;
    private String content;
     private int status;

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getImg_path() {
        return img_path;
    }

    public void setImg_path(String img_path) {
        this.img_path = img_path;
    }

    private String img_path;

    public String getImg_dres() {
        return img_dres;
    }

    public void setImg_dres(String img_dres) {
        this.img_dres = img_dres;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCreateday() {
        return createday;
    }

    public void setCreateday(String createday) {
        this.createday = createday;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }
//    Post post = new Post(id, img_path, description, title, content, create_day, idUser);
public Post(int id,   String img_path,String description, String title, String content, String createday, int idUser) {
    this.img_dres = description;
    this.title = title;
    this.content = content;
    this.createday = createday;
    this.idUser = idUser;
    this.id = id;
    this.img_path = img_path;
}
    public Post(int id,   String img_path,String description, String title, String content,int status, String createday ) {
        this.img_dres = description;
        this.title = title;
        this.content = content;
        this.createday = createday;
        this.status = status;
        this.id = id;
        this.img_path = img_path;
    }

    public Post(int id,   String img_path,String description, String title, String content, String createday, int idUser,int status) {
        this.img_dres = description;
        this.title = title;
        this.content = content;
        this.createday = createday;
        this.idUser = idUser;
        this.id = id;
        this.status = status;
        this.img_path = img_path;
    }
    public Post(int id, int idUser, String description, String title, String content, String createday, String img_path) {
        this.img_dres = description;
        this.title = title;
        this.content = content;
        this.createday = createday;
        this.idUser = idUser;
        this.id = id;
        this.img_path = img_path;
    }

    public Post(int idUser, String description, String title, String content, String createday, String img_path) {
        this.img_dres = description;
        this.title = title;
        this.content = content;
        this.createday = createday;
        this.idUser = idUser;

        this.img_path = img_path;
    }

    public Post(String title,int id, String content, String description, String createday, String img_path) {
        this.img_dres = description;
        this.title = title;
        this.content = content;
        this.createday = createday;
        this.img_path = img_path;
        this.id = id;

    }

    public Post(String description,String title, String content,  String createday, String img_path,int id) {
        this.img_dres = description;
        this.title = title;
        this.content = content;
        this.createday = createday;
        this.img_path = img_path;
        this.id = id;

    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Post() {
    }

    private String createday;
    private int idUser, id;
}
