package test.controller;

import static org.junit.Assert.*;

import javax.ws.rs.core.Response;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import duy.miniblog.controller.PostController;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration
(
    {
        "file:src/main/webapp/WEB-INF/applicationContext.xml",
        "file:src/main/webapp/WEB-INF/DataSource.xml",
        "file:src/main/webapp/WEB-INF/Hibernate.xml",
        "file:src/main/webapp/WEB-INF/web.xml"
    }
)
public class PostControllerTest
{

    @Autowired
    private PostController postCtrl;
    
    @Test
    public void testCreatePostShouldFailBecauseAccessTokenNotExist() throws Exception
    {
        Response resp = postCtrl.createPost("123", "Phep Cong", "Mot cong mot bang hai?");
        assertEquals(503, resp.getStatus());
    }

    @Test
    public void testCreatePostShouldSuccess() throws Exception
    {
        Response resp = postCtrl.createPost("fb0598baa8ac5f3490a4d02145e1b4de75e175875050b8a6bab64aeb8671b1a5",
                "Nguoi Ay", "Trinh Thang Binh");
        assertEquals(201, resp.getStatus());
    }
    
    @Test
    public void testGetAllPostsShouldFailBecauseAccessTokenNotExist() throws Exception
    {
        Response resp = postCtrl.getAllPosts("123");
        assertEquals(503, resp.getStatus());
    }
    
    @Test
    public void testGetAllPostsShouldSuccess() throws Exception
    {
        Response resp = postCtrl.getAllPosts("7711cef28d64917b12f9db936749e690a21cdb11dac14999e1046b8e0d915896");
        assertEquals(200, resp.getStatus());
    }

    @Test
    public void testGetAllPostsByUserIdShouldFailBecauseAccessTokenNotExist() throws Exception
    {
        Response resp = postCtrl.getAllPostsByUserId("123");
        assertEquals(503, resp.getStatus());
    }
    
    @Test
    public void testGetAllPostsByUserIdShouldSuccess() throws Exception
    {
        Response resp = postCtrl.getAllPostsByUserId("b5da24f91dc449b3fbf44966553d4f053a88fed21d67796e55e2eb135405b44f");
        assertEquals(200, resp.getStatus());
    }

    @Test
    public void testUpdatePostShouldFailBecauseAccessTokenNotExist() throws Exception
    {
        Response resp = postCtrl.updatePost("123", 11, "Đã Lâu Không Gặp", "Trịnh Thăng Bình");
        assertEquals(503, resp.getStatus());
    }
    
    @Test 
    public void testUpdatePostShouldFailBecausePostIdNotExist() throws Exception
    {
        Response resp = postCtrl.updatePost("4df3fdf82633ed1069b47861c474292810d4339740fea142a26a7f1e69522b6c",
                999999, "Đã Lâu Không Gặp", "Trịnh Thăng Bình");
        assertEquals(503, resp.getStatus());
    }
    
    @Test
    public void testUpdatePostShouldSuccess() throws Exception
    {
        Response resp = postCtrl.updatePost("4df3fdf82633ed1069b47861c474292810d4339740fea142a26a7f1e69522b6c",
                11, "Đã Lâu Không Gặp", "Trịnh Thăng Bình");
        assertEquals(200, resp.getStatus());
    }

    @Test
    public void testDeactivePostShouldFailBecauseAccessTokenNotExist() throws Exception
    {
        Response resp = postCtrl.deactivePost("123", 10, 1);
        assertEquals(503, resp.getStatus());
    }
    
    @Test
    public void testDeactivePostShouldFailBecausePostIdNotExist() throws Exception
    {
        Response resp = postCtrl.deactivePost("b5da24f91dc449b3fbf44966553d4f053a88fed21d67796e55e2eb135405b44f",
                999999, 1);
        assertEquals(503, resp.getStatus());
    }
    
    @Test
    public void testDeactivePostShouldSuccess() throws Exception
    {
        Response resp = postCtrl.deactivePost("b5da24f91dc449b3fbf44966553d4f053a88fed21d67796e55e2eb135405b44f",
                10, 1);
        assertEquals(200, resp.getStatus());
    }

    @Test
    public void testDeletePostShouldFailBecauseAccessTokenNotExist() throws Exception
    {
        Response resp = postCtrl.deletePost("123", 5);
        assertEquals(503, resp.getStatus());
    }
    
    @Test
    public void testDeletePostShouldFailBecausePostIdNotExist() throws Exception
    {
        Response resp = postCtrl.deletePost("fa34709de3ae6e7647fbbdf1d1bdade9892d78c0d70ff7aae9c0c732b3a868ed",
                999999);
        assertEquals(503, resp.getStatus());
    }
    
    @Test
    public void testDeletePostShouldSuccess() throws Exception
    {
        Response resp = postCtrl.deletePost("fa34709de3ae6e7647fbbdf1d1bdade9892d78c0d70ff7aae9c0c732b3a868ed", 5);
        assertEquals("Post has been deleted!", 200, resp.getStatus());
    }
    

}
