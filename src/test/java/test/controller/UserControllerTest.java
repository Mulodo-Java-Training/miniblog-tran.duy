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
    public void createUserShouldFailBecauseUserNameExisted() throws Exception
    {
        Response resp = userCtrl.createUser("user6", "111", "111", "111", 1, "1989-10-02", "mulodo@gmail.com");
        assertEquals("Username Exsisted!", 503, resp.getStatus());
    }
    
    @Test
    public void createUserShouldFailBecauseEmailExisted() throws Exception
    {
        Response resp = userCtrl.createUser("user6", "111", "111", "111", 1, "1989-10-02", "abc@gmail.com");
        assertEquals("Email exsisted!", 503, resp.getStatus());
    }
    
    @Test
    public void createUserShouldBeCreated() throws Exception
    {
        Response resp = userCtrl.createUser("user16", "192", "tam", "vo", 1, "1990-04-03", "votam@gmail.com");
        assertEquals("User has been created!", 201, resp.getStatus());
    }
    
    @Test
    public void loginShouldFailCauseWrongUserNameOrPassword() throws Exception
    {
        Response resp = userCtrl.login("mothaiba", "bonnamsau");
        assertEquals("Username or Password is wrong!", 503, resp.getStatus());
    }
    
    @Test
    public void loginShouldReturnAccessTokenWhenLoginSuccessful() throws Exception
    {
        Response resp = userCtrl.login("user12", "111");
        assertEquals(201, resp.getStatus());
    }

    /*
     * Error 503 la do token doesn't exsist
     */
    
    @Test
    public void logoutShouldDeleteAccessToken() throws Exception
    {
        Response resp = userCtrl.logout("d3fdfc9a174e734fdedd77568d5dff393b08d9937c098ec218be78a5d7b5226f");
        assertEquals("Token doesn't exist!", 200, resp.getStatus());        
    }
    
    
    @Test
    public void logoutShouldReturnErrorWhenAccessTokenNotExist() throws Exception
    {
        Response resp = userCtrl.logout("123321212");
        assertEquals(503, resp.getStatus());
    }
    
    @Test
    public void getUserInfoShouldFailWhenAccessTokenNotExist() throws Exception
    {
        Response resp = userCtrl.getUserInfo("123");
        assertEquals(503, resp.getStatus());
    }
    
    @Test
    public void getUserInfoShouldSuccess() throws Exception
    {
        Response resp = userCtrl.getUserInfo("a8ba0665137af10aeafe08c609a77be336ae9cfeb42025c9ae2e52056ab473dd");
        assertEquals(200, resp.getStatus());
    }
    
    @Test 
    public void updateUserInfoShouldFailWhenAccessTokenNotExist() throws Exception
    {
        Response resp = userCtrl.updateUserInfo("123", "john", "smith", "john.jpg", 1, "johmsmith@gmail.com");
        assertEquals(500, resp.getStatus());
    }
    
    @Test
    public void updateUserInfoShouldSuccess() throws Exception
    {
        Response resp = userCtrl.updateUserInfo("b5da24f91dc449b3fbf44966553d4f053a88fed21d67796e55e2eb135405b44f", "Four6", "Fantastic6", "jessica6.jpg", 0, "jessica6@gmail.com");
        assertEquals(200, resp.getStatus());
    }
    
    @Test
    public void changePasswordShouldFailWhenAccessTokenNotExist() throws Exception
    {
        Response resp = userCtrl.changePassword("123", "111", "192", "192");
        assertEquals(503, resp.getStatus());
    }
    
    @Test
    public void changePasswordShouldFailBecauseOldPasswordNotMatch() throws Exception
    {
        Response resp = userCtrl.changePassword("006f34f7d3c4e0d00ddc6d8fb7f26a63f406f31cb15d6bea078831e623483752", "192192", "192", "192");
        assertEquals(503, resp.getStatus());
    }
    
    @Test
    public void changePasswordShouldFailBecauseNewPassNotMatchWithConfirmPass() throws Exception
    {
        Response resp = userCtrl.changePassword("006f34f7d3c4e0d00ddc6d8fb7f26a63f406f31cb15d6bea078831e623483752", "111", "192", "199");
        assertEquals(503, resp.getStatus());
    }
    
    @Test
    public void changePasswordShouldSuccess() throws Exception
    {
        Response resp = userCtrl.changePassword("03b30e35a515fad626c589df59ef07d943d6574c0a972b2e8da5127728a27520", "192", "111", "111");
        assertEquals("Old Password doesn't match!", 200, resp.getStatus());
    }
    
    @Test
    public void getSearchResultShouldReturnNotFound() throws Exception
    {
        Response resp = userCtrl.getSearchResult("adfhdfoojddkkeigjg");
        assertEquals(503, resp.getStatus());
    }
    
    @Test
    public void getSearchResultShouldReturnListUserHasFound() throws Exception
    {
        Response resp = userCtrl.getSearchResult("duy");
        assertEquals(200, resp.getStatus());
    }
}
