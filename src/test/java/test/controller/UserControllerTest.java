package test.controller;

import static org.junit.Assert.*;

import javax.ws.rs.core.Response;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import duy.miniblog.controller.UserController;


@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration("file:src/test/java/TestControllerContext.xml")
@ContextConfiguration
(
    {
        "file:src/main/webapp/WEB-INF/applicationContext.xml",
        "file:src/main/webapp/WEB-INF/DataSource.xml",
        "file:src/main/webapp/WEB-INF/Hibernate.xml",
        "file:src/main/webapp/WEB-INF/web.xml"
    }
)
public class UserControllerTest
{

    @Autowired
    private UserController userCtrl;
    
    @Test
    public void testLoginWithWrongUsernameOrPassword() throws Exception
    {
        Response resp = userCtrl.login("mothaiba", "bonnamsau");
        assertEquals(503, resp.getStatus());
        assertEquals("Error Code 2007", resp.getEntity());
    }
    
    @Test
    public void testLoginWithRightUsernameAndPassword() throws Exception
    {
        Response resp = userCtrl.login("user12", "111");
        assertEquals(201, resp.getStatus());
    }

    /*
     * Error 503 la do token doesn't exsist
     */
    /*
    @Test
    public void testLogoutWithAccessTokenExsisted() throws Exception
    {
        Response resp = userCtrl.logout("d57b53cc0123105d86f3376b6fb96bf0bd513c6e85dd9aab475028e2f9a6d028");
        assertEquals(200, resp.getStatus());        
    }
    */
    
    @Test
    public void testLogoutWithAccessTokenDoNotExsist() throws Exception
    {
        Response resp = userCtrl.logout("123321212");
        assertEquals(503, resp.getStatus());
    }
}
