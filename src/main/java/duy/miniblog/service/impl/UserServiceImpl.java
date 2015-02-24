package duy.miniblog.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import duy.miniblog.dao.UserDAO;
import duy.miniblog.entity.User;
import duy.miniblog.service.UserService;

@Service
public class UserServiceImpl implements UserService{
    
    @Autowired
    private UserDAO userDao;
    
    @Override
    public void createUser(User user)
    {
        userDao.createUser(user);
    }
    
    @Override
    public void updateUser(User user)
    {
        userDao.updateUser(user);
    }
    
    @Override
    public void deleteUser(User user)
    {
        userDao.deleteUser(user);
    }
    
    @Override
    public User getUserById(int id)
    {
       return userDao.getUserById(id);
    }
    
    @Override
    public List<User> getUserByName(String name)
    {
        return userDao.getUserByName(name);
    }
    
    @Override
    public List<User> getAllUsers()
    {
        return userDao.getAllUsers();
    }
    
    @Override
    public User checkLogin(String username, String password)
    {
        return userDao.checkLogin(username, password);
    }
    
    @Override
    public Boolean checkUserName(String username)
    {
        return userDao.checkUserName(username);
    }
    
    @Override
    public Boolean checkEmail(String email)
    {
        return userDao.checkEmail(email);
    }
    
    @Override
    public List<User> searchByName(String name)
    {
        return userDao.searchByName(name);
    }

}
