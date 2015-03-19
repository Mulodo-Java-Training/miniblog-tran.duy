package duy.miniblog.dao.impl;

import java.util.List;

import duy.miniblog.dao.UserDAO;
import duy.miniblog.entity.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class UserDAOImpl implements UserDAO
{

    @Autowired
    private HibernateTemplate template;

    public void setTemplate(HibernateTemplate template)
    {
        this.template = template;
    }

    @Override
    @Transactional(readOnly = false)
    public void createUser(User user)
    {
        template.save(user);
    }

    @Override
    @Transactional(readOnly = false)
    public void updateUser(User user)
    {
        template.update(user);
    }

    @Override
    @Transactional(readOnly = false)
    public void deleteUser(User user)
    {
        template.delete(user);
    }

    @Override
    @Transactional(readOnly = false)
    public User getUserById(int id)
    {
        User user = (User) template.get(User.class, id);
        return user;
    }

    @Override
    @Transactional(readOnly = false)
    public List<User> getUserByName(String name)
    {
        String query = "from users where firstname = ? or lastname = ? ";
        @SuppressWarnings("unchecked")
        List<User> list = template.find(query, name);
        return list;
    }

    @Override
    @Transactional(readOnly = false)
    public List<User> getAllUsers()
    {
        List<User> list = template.loadAll(User.class);
        return list;
    }

    @Override
    @Transactional(readOnly = false)
    public User checkLogin(String username, String password)
    {
        @SuppressWarnings("unchecked")
        List<User> list = template.find("from User where username = ? and password = ?", username,
                password);
        if (list.size() != 1) {
            return null;
        } else {
            return list.get(0);
        }
    }

    @Override
    @Transactional(readOnly = false)
    public Boolean checkUserName(String username)
    {
        @SuppressWarnings("unchecked")
        List<User> lst = template.find("from User where username = ?", username);
        if (lst.size() == 1) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    @Transactional(readOnly = false)
    public Boolean checkEmail(String email)
    {
        @SuppressWarnings("unchecked")
        List<User> lst = template.find("from User where email = ?", email);
        if (lst.size() == 1) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    @Transactional(readOnly = false)
    public List<User> searchByName(String name)
    {
        @SuppressWarnings("unchecked")
        List<User> lst = template.find(
                "select id, firstName, lastName from User where firstname = ? or lastname = ?",
                name, name);
        if (lst.size() >= 1) {
            return lst;
        } else {
            return null;
        }
    }

}
