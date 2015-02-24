package duy.miniblog.controller;


import java.util.Collection;
import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.HeaderParam;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import duy.miniblog.dao.TokenDAO;
import duy.miniblog.dao.UserDAO;
import duy.miniblog.entity.Token;
import duy.miniblog.entity.User;
import duy.miniblog.util.Constant;
import duy.miniblog.util.DateUtil;
import duy.miniblog.util.EncryptionUtil;

@Controller
@Path("/v1")
@Produces(MediaType.APPLICATION_JSON)
public class UserController 
{

    @Autowired
    private UserDAO userDao;    

    @Autowired
    private TokenDAO tokenDao;
    
    /*
    @GET
    @Path("hello")
    public Response hello()
    {
        return Response.status(200).entity("I could show you incredible things").build();
    }
    */
    
    @POST
    @Path("users")  
    @Consumes("application/x-www-form-urlencoded")// the MIME media type of the request to a resource
    public Response createUser(@FormParam("username") String un, @FormParam("password") String ps, @FormParam("firstname") String fn, 
            @FormParam("lastname") String ln, @FormParam("gender") Integer gd, @FormParam("birthdate") String bd, 
            @FormParam("email") String em) throws Exception
    {
        if (userDao.checkUserName(un)){
            return Response.status(503).entity("Username exists! Try other name").build();
        } else {
            if (userDao.checkEmail(em)){
                return Response.status(503).entity("Email already have been used!").build();
            } else {
                User u = new User();
                u.setUserName(un);
                u.setPassWord(EncryptionUtil.encryptString(ps));
                u.setFirstName(fn);
                u.setLastName(ln);
                u.setGender(gd);
                u.setBirthDate(bd);
                u.setEmail(em);
                userDao.createUser(u);
                return Response.status(201).entity("Dang ki thanh cong!").build();
            }
        }
    }
    
    @POST
    @Path("login")
    @Consumes("application/x-www-form-urlencoded")
    public Response login(@FormParam("username") String un, @FormParam("password") String ps) throws Exception
    {
        User user;
        String accessToken = "";
        user = userDao.checkLogin(un, EncryptionUtil.encryptString(ps));    
        if(user != null){           
            accessToken = EncryptionUtil.encryptString(Constant.SECRET_KEY + user.getId() + DateUtil.createAt());
            Token t = new Token();
            t.setUser(user);
            t.setAccess_token(accessToken);
            t.setCreate_at(DateUtil.createAt());
            t.setExpired(DateUtil.expired());        
            tokenDao.createToken(t);
            return Response.status(201).entity(accessToken).build();
        } else {        
            //error code 2007: Login failed! Wrong username or password.
            return Response.status(503).entity("Error Code 2007").build();
            
        }
        
    }
    
    @POST
    @Path("logout")
    @Consumes("application/json")
    public Response logout(@HeaderParam("accessToken") String accessToken) throws Exception
    {
        if (tokenDao.checkToken(accessToken)) {
        tokenDao.deleteToken(tokenDao.getToken(accessToken));
        return Response.status(200).entity("Log out thanh cong").build();
        } else {
            return Response.status(503).entity("Token doesn't exsist!").build();
        }
    }
    
    @GET
    @Path("users")   
    @Produces("application/json")
    public Response getUserInfo(@HeaderParam("accessToken") String accessToken) throws Exception
    {           
       if (tokenDao.checkToken(accessToken)){
           Integer id = tokenDao.getToken(accessToken).getUser().getId();
           User user = userDao.getUserById(id);
           return Response.status(200).entity(user.toString()).build();
       } else {
           return Response.status(503).entity("Token have been deleted! Redirect to Home Page").build();
       }
    }
    
    @PUT
    @Path("users")
    @Consumes("application/x-www-form-urlencoded")
    public Response updateUserInfo(@HeaderParam("accessToken") String accessToken, @FormParam("firstname") String fn, 
            @FormParam("lastname") String ln,@FormParam("avatar") String av, @FormParam("gender") Integer gd, 
            @FormParam("email") String em) throws Exception
    {
        if (tokenDao.checkToken(accessToken)){            
            Integer id = tokenDao.getToken(accessToken).getUser().getId();
            User user = userDao.getUserById(id);
            user.setFirstName(fn);
            user.setLastName(ln);
            user.setAvatar(av);
            user.setGender(gd);            
            user.setEmail(em);
            userDao.updateUser(user);
            return Response.status(200).entity("Successfully Updated!").build();
        } else {
            return Response.status(500).entity("Error code 300x! Token doesn't exists.").build();
        }
    }
    
    @PUT
    @Path("users/changePassword")
    @Consumes("application/x-www-form-urlencoded")
    public Response changePassword(@HeaderParam("accessToken") String accessToken, @FormParam("oldpassword") String oldpass, 
            @FormParam("newpassword") String newpass, @FormParam("confirmpassword") String confirmpass) throws Exception
    {
        if (tokenDao.checkToken(accessToken)){
            if (newpass.compareTo(confirmpass) == 0){
                Integer id = tokenDao.getToken(accessToken).getUser().getId();
                User user = userDao.getUserById(id);
                if (EncryptionUtil.encryptString(oldpass).compareTo(user.getPassWord()) == 0){
                    user.setPassWord(EncryptionUtil.encryptString(newpass));
                    userDao.updateUser(user);
                    tokenDao.deleteTokenByUserId(id);
                    return Response.status(200).entity("Change password successful!").build();
                } else {
                    return Response.status(200).entity("Error code 200x! Password doesn't match.").build();
                }
            } else {
                return Response.status(200).entity("Error code 200x! New and Confirm doesn't match.").build();
            }
        } else {
            return Response.status(503).entity("Error code 300x! Token doesn't exists.").build();
        }
    }
    
    @GET
    @Path("users/search")
    @Produces("application/json")
    public Response getSearchResult(@QueryParam("name") String name)
    {        
        List<User> lst = userDao.searchByName(name);
        if (lst != null){            
            return Response.status(200).entity(lst).build();            
        } else {
            return Response.status(503).entity("Not Found User!").build();
        }
    }
}
