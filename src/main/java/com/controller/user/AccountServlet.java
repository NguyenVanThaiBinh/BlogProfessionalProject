package com.controller.user;

import com.DataBaseObject.LoginConnect;
import com.DataBaseObject.PostConnect;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "AccountServlet", value = "/account")
public class AccountServlet extends HttpServlet {
     static LoginConnect loginConnect = new LoginConnect();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("msg","");
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("user/account.jsp");
        requestDispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String password = (String) request.getSession().getAttribute("userPwdLogin");
        int userID = (int)request.getSession().getAttribute("userIDLogin");
        String recentlyPwd = request.getParameter("last-pwd");
        String newPwd = request.getParameter("pwd");
        String confirmPwd = request.getParameter("re-pwd");

        if(password.equals(recentlyPwd) && newPwd.equals(confirmPwd)){
            request.setAttribute("msg","Reset password successfully!");
            try {
                loginConnect.setResetPassword(userID,newPwd);
                System.out.println("Came there!");
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("user/account.jsp");
            requestDispatcher.forward(request,response);

        }else{
            request.setAttribute("msg","Reset password fail!");
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("user/account.jsp");
            requestDispatcher.forward(request,response);
        }


    }
}
