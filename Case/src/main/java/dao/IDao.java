package dao;

import java.util.List;

public interface IDao<T> {
    List<T> findAll();

    T findById(int id);
}
