package com.controller.user;

import com.DataBaseObject.PostConnect;
import com.model.Account;
import com.model.Post;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "PostCheckServlet", value = "/post-check")
public class PostCheckServlet extends HttpServlet {
    static PostConnect postConnect = new PostConnect();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String msg = "";
        request.setAttribute("msg", msg);
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {


            case "delete":
                deleteUser(request, response);
                break;
            case "check":
                checkPostUser(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            default:
                listUser(request, response);
                break;
        }


    }

    private void checkPostUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int postID = Integer.parseInt(request.getParameter("id"));
        int status = Integer.parseInt(request.getParameter("status"));
        if(status == 1){
            postConnect.updateStatusPost(0,postID);
            listUser(request,response);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("user/post_check.jsp");
            requestDispatcher.forward(request,response);
        }
        if(status == 0){
            postConnect.updateStatusPost(1,postID);
            listUser(request,response);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("user/post_check.jsp");
            requestDispatcher.forward(request,response);
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));


        HttpSession session = request.getSession(false);
        session.setAttribute("postID",id);

        Post existingUser = postConnect.selectPostById(id);
        System.out.println("Edit id is: " + id);
        String content = existingUser.getContent();
        System.out.println("Content is: " + content);
        String editMsg = "";
        request.setAttribute("addMsg", editMsg);
        request.setAttribute("user", existingUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/post_edit.jsp");

        dispatcher.forward(request, response);
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        postConnect.deleteUser(id);
        String msg = "Delete complete!";
        request.setAttribute("msg", msg);


        listUser(request, response);
    }

    private void listUser(HttpServletRequest request, HttpServletResponse response) {
        int id = (int) request.getSession().getAttribute("userIDLogin");
        List<Post> userList = new ArrayList<>();
        try {
            userList = postConnect.getUserPostManage(id);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        request.setAttribute("userListPost", userList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("user/post_check.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {

            case "edit":
                updateUser(request, response);
                break;
        }
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String create_day = request.getParameter("create_day");
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String content = request.getParameter("content");
        String img_path = request.getParameter("img_path");
        int post_id = (int) request.getSession().getAttribute("postID");
        System.out.println("Post ID is: "+post_id);



        Post post = new Post( description, title, content, create_day, img_path,post_id);
        postConnect.updatePostUser(post);
        String editMsg = "Update complete!";

        request.setAttribute("msg",editMsg);
        request.setAttribute("user", post);
        request.setAttribute("title", title);
        request.setAttribute("description", description);
        request.setAttribute("content", content);
        request.setAttribute("img_path", img_path);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/post_edit.jsp");
        dispatcher.forward(request, response);
    }
}

