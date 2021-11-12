package dao.blog;

import config.ConnectionSingleton;
import dao.type.IType;
import dao.type.TypeDAO;
import model.Blog;
import model.TypeBlog;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BlogDAO implements IBlog {
    private IType iType = new TypeDAO();

    private static final String SELECT_ALL_BLOGS = "select * from blog join type on blog.type_id = typeblog.id";
    private static final String SELECT_BLOG_BY_ID = "select * from blog where id = ?";

    @Override
    public List<Blog> findAll() {
        List<Blog> blogList = new ArrayList<>();

        try {
            Connection connection = ConnectionSingleton.getConnection();
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
}
