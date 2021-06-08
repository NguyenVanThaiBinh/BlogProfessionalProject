package com.controller;

import com.DataBaseObject.LoginConnect;
import com.model.Account;



import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "RegisterServlet", value = "/register-blog")
public class RegisterServlet extends HttpServlet {
    private static LoginConnect loginConnect = new LoginConnect();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        session.setAttribute("addMsg", "");
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("register.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String name = request.getParameter("name");


        Account account = new Account(username, password, email, name);


        List<Account> accountList = loginConnect.selectAllUsers();


        //check user is exist or not!
        for (Account ac : accountList) {
            if (ac.getUser().equalsIgnoreCase(account.getUser())) {

                HttpSession session = request.getSession(false);

                session.setAttribute("addMsg", "User: <b>" + account.getUser() + "</b> is exist!!!");
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("register.jsp");

                requestDispatcher.forward(request, response);

            }
        }
        try {
            loginConnect.insertAccount(account);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }



        HttpSession session = request.getSession(false);
        session.setAttribute("name",name);

        session.setAttribute("addMsg","Welcome <b>"+account.getName()+"</b> to Binh Hu Blog!");

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("register.jsp");

        requestDispatcher.forward(request, response);




    }
}
