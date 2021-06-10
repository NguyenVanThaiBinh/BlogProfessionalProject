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
//        PrintWriter printWriter = response.getWriter();
//        for (Post p : postList) {
//            printWriter.println("    <div class=\"column\">\n" +
//                    "                        <article style=\"margin-bottom: 5em\">\n" +
//                    "                            <a class=\"imgover\" href=\"#\">\n" +
//                    "                                <img style=\"width: 546px; height: 410px\" src=\""+p.getImg_path()+"\" alt=\"image\"/>\n" +
//                    "                            </a>\n" +
//                    "                            <div class=\"excerpt\">\n" +
//                    "                                <h6 class=\"heading\">"+p.getTitle()+"</h6>\n" +
//                    "                                <p>"+p.getImg_dres()+" [&hellip;]</p>\n" +
//                    "                                <div class=\"clear\">\n" +
//                    "                                    <footer class=\"fl_right\">\n" +
//                    "\n" +
//                    "                                        <a href=\"read-more?id="+p.getId()+"\" style=\"margin-right: 5em; \">Read More <i\n" +
//                    "                                                class=\"fas fa-angle-right\"></i></a>\n" +
//                    "                                    </footer>\n" +
//                    "                                    <ul class=\"nospace meta fl_left\">\n" +
//                    "                                        <li><i class=\"fas fa-user\"></i> <a href=\"#\">By User ID: "+p.getIdUser()+" </a></li>\n" +
//                    "                                        <li><i class=\"fas fa-tag\"></i> <a href=\"#\">Tag Name</a></li>\n" +
//                    "                                        <li>Create at: "+p.getCreateday()+" </li>\n" +
//                    "                                    </ul>\n" +
//                    "                                </div>\n" +
//                    "                            </div>\n" +
//                    "                        </article>\n" +
//                    "                    </div>");
//        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
