package com.controller.user;

import com.DataBaseObject.PostConnect;
import com.model.Post;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(name = "CreatePostServlet", value = "/create-post")
public class CreatePostServlet extends HttpServlet {
    PostConnect postConnect = new PostConnect();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String msg = "";
        request.setAttribute("msg", msg);
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {

//
//            case "search":
//                try {
//                    showSearch(request,response);
//                } catch (SQLException throwables) {
//                    throwables.printStackTrace();
//                }
//                break;
//            case "delete":
//                try {
//                    deleteUser(request, response);
//                } catch (SQLException throwables) {
//                    throwables.printStackTrace();
//                }
//                break;
            default:
                createNewPost(request, response);
                break;
        }
    }

    private void createNewPost(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("user/create-post.jsp");
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

        String create_day = request.getParameter("create_day");
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String content = request.getParameter("content");
        String img_path = request.getParameter("img_path");

        int user_id_login = (int) request.getSession().getAttribute("userIDLogin");

            Post post = new Post(user_id_login, description, title, content, create_day, img_path);

        try {
            postConnect.insertAccount(post);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        request.setAttribute("msg","Create Done!");
        request.setAttribute("title", title);
        request.setAttribute("description", description);
        request.setAttribute("content", content);
        request.setAttribute("img_path", img_path);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("user/create-post.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }


    }
}
