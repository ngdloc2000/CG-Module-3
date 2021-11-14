package dao.type;

import config.ConnectionSingleton;
import model.TypeBlog;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TypeDAO implements IType {
    private static final String SELECT_ALL_TYPES = "select * from typeblog";
    private static final String SELECT_TYPE_BY_ID = "select * from typeblog where id = ?";
    private static final String SELECT_TYPE_BY_NAME = "select * from typeblog where name like '?%'";

    public Connection getConnection() {
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
    public List<TypeBlog> findAll() {
        List<TypeBlog> typeBlogs = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_TYPES)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                typeBlogs.add(new TypeBlog(id, name));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return typeBlogs;
    }

    @Override
    public TypeBlog findById(int id) {
        TypeBlog typeBlog = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_TYPE_BY_ID)) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String name = rs.getString("name");
                typeBlog = new TypeBlog(id, name);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return typeBlog;
    }

    @Override
    public List<TypeBlog> searchByName(String name) {
        List<TypeBlog> list = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_TYPE_BY_NAME)
        ) {
            preparedStatement.setString(1, name);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                list.add(new TypeBlog(id, name));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
