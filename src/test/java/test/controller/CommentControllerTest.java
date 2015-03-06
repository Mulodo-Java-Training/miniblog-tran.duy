package test.controller;

import static org.junit.Assert.*;

import javax.ws.rs.core.Response;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import duy.miniblog.controller.CommentController;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration
(
    {
        "file:src/main/webapp/WEB-INF/applicationContext.xml",
        "file:src/main/webapp/WEB-INF/DataSource.xml",
        "file:src/main/webapp/WEB-INF/Hibernate.xml",
        //"file:src/main/webapp/WEB-INF/web.xml"
    }
)
public class CommentControllerTest
{

    @Autowired
    private CommentController cmCtrl;
    
    @Test
    public void testCreateCommentShouldFailBecauseAccessTokenNotExist() throws Exception
    {
        Response resp = cmCtrl.createComment("123", "This is gooooooood", "I like iiiitttttt", 11);
        assertEquals(503, resp.getStatus());
    }
    
    @Test
    public void testCreateCommentShouldFailBecausePostIdNotExist() throws Exception
    {
        Response resp = cmCtrl.createComment("91c0ab7276c6e1e3277c354d2a30775b2fc152f97b8f8b1a578fabb029dceec2",
                "Bài này hay!", "Hay quá chòi", 999999);
        assertEquals(503, resp.getStatus());
    }
    
    @Test
    public void testCreateCommentShouldSuccess() throws Exception
    {
        Response resp = cmCtrl.createComment("91c0ab7276c6e1e3277c354d2a30775b2fc152f97b8f8b1a578fabb029dceec2",
                "Bài này hay!", "Hay quá chòi", 11);
        assertEquals(201, resp.getStatus());
    }

    @Test
    public void testUpdateCommentShouldFailBecauseAccessTokenNotExist() throws Exception
    {
        Response resp = cmCtrl.updateComment("123", "Không Hiểu", "Muốn nói gì thế!", 3);
        assertEquals(503, resp.getStatus());
    }
    
    @Test
    public void testUpdateCommentShouldFailBecauseCommentIdNotExist() throws Exception
    {
        Response resp = cmCtrl.updateComment("fa34709de3ae6e7647fbbdf1d1bdade9892d78c0d70ff7aae9c0c732b3a868ed",
                "Không Hiểu", "Muốn nói gì thế!", 999999);
        assertEquals(503, resp.getStatus());
    }

    @Test 
    public void testUpdateCommentShouldSuccess() throws Exception
    {
        Response resp = cmCtrl.updateComment("fa34709de3ae6e7647fbbdf1d1bdade9892d78c0d70ff7aae9c0c732b3a868ed",
                "Không Hiểu", "Muốn nói gì thế!", 3);
        assertEquals(200, resp.getStatus());
    }
    
    @Test
    public void testDeleteCommentShouldFailBecauseAccessTokenNotExist() throws Exception
    {
        Response resp = cmCtrl.deleteComment("123", 5);
        assertEquals(503,  resp.getStatus());
    }
    
    @Test
    public void testDeleteCommentShouldFailBecauseCommentIdNotExist() throws Exception
    {
        Response resp = cmCtrl.deleteComment("0b69863af869acab2292bb56abd85833f90054bda8785af56210ce02434e361c", 999999);
        assertEquals(503, resp.getStatus());
    }

    @Test
    public void testDeleteCommentShouldSuccess() throws Exception
    {
        Response resp = cmCtrl.deleteComment("0b69863af869acab2292bb56abd85833f90054bda8785af56210ce02434e361c", 5);
        assertEquals("Comment has been deleted!", 200, resp.getStatus());
    }
    
    @Test
    public void testGetAllCommentsByPostIdShouldFailBecauseAccessTokenNotExist() throws Exception
    {
        Response resp = cmCtrl.getAllCommentsByPostId("123", 10);
        assertEquals(503, resp.getStatus());
    }
    
    @Test
    public void testGetAllCommentsByPostIdShouldFailBecausePostIdNotExist() throws Exception
    {
        Response resp = cmCtrl.getAllCommentsByPostId("fa34709de3ae6e7647fbbdf1d1bdade9892d78c0d70ff7aae9c0c732b3a868ed",
                999999);
        assertEquals(503, resp.getStatus());
    }
    
    @Test
    public void testGetAllcommentsByPostIdShouldSuccess() throws Exception
    {
        Response resp = cmCtrl.getAllCommentsByPostId("fa34709de3ae6e7647fbbdf1d1bdade9892d78c0d70ff7aae9c0c732b3a868ed",
                10);
        assertEquals(200, resp.getStatus());
    }

    @Test
    public void testGetAllCommentsByUserIdShouldFailBecauseAccessTokenNotExist() throws Exception
    {
        Response resp = cmCtrl.getAllCommentsByUserId("123");
        assertEquals(503, resp.getStatus());
    }
    
    @Test
    public void testGetAllCommentsByUserIdShouldSuccess() throws Exception
    {
        Response resp = cmCtrl.getAllCommentsByUserId("0b69863af869acab2292bb56abd85833f90054bda8785af56210ce02434e361c");
        assertEquals(200, resp.getStatus());
    }

}
