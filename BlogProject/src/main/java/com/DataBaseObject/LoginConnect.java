package com.DataBaseObject;

import com.model.Account;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class LoginConnect {

    public LoginConnect() {
    }

    private static String jdbcURL = "jdbc:mysql://kfgk8u2ogtoylkq9.cbetxkdyhwsb.us-east-1.rds.amazonaws.com:3306/s20sg0j8h4j99oda";
    private static String jdbcUsername = "uyblqz0wa0s04lu7";
    private static String jdbcPassword = "i1ozm87u0uqiisce";

    private static final String INSERT_USERS_SQL = "INSERT INTO account" + "  (username, password, email, name)" +
            " VALUES " +
            " (?, ?, ?, ?);";

    private static final String SELECT_USER_BY_ID = "select id,username,password,email,name from account where id =?";
    private static final String SELECT_ALL_USERS = "select * from account order by id desc ";

    private static final String DELETE_USERS_SQL = "delete from account where id = ?;";

    private static final String SORT_USERS_SQL = "select * from account ORDER BY name";

    private static final String SEARCH_USERS_SQL =
            "select * from account where username like  ? or name like  ? or email like ? or password like ? ;";

    private static final String RESET_PASSWORD =
            "UPDATE account SET `password` = ? WHERE (`id` = ?);";
    public int getIDbyuser(String userName)  {
        int id = 0;
        String query ="select id from account where username = ?;";
        Connection connection = getConnection();
        // Step 2:Create a statement using connection object
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(query);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        try {
            preparedStatement.setString(1, userName);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        try {
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        ResultSet rs = null;
        try {
            rs = preparedStatement.executeQuery();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        while (true) {
            try {
                if (!rs.next()) break;
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                id = rs.getInt("id");
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }

        }

        return id;
    }


    public void setOffForeginKey() throws SQLException {
        Connection connection = getConnection();
        // Step 2:Create a statement using connection object
        PreparedStatement preparedStatement = null;
        preparedStatement = connection.prepareStatement("SET foreign_key_checks = 0;");
        preparedStatement.executeUpdate();
        System.out.println(preparedStatement);
        System.out.println("Foregin Key Done!");
    }

    public void setResetPassword(int id, String password) throws SQLException {
        Connection connection = getConnection();
        // Step 2:Create a statement using connection object
        PreparedStatement preparedStatement = null;
        preparedStatement = connection.prepareStatement(RESET_PASSWORD);
        preparedStatement.setString(1, password);
        preparedStatement.setInt(2, id);
        preparedStatement.executeUpdate();
        System.out.println(preparedStatement);


        System.out.println(preparedStatement);

    }


    public List<Account> searchUsers(String keyword) throws SQLException {
        String keyWord = "%" + keyword + "%"; // cu phap cua mysql
        List<Account> accountList = new ArrayList<>();
        Connection connection = getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_USERS_SQL);
        preparedStatement.setString(1, keyWord);
        preparedStatement.setString(2, keyWord);
        preparedStatement.setString(3, keyWord);
        preparedStatement.setString(4, keyWord);
        System.out.println(preparedStatement);
        ResultSet rs = preparedStatement.executeQuery();
        while (rs.next()) {
            int id = rs.getInt("id");
            String userName = rs.getString("userName");
            String password = rs.getString("password");
            String email = rs.getString("email");
            String name = rs.getString("name");

            accountList.add(new Account(id, userName, password, name, email));
        }
        return accountList;
    }





    public Account selectUser(int id) {
        Account account = null;
        // Step 1: Establishing a Connection
        try (Connection connection = getConnection();
             // Step 2:Create a statement using connection object
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);) {
            //bo id vao
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                String name = rs.getString("name");
                String email = rs.getString("email");
                String username = rs.getString("username");
                String password = rs.getString("password");


                account = new Account(id, username, password, name, email);
            }
        } catch (SQLException e) {
            System.out.println(e.getErrorCode());
        }
        return account;
    }


    public boolean deleteUser(int id) {
        boolean rowDeleted = false;
        try (Connection connection = getConnection();

             PreparedStatement statement = connection.prepareStatement(DELETE_USERS_SQL);)
        {   //truyen id vao 1 dau ?
            statement.setInt(1, id);
            rowDeleted = true;
            rowDeleted = statement.executeUpdate() > 0;
            System.out.println(statement);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }


        System.out.println("delete success!");
        return rowDeleted;
    }

    public void insertAccount(Account account) throws SQLException {
        Connection connection = getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL);

        preparedStatement.setString(1, account.getUser());
        preparedStatement.setString(2, account.getPassword());
        preparedStatement.setString(3, account.getEmail());
        preparedStatement.setString(4, account.getName());
        System.out.println(preparedStatement);
        //cuoi dong lenh la phai update lai
        preparedStatement.executeUpdate();
    }


    public List<Account> selectAllUsers() {
        // using try-with-resources to avoid closing resources (boiler plate code)
        List<Account> loginConnects = new ArrayList<>();
        // Step 1: Establishing a Connection
        try (Connection connection = getConnection();

             // Step 2:Create a statement using connection object
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS);) {
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                int id = rs.getInt("id");
                String userName = rs.getString("userName");
                String password = rs.getString("password");
                String email = rs.getString("email");
                String name = rs.getString("name");

                loginConnects.add(new Account(id, userName, password, name, email));
            }
        } catch (SQLException e) {
            System.out.println(e.getErrorCode());
        }
        return loginConnects;
    }


    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            // nap chong phuong thuc
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

        } catch (SQLException e) {
            System.out.println("connect failure!");
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        System.out.println("connect success!!");
        return connection;
    }

}

