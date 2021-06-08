package com.controller;

import com.DataBaseObject.PostConnect;
import com.model.Post;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ReadPostServlet", value = "/read-more")
public class ReadPostServlet extends HttpServlet {
    static PostConnect postConnect = new PostConnect();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Post> postList = postConnect.upPost4();
        int id = Integer.parseInt(request.getParameter("id"));
        for (Post post: postList) {
            if(post.getId() == id){
                Post post1 = post;
                request.setAttribute("user",post1);
                break;
            }
        }


        RequestDispatcher requestDispatcher = request.getRequestDispatcher("read-more.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
