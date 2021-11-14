package dao.blog;

import dao.IDao;
import model.Blog;

import java.util.List;

public interface IBlog extends IDao<Blog> {
    List<Blog> selectBlogByIdType(int id);
}
