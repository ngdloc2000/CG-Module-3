package dao;

import model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserDAO {
    public void insertUser(User user) throws SQLException;

    public User selectUser(int id);

    public List<User> selectAllUsers();

    public boolean deleteUser(int id) throws SQLException;

    public boolean updateUser(User user) throws SQLException;

    public List<User> selectUserByCountry(String country);

    public List<User> sortUserName();

    // Thu tuc

    User getUserById(int id);

    void insertUserStore(User user) throws SQLException;

    List<User> findAllUser();

    boolean editUser(User user) throws SQLException;

    boolean removeUser(int id) throws SQLException;

    void addUserTransaction(User user, int[] permision);
}
