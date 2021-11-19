package dao.card;

import dao.book.BookDAO;
import dao.student.StudentDAO;
import model.Book;
import model.Card;
import model.Student;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CardDAO {
    BookDAO bookDAO = new BookDAO();
    StudentDAO studentDAO = new StudentDAO();

    private String jdbcURL = "jdbc:mysql://localhost:3306/kiemtram3?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "ngdloc1532k";

    private static final String FIND_ALL_CARD = "select * from card";
    public static final String FIND_CARD_BY_ID = "select * from card where id = ?";
    public static final String INSERT_CARD = "insert into card(idBook, idStudent, status, borrowDate, payDate) VALUE (?,?,?,?,?);";
    public static final String UPDATE_CARD = "update card set idBook = ?, idStudent = ?, status = ?, borrowDate = ?, payDate = ? where card.id = ?";

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

    public List<Card> findAll() {
        List<Card> cardList = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(FIND_ALL_CARD)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int idCard = rs.getInt("id");
                int idBook = rs.getInt("idBook");
                int idStudent = rs.getInt("idStudent");
                boolean status = rs.getBoolean("status");
                String borrowDate = rs.getString("borrowDate");
                String payDate = rs.getString("payDate");
                Book book = bookDAO.findById(idBook);
                Student student = studentDAO.findById(idStudent);
                cardList.add(new Card(idCard, book, student, status, borrowDate, payDate));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cardList;
    }

    public Card findCardById(int id) {
        Card card = null;
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(FIND_CARD_BY_ID)) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int idCard = rs.getInt("id");
                int idBook = rs.getInt("idBook");
                int idStudent = rs.getInt("idStudent");
                boolean status = rs.getBoolean("status");
                String borrowDate = rs.getString("borrowDate");
                String payDate = rs.getString("payDate");
                Book book = bookDAO.findById(idBook);
                Student student = studentDAO.findById(idStudent);
                card = new Card(idCard, book, student, status, borrowDate, payDate);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return card;
    }

    public void insertCart(Card card) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CARD)) {
            preparedStatement.setInt(1, card.getBook().getId());
            preparedStatement.setInt(2, card.getStudent().getId());
            preparedStatement.setBoolean(3, card.isStatus());
            preparedStatement.setString(4, card.getBorrowedDate());
            preparedStatement.setString(5, card.getPayDate());
            int check = preparedStatement.executeUpdate();
            if (check == 0) {
                connection.rollback();
            } else {
                connection.commit();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void update(int id, Card card) {
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_CARD)) {
            preparedStatement.setInt(1, card.getId());
            preparedStatement.setInt(2, card.getBook().getId());
            preparedStatement.setInt(3, card.getStudent().getId());
            preparedStatement.setBoolean(4, card.isStatus());
            preparedStatement.setString(5, card.getBorrowedDate());
            preparedStatement.setString(6, card.getPayDate());
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
