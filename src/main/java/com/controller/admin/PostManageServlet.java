package com.controller.admin;

import com.DataBaseObject.PostConnect;
import com.model.Post;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "PostManageServlet", value = "/post-manage")
public class PostManageServlet extends HttpServlet {
    PostConnect postConnect = new PostConnect();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {

            case "check":
                checkPostUser(request, response);
                break;
            default:
                showListPost(request,response);
                break;
        }


    }

    private void showListPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Post> postList = postConnect.selectAllPostManage();


        request.setAttribute("PostList",postList);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("admin/post-manage.jsp");
        requestDispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    private void checkPostUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            int postID = Integer.parseInt(request.getParameter("id"));
            int status = Integer.parseInt(request.getParameter("status"));
            if(status == 1){
                postConnect.updateStatusPost(0,postID);
                showListPost(request,response);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("admin/post-manage.jsp");
                requestDispatcher.forward(request,response);
            }
        if(status == 0){
            postConnect.updateStatusPost(1,postID);
            showListPost(request,response);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("admin/post-manage.jsp");
            requestDispatcher.forward(request,response);
        }

    }
}
