package com.DataBaseObject;


import com.model.Post;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PostConnect {
    public PostConnect() {
    }

    private static String jdbcURL = "jdbc:mysql://localhost:3306/blog-manage";
    private static String jdbcUsername = "root";
    private static String jdbcPassword = "Toilaai123!";


    private static final String INSERT_POST_SQL = "INSERT INTO postmanage"
            + "  (id_user, img_dres, title, content, create_day,img_path)" +
            " VALUES " +
            " (?, ?, ?, ?, ?, ?);";

    private static final String USER_POST_MANAGE =
            "select postmanage.id,postmanage.title,postmanage.content, postmanage.img_dres, postmanage.create_day, postmanage.img_path,postmanage.status\n" +
                    "from postmanage \n" +
                    "where postmanage.id_user= ?;";


    private static final String DELETE_POST_USER = "delete from postmanage where id = ?;    ";
    private static final String SELECT_POST_BY_ID =
            "select * from postmanage \n" +
                    "where id =?;";
    private static final String UPDATE_POST_USER =
            "UPDATE `blog-manage`.`postmanage` SET `img_dres` = ?, `title` = ?, `content` = ?, `create_day` = ?,\n" +
                    " `img_path` = ? WHERE (`id` = ?);";

    private static final String SELECT_ALL_POST_MANAGE =
            "SELECT * FROM `blog-manage`.postmanage ;";

    private static final String UPDATE_POST_STATUS =
            "UPDATE postmanage SET `status` = ? WHERE (`id` = ?);";

    private static final String UP_POST_4 =
            "SELECT * FROM postmanage where status = 1 ORDER BY ID desc  LIMIT 4 OFFSET ?;";

    public List<Post> upPost4( ){
        List<Post> postList = new ArrayList<>();
        // Step 1: Establishing a Connection
        try (Connection connection = getConnection();

             // Step 2:Create a statement using connection object
             PreparedStatement preparedStatement = connection.prepareStatement( "SELECT * FROM `blog-manage`.postmanage ORDER BY  ID desc  LIMIT 4;");) {

            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                int id = rs.getInt("id");
                int idUser = rs.getInt("id_user");

                String description = rs.getString("img_dres");
                String title = rs.getString("title");
                String img_path = rs.getString("img_path");

                String content = rs.getString("content");
                String create_day = rs.getString("create_day");
                int status = rs.getInt("status");

                Post post = new Post(id, img_path, description, title, content, create_day, idUser, status);
                postList.add(post);
            }
        } catch (SQLException e) {
            System.out.println(e.getErrorCode());
        }
        return postList;
    }

    public int getToTalPost(){
        String query = "SELECT COUNT(*) FROM postmanage where status = 1;";
        try(Connection connection = getConnection();
        PreparedStatement ps = connection.prepareStatement(query );
        ){
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                return rs.getInt(1);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return 0;
    }
    public List<Post> upPost4( int amount){
        List<Post> postList = new ArrayList<>();
        // Step 1: Establishing a Connection
        try (Connection connection = getConnection();

             // Step 2:Create a statement using connection object
             PreparedStatement preparedStatement = connection.prepareStatement(UP_POST_4);) {
            preparedStatement.setInt(1,amount);
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                int id = rs.getInt("id");
                int idUser = rs.getInt("id_user");

                String description = rs.getString("img_dres");
                String title = rs.getString("title");
                String img_path = rs.getString("img_path");

                String content = rs.getString("content");
                String create_day = rs.getString("create_day");
                int status = rs.getInt("status");

                Post post = new Post(id, img_path, description, title, content, create_day, idUser, status);
                postList.add(post);
            }
        } catch (SQLException e) {
            System.out.println(e.getErrorCode());
        }
        return postList;
    }

    public boolean updateStatusPost(int status, int id) {
        boolean rowUpdated = true;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_POST_STATUS);) {
            statement.setInt(1, status);
            statement.setInt(2, id);

            System.out.println(statement);

            rowUpdated = statement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return rowUpdated;
    }

    public List<Post> selectAllPostManage() {
        List<Post> postList = new ArrayList<>();
        // Step 1: Establishing a Connection
        try (Connection connection = getConnection();

             // Step 2:Create a statement using connection object
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_POST_MANAGE);) {
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                int id = rs.getInt("id");
                int idUser = rs.getInt("id_user");

                String description = rs.getString("img_dres");
                String img_path = rs.getString("img_path");
                String title = rs.getString("title");
                String content = rs.getString("content");
                String create_day = rs.getString("create_day");
                int status = rs.getInt("status");

                Post post = new Post(id, img_path, description, title, content, create_day, idUser, status);
                postList.add(post);
            }
        } catch (SQLException e) {
            System.out.println(e.getErrorCode());
        }
        return postList;

    }

    public boolean updatePostUser(Post user) {
        boolean rowUpdated = true;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_POST_USER);) {
            statement.setString(1, user.getImg_dres());
            statement.setString(2, user.getTitle());
            statement.setString(3, user.getContent());
            statement.setString(4, user.getCreateday());
            statement.setString(5, user.getImg_path());
            statement.setInt(6, user.getId());
            System.out.println(statement);

            rowUpdated = statement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return rowUpdated;
    }

    public Post selectPostById(int id) {
        Post post = null;
        // Step 1: Establishing a Connection
        try (Connection connection = getConnection();
             // Step 2:Create a statement using connection object
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_POST_BY_ID);) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                String create_day = rs.getString("create_day");
                String title = rs.getString("title");
                String description = rs.getString("img_dres");
                String content = rs.getString("content");
                String img_path = rs.getString("img_path");

                //luu vao doi tuong user
                post = new Post(id, description, title, content, create_day, img_path);
            }
        } catch (SQLException e) {
            System.out.println(e.getErrorCode());
        }
        return post;
    }

    public boolean deleteUser(int id) {
        boolean rowDeleted = false;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_POST_USER);) {   //truyen id vao 1 dau ?
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

// trả về một List Post,tuỳ theo mỗi ID user
    public List<Post> getUserPostManage(int id) throws SQLException {
        List<Post> userList = new ArrayList<>();
        Connection connection = getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(USER_POST_MANAGE);

        preparedStatement.setInt(1, id);
        System.out.println(preparedStatement);
        ResultSet rs = preparedStatement.executeQuery();

        // Step 4: Process the ResultSet object.
        while (rs.next()) {

            int id_post = rs.getInt("id");
            String title = rs.getString("title");
            String content = rs.getString("content");
            String description = rs.getString("img_dres");
            String create_day = rs.getString("create_day");
            String img_path = rs.getString("img_path");
            int status = rs.getInt("status");
            //  Post post = new Post(id, img_path, description, title, content, status,create_day, );
            Post post = new Post(id_post, img_path, description, title, content,status, create_day );
            userList.add(post);


        }
        return userList;
    }

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            // nap chong phuong thuc
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
            System.out.println("connect successfully!");
        } catch (SQLException e) {
            System.out.println("connect failure!");
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }


    public void insertAccount(Post post) throws SQLException {
        Connection connection = getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(INSERT_POST_SQL);

        preparedStatement.setInt(1, post.getIdUser());
        preparedStatement.setString(2, post.getImg_dres());
        preparedStatement.setString(3, post.getTitle());
        preparedStatement.setString(4, post.getContent());
        preparedStatement.setString(5, post.getCreateday());
        preparedStatement.setString(6, post.getImg_path());

        System.out.println(preparedStatement);
        //cuoi dong lenh la phai update lai
        preparedStatement.executeUpdate();
    }
}
