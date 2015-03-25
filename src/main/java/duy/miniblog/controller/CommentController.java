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

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.google.gson.Gson;

import duy.miniblog.entity.Comment;
import duy.miniblog.entity.Post;
import duy.miniblog.entity.User;
import duy.miniblog.service.CommentService;
import duy.miniblog.service.PostService;
import duy.miniblog.service.TokenService;
import duy.miniblog.service.UserService;
import duy.miniblog.util.DateUtil;

@Controller
@Path("v1")
@Produces(MediaType.APPLICATION_JSON)
public class CommentController
{
    
    private static final Gson gson = new Gson();

    @Autowired
    private UserService userService;

    @Autowired
    private TokenService tokenService;

    @Autowired
    private PostService postService;

    @Autowired
    private CommentService commentService;

    @POST
    @Path("posts/{postId}/comments")
    @Consumes("application/x-www-form-urlencoded")
    public Response createComment(
            @HeaderParam("accessToken") String accessToken,
            @FormParam("title") String title,

            @NotBlank(message = "{description.NotBlank}") @FormParam("description") String description,
            @PathParam("postId") Integer postId)
    {
        try {
            if (!tokenService.checkToken(accessToken))
                return Response.status(503).entity("You must login!").build();
            User user = tokenService.getToken(accessToken).getUser();
            Post post = postService.getPostById(postId);
            if (post == null)
                return Response.status(503).entity("Post doesn't exist!").build();
            Comment comment = new Comment();
            comment.setTitle(title);
            comment.setDescription(description);
            comment.setCreated_at(DateUtil.createAt());
            comment.setUpdated_at(DateUtil.createAt());
            comment.setUser(user);
            comment.setPost(post);
            commentService.createComment(comment);
            return Response.status(201).entity("Create Comment Successful!").build();
        } catch (Exception ex) {
            return Response.status(500).entity("Server Error: " + ex.getMessage()).build();
        }
    }

    @PUT
    @Path("posts/{postId}/comments/{commentId}")
    @Consumes("application/x-www-form-urlencoded")
    public Response updateComment(
            @HeaderParam("accessToken") String accessToken,
            @FormParam("title") String title,

            @NotBlank(message = "{description.NotBlank}") @FormParam("description") String description,
            @PathParam("commentId") Integer commentId)
    {
        try {
            if (!tokenService.checkToken(accessToken))
                return Response.status(503).entity("You must login!").build();
            Comment comment = commentService.getCommentById(commentId);
            if (comment == null)
                return Response.status(503).entity("Comment has been deleted!").build();
            comment.setTitle(title);
            comment.setDescription(description);
            comment.setUpdated_at(DateUtil.createAt());
            commentService.updateComment(comment);
            return Response.status(200).entity("Update Successful!").build();
        } catch (Exception ex) {
            return Response.status(500).entity("Server Error: " + ex.getMessage()).build();
        }
    }

    @DELETE
    @Path("posts/{postId}/comments/{commentId}")
    public Response deleteComment(@HeaderParam("accessToken") String accessToken,
            @PathParam("commentId") Integer commentId)
    {
        try {
            if (!tokenService.checkToken(accessToken))
                return Response.status(503).entity("You must login!").build();
            Comment comment = commentService.getCommentById(commentId);
            if (comment == null)
                return Response.status(503).entity("Comment has been deleted!").build();
            commentService.deleteComment(comment);
            return Response.status(200).entity("Delete Successful!").build();
        } catch (Exception ex) {
            return Response.status(500).entity("Server Error: " + ex.getMessage()).build();
        }
    }

    @GET
    @Path("posts/{postId}/comments")
    public Response getAllCommentsByPostId(@HeaderParam("accessToken") String accessToken,
            @PathParam("postId") Integer postId)
    {
        try {
            if (!tokenService.checkToken(accessToken))
                return Response.status(503).entity("You must login!").build();
            List<Comment> lst = commentService.getCommentByPostId(postId);
            if (lst == null)
                return Response.status(200).entity("No Comments").build();
            return Response.status(200).entity(lst).build();
        } catch (Exception ex) {
            return Response.status(500).entity("Server Error: " + ex.getMessage()).build();
        }
    }
    
    @GET
    @Path("post/{postId}/comments")
    public Response getAllCommentsForAPost(@PathParam("postId") Integer postId)
    {
        try{
        List<Comment> lst = commentService.getCommentByPostId(postId);
        if (lst == null)
            return Response.status(200).entity(gson.toJson("No Comments")).build();
        return Response.status(202).entity(lst.toString()).build();
        } catch (Exception ex) {
            return Response.status(500).entity("Server Error: " + ex.getMessage()).build();
        }
    }

    @GET
    @Path("users/comments")
    public Response getAllCommentsByUserId(@HeaderParam("accessToken") String accessToken)
    {
        try {
            if (!tokenService.checkToken(accessToken))
                return Response.status(503).entity("You must login").build();
            Integer userId = tokenService.getToken(accessToken).getUser().getId();
            List<Comment> lst = commentService.getCommentByUserId(userId);
            if (lst == null)
                return Response.status(200).entity("No Comments").build();
            return Response.status(200).entity(lst).build();
        } catch (Exception ex) {
            return Response.status(500).entity("Server Error: ").build();
        }
    }
}
