package com.controller.admin;

import com.DataBaseObject.LoginConnect;
import com.model.Account;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "UserManageServlet", value = "/user-manage")
public class UserManageServlet extends HttpServlet {
     static LoginConnect loginConnect = new LoginConnect();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String msg = "";
        request.setAttribute("msg",msg);
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {


                case "search":
                    try {
                        showSearch(request,response);
                    } catch (SQLException throwables) {
                        throwables.printStackTrace();
                    }
                    break;
                case "delete":
                    try {
                        deleteUser(request, response);
                    } catch (SQLException throwables) {
                        throwables.printStackTrace();
                    }
                    break;
            default:
                listUser(request, response);
                break;
        }
    }

    private void showSearch(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String keyword = request.getParameter("search");
        List<Account> userList = loginConnect.searchUsers(keyword);
        request.setAttribute("userList",userList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("admin/search-user.jsp");
        requestDispatcher.forward(request,response);
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        loginConnect.setOffForeginKey();

        loginConnect.deleteUser(id);
        String msg = "Delete complete!";
        request.setAttribute("msg",msg);

        List<Account> accountList = loginConnect.selectAllUsers();
        request.setAttribute("accountList",accountList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("admin/user-manage.jsp");
        dispatcher.forward(request, response);
    }



    private void listUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Account> accountList = loginConnect.selectAllUsers();
        request.setAttribute("accountList",accountList);

        String msg = "";
        request.setAttribute("msg",msg);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("admin/user-manage.jsp");
        requestDispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }


}
