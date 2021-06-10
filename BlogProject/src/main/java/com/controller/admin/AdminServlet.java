package com.controller.admin;

import com.DataBaseObject.PostConnect;
import com.model.Post;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminServlet", value = "/admin-blog")
public class AdminServlet extends HttpServlet {
    static PostConnect postConnect = new PostConnect();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        List<Post> postList = postConnect.upPost4();
//
//        request.setAttribute("PostUpList", postList);
//            RequestDispatcher requestDispatcher = request.getRequestDispatcher("admin/admin.jsp");
//            requestDispatcher.forward(request,response);

        String indexPage = request.getParameter("index");
        if(indexPage == null){
            indexPage = "1";
        }
        int index = Integer.parseInt(indexPage);
        double count = postConnect.getToTalPost();
        double endPage = Math.ceil(count/4);
        List<Post> PostUpList = postConnect.upPost4(index);
        request.setAttribute("endP",endPage);
        request.setAttribute("PostUpList", PostUpList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("admin/admin.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
