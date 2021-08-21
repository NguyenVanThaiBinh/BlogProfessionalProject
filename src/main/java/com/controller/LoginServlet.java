package com.controller;

import com.DataBaseObject.LoginConnect;
import com.model.Account;


import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "LoginServlet", value = "/login-blog")
public class LoginServlet extends HttpServlet {
    private static LoginConnect loginConnect = new LoginConnect();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setAttribute("addMsg", "");
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("login.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("usernameLogin");
        String password = request.getParameter("passwordLogin");
        if(username.equals("admin")&& password.equals("12345")){

            response.sendRedirect("admin-blog");
            return;
        }


        List<Account> accountList = loginConnect.selectAllUsers();

        for (Account ac : accountList) {
            if (ac.getUser().equalsIgnoreCase(username) && (ac.getPassword().equals(password))) {

                HttpSession session = request.getSession(false);

                session.setAttribute("userIDLogin",ac.getId());
                session.setAttribute("userNameLogin",ac.getName());
                session.setAttribute("userPwdLogin",ac.getPassword());
                int test = ac.getId();
                System.out.println(test);
                response.sendRedirect("user-blog");
               return;
            }
        }

        request.setAttribute("addMsg", "Username or Password is wrong!");
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("login.jsp");
        requestDispatcher.forward(request, response);


    }

}


