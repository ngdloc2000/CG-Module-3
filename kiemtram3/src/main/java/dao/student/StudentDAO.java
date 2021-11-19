package dao.student;

import model.Student;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/kiemtram3?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "ngdloc1532k";

    private static final String FIND_ALL_STUDENT = "select * from student";
    private static final String SELECT_STUDENT_BY_ID = "select * from student where id =?";

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

    public List<Student> findAll() {
        List<Student> studentList = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(FIND_ALL_STUDENT)) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String className = rs.getString("className");
                studentList.add(new Student(id, name, className));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return studentList;
    }

    public Student findById(int id) {
        Student student = null;
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_STUDENT_BY_ID)) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String name = rs.getString("name");
                String className = rs.getString("className");
                student = new Student(id, name, className);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return student;
    }
}
