package service;

import models.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserService {
    void insertUser(User user) throws SQLException;

    User selectUser(int id);

    boolean deleteUser(int id) throws SQLException;

    boolean updateUser(User user) throws SQLException;

    List<User> findByCountry(String country);

    List<User> findByName(String name);

    List<User> sort(String name);

    List<User> selectAllUser();

    List<User> viewAll();

    void updateSp(User user);

    void deleteSp(int id);
}
