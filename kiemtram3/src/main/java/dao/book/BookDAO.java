package dao.book;

import model.Book;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/kiemtram3?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "ngdloc1532k";

    private static final String FIND_ALL_BOOK = "select * from book";
    private static final String SELECT_BOOK_BY_ID = "select * from book where id =?";
    private static final String UPDATE_BOOK = "update book set name = ?, author = ?, description = ?, quantity = ? where book.id = ?";

    public Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
            System.out.println("ket noi thanh cong");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            System.out.println("Ket noi khong thanh cong");
        }
        return connection;
    }

    public List<Book> findAll() {
        List<Book> bookList = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(FIND_ALL_BOOK)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String author = rs.getString("author");
                String description = rs.getString("description");
                int quantity = rs.getInt("quantity");
                bookList.add(new Book(id, name, author, description, quantity));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookList;
    }

    public Book findById(int id) {
        Book book = null;
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BOOK_BY_ID)) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String name = rs.getString("name");
                String author = rs.getString("author");
                String description = rs.getString("description");
                int quantity = rs.getInt("quantity");
                book = new Book(id, name, author, description, quantity);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return book;
    }

    public void update(int id, Book book) {
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_BOOK)) {
            preparedStatement.setString(1,book.getName());
            preparedStatement.setString(2,book.getActor());
            preparedStatement.setString(3,book.getDescription());
            preparedStatement.setInt(4,book.getQuantity());
            preparedStatement.setInt(5,id);
            int check = preparedStatement.executeUpdate();
            if (check == 0) {
                connection.rollback();
            } else {
                connection.commit();
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
}
