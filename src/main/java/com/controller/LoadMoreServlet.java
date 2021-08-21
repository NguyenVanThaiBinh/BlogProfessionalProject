package com.controller;

import com.DataBaseObject.PostConnect;
import com.model.Post;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "LoadMoreServlet", value = "/load")
public class LoadMoreServlet extends HttpServlet {
     static PostConnect postConnect = new PostConnect();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

      int amount = Integer.parseInt(request.getParameter("exits"));
        List<Post> postList = postConnect.upPost4(amount);
        request.setAttribute("postList",postList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("load-post.jsp");
        requestDispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
