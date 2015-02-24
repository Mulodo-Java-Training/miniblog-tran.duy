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


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import duy.miniblog.dao.PostDAO;
import duy.miniblog.dao.TokenDAO;
import duy.miniblog.dao.UserDAO;
import duy.miniblog.entity.Post;
import duy.miniblog.entity.User;
import duy.miniblog.util.DateUtil;

@Controller
@Path("v1")
@Produces(MediaType.APPLICATION_JSON)
public class PostController 
{
    @Autowired
    private TokenDAO tokenDao;
    
    @Autowired
    private PostDAO postDao;
    
    @Autowired
    private UserDAO userDao;
    
    @POST
    @Path("posts")
    @Consumes("application/x-www-form-urlencoded")
    public Response createPost(@HeaderParam("accessToken") String accessToken, @FormParam("title") String title, 
            @FormParam("description") String description) 
    {
        if (tokenDao.checkToken(accessToken)){
            Integer id = tokenDao.getToken(accessToken).getUser().getId();
            User user = userDao.getUserById(id);
            Post post = new Post();
            post.setTitle(title);
            post.setDescription(description);
            post.setCreated_at(DateUtil.createAt());
            post.setUpdated_at(DateUtil.createAt());
            post.setUser(user);
            postDao.createPost(post);
            return Response.status(201).entity("Create Post Success").build();
        } else {
            return Response.status(503).entity("Token doesn't exists!").build();
        }
    }
    
    @GET
    @Path("posts")    
    public Response getAllPosts(@HeaderParam("accessToken") String accessToken)
    {
        if (tokenDao.checkToken(accessToken)) {
            List<Post> post = postDao.getAllPosts();         
            return Response.status(200).entity(post).build(); 
        } else {
            return Response.status(503).entity("Token doesn't exists!").build();                    
        }
    }
    
    @GET
    @Path("posts/users")
    @Produces("application/json")
    public Response getAllPostsByUserId(@HeaderParam("accessToken") String accessToken)
    {
        if (tokenDao.checkToken(accessToken)){
            Integer userId = tokenDao.getToken(accessToken).getUser().getId();
            List<Post> post = postDao.getAllPostsByUserId(userId);
            return Response.status(200).entity(post).build();
        } else {
            return Response.status(503).entity("Token doesn't exists!").build();
        }
    }
    
    @PUT
    @Path("posts/{postId}")
    @Consumes("application/x-www-form-urlencoded")
    public Response updatePost(@HeaderParam("accessToken") String accessToken, @PathParam("postId") Integer postId, 
            @FormParam("title") String tit, @FormParam("description") String desc)
    {
        if (tokenDao.checkToken(accessToken)){
            try {
                Post post = postDao.getPostById(postId);
                post.setTitle(tit);
                post.setDescription(desc);
                post.setUpdated_at(DateUtil.createAt());
                postDao.updatePost(post);
                return Response.status(200).entity("Update successful!").build();
            } catch (Exception e) {
                return Response.status(503).entity("Error code 300x! "+e.getMessage()).build();
            }
        } else {
            return Response.status(503).entity("Token doesn't exists!").build();
        }
             
    }
    
    @PUT
    @Path("posts/{postId}")
    @Consumes("application/x-www-form-urlencoded")
    public Response deactivePost(@HeaderParam("accessToken") String accessToken, @PathParam("postId") Integer postId, 
            @QueryParam("deactive") Integer deactive)
    {
        if (tokenDao.checkToken(accessToken)){
            Post post = postDao.getPostById(postId);
            if (post != null){
                post.setDeactived(deactive);
                post.setUpdated_at(DateUtil.createAt());
                postDao.updatePost(post);
                return Response.status(200).entity("Deactived!").build();
            } else {
                return Response.status(503).entity("Error code 300x!").build();
            }
        } else {
            return Response.status(503).entity("Token doesn't exists!").build();
        }
    }
    
    @DELETE
    @Path("posts/{postId}")
    public Response deletePost(@HeaderParam("accessToken") String accessToken, @PathParam("postId") Integer postId)
    {
        if (tokenDao.checkToken(accessToken)){          
            Post post = postDao.getPostById(postId);
                if (post != null){                    
                postDao.deletePost(post);
                return Response.status(200).entity("Delete Successful!").build();           
            } else {
                return Response.status(503).entity("Error code 300x!").build();
            }
        } else {
            return Response.status(503).entity("Token doesn't exists!").build();
        }
    }
    
}
