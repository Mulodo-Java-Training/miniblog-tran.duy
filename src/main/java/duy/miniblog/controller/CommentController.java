package duy.miniblog.controller;

import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.HeaderParam;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import duy.miniblog.dao.CommentDAO;
import duy.miniblog.dao.PostDAO;
import duy.miniblog.dao.TokenDAO;
import duy.miniblog.dao.UserDAO;
import duy.miniblog.entity.Comment;
import duy.miniblog.entity.Post;
import duy.miniblog.entity.User;
import duy.miniblog.util.DateUtil;

@Controller
@Path("v1")
@Produces(MediaType.APPLICATION_JSON)
public class CommentController
{
    
    @Autowired
    private TokenDAO tokenDao;
    
    @Autowired
    private PostDAO postDao;
    
    @Autowired
    private UserDAO userDao;
    
    @Autowired
    private CommentDAO cmDao;
    
    @POST
    @Path("posts/{postId}/comments")
    @Consumes("application/x-www-form-urlencoded")
    public Response createComment(@HeaderParam("accessToken") String accessToken, @FormParam("title") String title, 
            @FormParam("description") String description, @PathParam("postId") Integer postId)
    {
        if (tokenDao.checkToken(accessToken)){
            User user = tokenDao.getToken(accessToken).getUser();
            Post post = postDao.getPostById(postId);
            if (post != null){
                Comment comment = new Comment();
                comment.setTitle(title);
                comment.setDescription(description);
                comment.setCreated_at(DateUtil.createAt());
                comment.setUpdated_at(DateUtil.createAt());
                comment.setUser(user);
                comment.setPost(post);
                cmDao.createComment(comment);
                return Response.status(201).entity("Create Comment Successful!").build();
            } else {
                return Response.status(503).entity("Post Id doesn't exists!").build();
            }            
        } else {
            return Response.status(503).entity("Token doesn't exists!").build();
        }
    }
    
    @PUT
    @Path("posts/{postId}/comments/{commentId}")
    @Consumes("application/x-www-form-urlencoded")
    public Response updateComment(@HeaderParam("accessToken") String accessToken, @FormParam("title") String title, 
            @FormParam("description") String description, @PathParam("commentId") Integer commentId)
    {
        if (tokenDao.checkToken(accessToken)){
            Comment comment = cmDao.getCommentById(commentId);
            if (comment != null){
                comment.setTitle(title);
                comment.setDescription(description);
                comment.setUpdated_at(DateUtil.createAt());
                cmDao.updateComment(comment);
                return Response.status(200).entity("Update Successful!").build();
            } else {
                return Response.status(503).entity("Error code 300x!").build();
            }
        } else {
            return Response.status(503).entity("Token doesn't exists!").build();
        }
    }
    
    @DELETE
    @Path("posts/{postId}/comments/{commentId}")
    public Response deleteComment(@HeaderParam("accessToken") String accessToken, @PathParam("commentId") Integer commentId)
    {
        if (tokenDao.checkToken(accessToken)){
            Comment comment = cmDao.getCommentById(commentId);
            if (comment != null){
                cmDao.deleteComment(comment);
                return Response.status(200).entity("Delete Successful!").build();
            } else {
                return Response.status(503).entity("Error code 300x!").build();
            }
        } else {
            return Response.status(503).entity("Token doesn't exists!").build();
        }
    }
    
    @GET
    @Path("posts/{postId}/comments")
    public Response getAllCommentsByPostId(@HeaderParam("accessToken") String accessToken, @PathParam("postId") Integer postId)
    {
        if (tokenDao.checkToken(accessToken)){
            List<Comment> lst = cmDao.getCommentByPostId(postId);
            if (lst != null){
                return Response.status(200).entity(lst).build();
            } else {
                return Response.status(503).entity("Error code 300x!").build();
            }
        } else {
            return Response.status(503).entity("Token doesn't exists!").build();
        }
    }
    
    @GET
    @Path("users/comments")
    public Response getAllCommentsByUserId(@HeaderParam("accessToken") String accessToken)
    {
        if (tokenDao.checkToken(accessToken)){
            Integer userId = tokenDao.getToken(accessToken).getUser().getId();
            List<Comment> lst = cmDao.getCommentByUserId(userId);
            if (lst != null){
                return Response.status(200).entity(lst).build();
            } else {
                return Response.status(503).entity("Error code 300x!").build();
            }
        } else {
            return Response.status(503).entity("Token doesn't exists!").build();
        }
    }
}
