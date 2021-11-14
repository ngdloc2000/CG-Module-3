package dao.blog;

import config.ConnectionSingleton;
import dao.type.IType;
import dao.type.TypeDAO;
import model.Blog;
import model.TypeBlog;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BlogDAO implements IBlog {
    private IType iType = new TypeDAO();

    private static final String SELECT_ALL_BLOGS = "select * from blog order by id DESC";
    private static final String SELECT_BLOG_BY_TYPE = "select * from blog where blog.type_id = ?";
    private static final String SELECT_BLOG_BY_NAME = "select * from blog where blog.name like ?";

    public Connection getConnection(){
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/blog",
                    "root",
                    "ngdloc1532k");
            System.out.println("ket noi thanh cong");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            System.out.println("Ket noi khong thanh cong");
        }
        return connection;
    }

    @Override
    public List<Blog> findAll() {
        Connection connection = getConnection();
        List<Blog> blogList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_BLOGS);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String image = rs.getString("image");
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String date = rs.getString("dateCreated");
                int type_id = rs.getInt("type_id");
                TypeBlog typeBlog = iType.findById(type_id);
                Blog blog = new Blog(id, name, date, typeBlog, image);
                blogList.add(blog);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return blogList;
    }

    @Override
    public Blog findById(int id) {
        return null;
    }

    @Override
    public List<Blog> selectBlogByIdType(int id) {
        Connection connection = getConnection();
        List<Blog> blogList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BLOG_BY_TYPE);
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String image = rs.getString("image");
                String name = rs.getString("name");
                String date = rs.getString("dateCreated");
                int type_id = rs.getInt("type_id");
                TypeBlog typeBlog = iType.findById(type_id);
                Blog blog = new Blog(id, name, date, typeBlog, image);
                blogList.add(blog);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return blogList;
    }

    @Override
    public List<Blog> searchByName(String nameInput) {
        List<Blog> list = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BLOG_BY_NAME);
        ) {
            preparedStatement.setString(1, nameInput + "%");
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String date = rs.getString("dateCreated");
                int type_id = rs.getInt("type_id");
                String image = rs.getString("image");
                TypeBlog typeBlog = iType.findById(type_id);
                list.add(new Blog(id, name, date, typeBlog, image));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
