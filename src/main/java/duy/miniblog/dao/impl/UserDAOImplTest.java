package duy.miniblog.dao.impl;

import static org.junit.Assert.*;

import org.junit.Test;

import duy.miniblog.entity.User;

public class UserDAOImplTest {    

    @Test
    public void testCreateUser() {
        
        fail("Not yet implemented");
    }

    @Test
    public void testCheckLogin() {
        UserDAOImpl u = new UserDAOImpl();
        User user = new User();
        user = u.checkLogin("123", "456");
        assertNull(user);
        //fail("Not yet implemented");
    }

}
