package controller;

import dao.UserDAO;
import model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "UserServlet", value = "/users")
public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;

    public void init() {
        userDAO = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        try {
            switch (action) {
                case "create":
                    showNewForm(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "delete":
                    deleteUser(request, response);
                    break;
                case "sort":
                    sortName(request, response);
                    break;
                case "selectAllUsersByCountry":
                    selectAllUsersByCountry(request, response);
                    break;
                case "permision":
                    addUserPermision(request, response);
                    break;
                default:
                    listUser(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    insertUser(request, response);
                    break;
                case "edit":
                    updateUser(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listUser(HttpServletRequest request, HttpServletResponse response) {
//        List<User> listUser = this.userDAO.selectAllUsers();
        List<User> listUser = this.userDAO.findAllUser();
        request.setAttribute("listUser", listUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
//        User user = this.userDAO.selectUser(id);
        User user = this.userDAO.getUserById(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/edit.jsp");
        request.setAttribute("user", user);
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void insertUser(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        User user = new User(name, email, country);
        try {
//            this.userDAO.insertUser(user);
            this.userDAO.insertUserStore(user);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");

        User book = new User(id, name, email, country);
//        userDAO.updateUser(book);
        userDAO.editUser(book);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/edit.jsp");
        dispatcher.forward(request, response);
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
//        this.userDAO.deleteUser(id);
        this.userDAO.removeUser(id);
        List<User> listUser = userDAO.selectAllUsers();
        request.setAttribute("listUser", listUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/list.jsp");
        dispatcher.forward(request, response);
    }

    private void selectAllUsersByCountry(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String country = request.getParameter("country");
        List<User> users = this.userDAO.selectUserByCountry(country);
        request.setAttribute("listUser", users);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/list.jsp");
        dispatcher.forward(request, response);
    }

    private void sortName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> users = this.userDAO.sortUserName();
        request.setAttribute("listUser", users);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/list.jsp");
        dispatcher.forward(request, response);
    }

    private void addUserPermision(HttpServletRequest request, HttpServletResponse response) {
        User user = new User("quan", "quan.nguyen@codegym.vn", "vn");

        int[] permision = {1, 2, 4};

        userDAO.addUserTransaction(user, permision);
    }
}
