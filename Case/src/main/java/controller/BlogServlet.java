package controller;

import dao.blog.BlogDAO;
import dao.blog.IBlog;
import dao.type.IType;
import dao.type.TypeDAO;
import model.Blog;
import model.TypeBlog;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "BlogServlet", value = "/blogs")
public class BlogServlet extends HttpServlet {
    IBlog iBlog = new BlogDAO();
    IType iType = new TypeDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    break;
                case "selectBlogByType":
                    selectBlogByType(request, response);
                    break;
                case "searchBlogByName":
                    searchBlogByName(request, response);
                    break;
                default:
                    listBlog(request, response);
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    private void listBlog(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Blog> list = this.iBlog.findAll();
        request.setAttribute("listType", iType.findAll());
        request.setAttribute("list", list);
        RequestDispatcher dispatcher = request.getRequestDispatcher("blog/list.jsp");
        dispatcher.forward(request, response);
    }

    private void selectBlogByType(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        List<Blog> list = this.iBlog.selectBlogByIdType(id);
        request.setAttribute("list", list);
        RequestDispatcher dispatcher = request.getRequestDispatcher("blog/list.jsp");
        dispatcher.forward(request, response);
    }

    private void searchBlogByName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        List<Blog> list = this.iBlog.searchByName(name);
        request.setAttribute("list", list);
        RequestDispatcher dispatcher = request.getRequestDispatcher("blog/list.jsp");
        dispatcher.forward(request, response);
    }
}
