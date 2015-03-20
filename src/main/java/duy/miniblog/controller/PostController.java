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
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

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
public class PostController
{
    @Autowired
    private UserService userService;

    @Autowired
    private TokenService tokenService;

    @Autowired
    private PostService postService;

    @Autowired
    private CommentService cmService;

    @POST
    @Path("posts")
    @Consumes("application/x-www-form-urlencoded")
    public Response createPost(@HeaderParam("accessToken") String accessToken,

    @NotBlank(message = "{title.NotBlank}") @FormParam("title") String title,

    @NotBlank(message = "{description.NotBlank}") @FormParam("description") String description)
    {
        try {
            if (!tokenService.checkToken(accessToken))
                return Response.status(503).entity("You must login!").build();
            Integer id = tokenService.getToken(accessToken).getUser().getId();
            User user = userService.getUserById(id);
            Post post = new Post();
            post.setTitle(title);
            post.setDescription(description);
            post.setCreated_at(DateUtil.createAt());
            post.setUpdated_at(DateUtil.createAt());
            post.setUser(user);
            postService.createPost(post);
            return Response.status(201).entity("Create Post Success").build();
        } catch (Exception ex) {
            return Response.status(500).entity("Server Error: " + ex.getMessage()).build();
        }
    }

    @GET
    @Path("posts")
    public Response getAllPosts()
    {
        List<Post> post = postService.getAllPosts();
        return Response.status(200).entity(post.toString()).build();
    }

    /*
     * @GET
     * @Path("posts") public Response getAllPosts(@HeaderParam("accessToken")
     * String accessToken) { try { if (!tokenService.checkToken(accessToken))
     * return Response.status(503).entity("You must login!").build(); List<Post>
     * post = postService.getAllPosts(); return
     * Response.status(200).entity(post).build(); } catch (Exception ex) {
     * return Response.status(500).entity("Server Error: " +
     * ex.getMessage()).build(); } }
     */

    @GET
    @Path("post/{postId}")
    public Response getPostByPostId(@PathParam("postId") Integer postId)
    {
        Post post = postService.getPostById(postId);
        return Response.status(200).entity(post).build();
    }

    @GET
    @Path("posts/users")
    @Produces("application/json")
    public Response getAllPostsByUserWithToken(@HeaderParam("accessToken") String accessToken)
    {
        try {
            if (!tokenService.checkToken(accessToken))
                return Response.status(503).entity("You must login").build();
            Integer userId = tokenService.getToken(accessToken).getUser().getId();
            List<Post> post = postService.getAllPostsByUserId(userId);
            return Response.status(200).entity(post).build();
        } catch (Exception ex) {
            return Response.status(500).entity("Server Error: " + ex.getMessage()).build();
        }
    }

    @GET
    @Path("posts/users/{userId}")
    public Response getAllPostsByUserId(@PathParam("userId") Integer userId)
    {
        List<Post> post = postService.getAllPostsByUserId(userId);
        return Response.status(200).entity(post).build();
    }
    @PUT
    @Path("posts/{postId}")
    @Consumes("application/x-www-form-urlencoded")
    public Response updatePost(@HeaderParam("accessToken") String accessToken,
            @PathParam("postId") Integer postId,

            @NotBlank(message = "{title.NotBlank}") @FormParam("title") String tit,

            @NotBlank(message = "{description.NotBlank}") @FormParam("description") String desc)
    {
        try {
            if (!tokenService.checkToken(accessToken))
                return Response.status(503).entity("You must login").build();
            Post post = postService.getPostById(postId);
            post.setTitle(tit);
            post.setDescription(desc);
            post.setUpdated_at(DateUtil.createAt());
            postService.updatePost(post);
            return Response.status(200).entity("Update successful!").build();
        } catch (Exception ex) {
            return Response.status(500).entity("Server Error: " + ex.getMessage()).build();
        }
    }

    @PUT
    @Path("posts/{postId}")
    @Consumes("application/x-www-form-urlencoded")
    public Response deactivePost(@HeaderParam("accessToken") String accessToken,
            @PathParam("postId") Integer postId, @QueryParam("deactive") Integer deactive)
    {
        try {
            if (!tokenService.checkToken(accessToken))
                return Response.status(503).entity("You must login!").build();
            Post post = postService.getPostById(postId);
            if (post == null)
                return Response.status(503).entity("Post has already been delete!").build();
            post.setDeactived(deactive);
            post.setUpdated_at(DateUtil.createAt());
            postService.updatePost(post);
            return Response.status(200).entity("Deactived Successful!").build();
        } catch (Exception ex) {
            return Response.status(500).entity("Server Error: " + ex.getMessage()).build();
        }
    }

    @DELETE
    @Path("posts/{postId}")
    public Response deletePost(@HeaderParam("accessToken") String accessToken,
            @PathParam("postId") Integer postId)
    {
        if (!tokenService.checkToken(accessToken))
            return Response.status(503).entity("You must login!").build();
        Post post = postService.getPostById(postId);
        if (post == null)
            return Response.status(503).entity("Post has already been deleted!").build();
        cmService.deleteAllCommentsByPostId(postId);
        postService.deletePost(post);
        return Response.status(200).entity("Delete Successful!").build();
    }

}
