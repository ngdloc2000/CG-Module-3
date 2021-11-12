package dao.type;

import config.ConnectionSingleton;
import model.TypeBlog;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TypeDAO implements IType {
    private static final String SELECT_ALL_TYPES = "select * from typeblog";
    private static final String SELECT_TYPE_BY_ID = "select * from typeblog where id = ?";

    @Override
    public List<TypeBlog> findAll() {
        List<TypeBlog> typeBlogs = new ArrayList<>();
        try (Connection connection = ConnectionSingleton.getConnection();
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
        try (Connection connection = ConnectionSingleton.getConnection();
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
}
