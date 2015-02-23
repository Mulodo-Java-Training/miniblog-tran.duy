package duy.miniblog.dao;

import java.util.Collection;
import java.util.List;

import duy.miniblog.entity.User;

public interface UserDAO {


    public void createUser(User user);
    
    public void updateUser(User user);
    
    public void deleteUser(User user);
    
    public User getUserById(int id);
    
    public List<User> getUserByName(String name);
    
    public List<User> getAllUsers();
    
    public User checkLogin(String username, String password);
    
    public Boolean checkUserName(String username);
    
    public Boolean checkEmail(String email);
    
    public List<User> searchByName(String name);
}
