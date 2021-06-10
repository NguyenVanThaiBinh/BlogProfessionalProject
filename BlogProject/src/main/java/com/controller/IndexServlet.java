package com.controller;

import com.DataBaseObject.PostConnect;
import com.model.Account;
import com.model.Post;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.util.List;

@WebServlet(name = "IndexServlet", value = "/home")
public class IndexServlet extends HttpServlet {
    static PostConnect postConnect = new PostConnect();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String indexPage = request.getParameter("index");
        if(indexPage == null){
            indexPage = "0";
        }
        int index = Integer.parseInt(indexPage);
        double count = postConnect.getToTalPost();
        double endPage = Math.ceil(count/4);
        List<Post> PostUpList = postConnect.upPost4(index);
        request.setAttribute("endP",endPage);
        request.setAttribute("PostUpList", PostUpList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
