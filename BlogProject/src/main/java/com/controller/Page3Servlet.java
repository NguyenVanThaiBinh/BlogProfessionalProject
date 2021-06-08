package com.controller;

import com.DataBaseObject.PostConnect;
import com.model.Post;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Page3Servlet", value = "/page_3")
public class Page3Servlet extends HttpServlet {
    PostConnect postConnect = new PostConnect();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Post> postList = postConnect.upPost4();

        request.setAttribute("PostUpList", postList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("page_3.jsp");
        requestDispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
