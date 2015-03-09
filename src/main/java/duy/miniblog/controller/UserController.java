package duy.miniblog.controller;


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
import javax.ws.rs.core.Response.ResponseBuilder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import duy.miniblog.entity.Token;
import duy.miniblog.entity.User;
import duy.miniblog.service.TokenService;
import duy.miniblog.service.UserService;
import duy.miniblog.util.Constant;
import duy.miniblog.util.DateUtil;
import duy.miniblog.util.EncryptionUtil;

@Controller
@Path("/v1")
@Produces(MediaType.APPLICATION_JSON)
public class UserController 
{

    @Autowired
    private UserService userService;
    
    @Autowired
    private TokenService tokenService;
    
    @POST
    @Path("users")  
    @Consumes("application/x-www-form-urlencoded")// the MIME media type of the request to a resource
    public Response createUser(@FormParam("username") String un, @FormParam("password") String ps, @FormParam("firstname") String fn, 
            @FormParam("lastname") String ln, @FormParam("gender") Integer gd, @FormParam("birthdate") String bd, 
            @FormParam("email") String em) throws Exception
    {
    	try {
    		if (userService.checkUserName(un)) 
    			return Response.status(503).entity("Username exists! Try other name").build();
    		if (userService.checkEmail(em))
    			return Response.status(503).entity("Email has been used! Try new one").build();
    		User u = new User();
            u.setUserName(un);
            u.setPassWord(EncryptionUtil.encryptString(ps));
            u.setFirstName(fn);
            u.setLastName(ln);
            u.setGender(gd);
            u.setBirthDate(bd);
            u.setEmail(em);
            userService.createUser(u);
            return Response.status(201).entity("Dang ki thanh cong!").build();
    	} catch (Exception ex){
    		return Response.status(500).entity("Server Error "+ ex.getMessage()).build();
    	}    	
    }
    
    @POST
    @Path("login")
    @Consumes("application/x-www-form-urlencoded")
    public Response login(@FormParam("username") String un, @FormParam("password") String ps) throws Exception
    {
    	try {
    		User user;
            String accessToken = "";
            user = userService.checkLogin(un, EncryptionUtil.encryptString(ps));
            if(user == null) return Response.status(503).entity("You must register!").build();
            accessToken = EncryptionUtil.encryptString(Constant.SECRET_KEY + user.getId() + DateUtil.createAt());
            Token t = new Token();
            t.setUser(user);
            t.setAccess_token(accessToken);
            t.setCreate_at(DateUtil.createAt());
            t.setExpired(DateUtil.expired());        
            tokenService.createToken(t);            
            return Response.status(201).entity(accessToken).header("accessToken", accessToken).build();
    	} catch (Exception ex) {
    		return Response.status(500).entity("Server Error " + ex.getMessage()).build();
    	}   
    }
    
    @POST
    @Path("logout")
    @Consumes("application/json")
    public Response logout(@HeaderParam("accessToken") String accessToken) throws Exception
    {
    	try {
    		tokenService.deleteToken(tokenService.getToken(accessToken));
    		return Response.status(200).entity("Log out thanh cong").build();
    	} catch (Exception ex) {
    		return Response.status(500).entity("Server Error " + ex.getMessage()).build();
    	}
    }
    
    @GET
    @Path("users")   
    @Produces("application/json")
    public Response getUserInfo(@HeaderParam("accessToken") String accessToken) throws Exception
    {  
    	try {
    		if (!tokenService.checkToken(accessToken)) return Response.status(503).entity("You must login!").build();
    		Integer id = tokenService.getToken(accessToken).getUser().getId();
            User user = userService.getUserById(id);
            return Response.status(200).entity(user.toString()).build();
    	} catch (Exception ex) {
    		return Response.status(500).entity("Server Error: " + ex.getMessage()).build();
    	}
    }
    
    @PUT
    @Path("users")
    @Consumes("application/x-www-form-urlencoded")
    public Response updateUserInfo(@HeaderParam("accessToken") String accessToken, 
    		@FormParam("firstname") String fn, @FormParam("lastname") String ln, 
    		@FormParam("avatar") String av, @FormParam("gender") Integer gd, 
            @FormParam("email") String em) throws Exception
    {
    	try {
    		if(!tokenService.checkToken(accessToken)) return Response.status(503).entity("You must login!").build();
    		Integer id = tokenService.getToken(accessToken).getUser().getId();
            User user = userService.getUserById(id);
            user.setFirstName(fn);
            user.setLastName(ln);
            user.setAvatar(av);
            user.setGender(gd);            
            user.setEmail(em);
            userService.updateUser(user);
            return Response.status(200).entity("Successfully Updated!").build();
    	} catch (Exception ex) {
    		return Response.status(500).entity("Server Error: " + ex.getMessage()).build();
    	}
    }
    
    @PUT
    @Path("users/changePassword")
    @Consumes("application/x-www-form-urlencoded")
    public Response changePassword(@HeaderParam("accessToken") String accessToken, @FormParam("oldpassword") String oldpass, 
            @FormParam("newpassword") String newpass, @FormParam("confirmpassword") String confirmpass) throws Exception
    {
    	try {
    		if (!tokenService.checkToken(accessToken)) return Response.status(503).entity("You must login!").build();
    		if (newpass.compareTo(confirmpass) != 0) return Response.status(503).entity("Confirm password doesn't match!").build();
            Integer id = tokenService.getToken(accessToken).getUser().getId();
            User user = userService.getUserById(id);
            if (EncryptionUtil.encryptString(oldpass).compareTo(user.getPassWord()) != 0) 
            	return Response.status(503).entity("Old password doesn't match!").build();
            user.setPassWord(EncryptionUtil.encryptString(newpass));
            userService.updateUser(user);
            tokenService.deleteTokenByUserId(id);
            return Response.status(200).entity("Change password successful!").build();
    	} catch (Exception ex) {
    		return Response.status(500).entity("Server Error: " + ex.getMessage()).build();
    	}
    }
    
    @GET
    @Path("users/search")
    @Produces("application/json")
    public Response getSearchResult(@QueryParam("name") String name)
    {        
    	try {
    		List<User> lst = userService.searchByName(name);
    		if (lst != null) return Response.status(200).entity(lst).build();
    		return Response.status(503).entity("Search Not Found").build();
    	} catch (Exception ex) {
    		return Response.status(500).entity("Server Error: " + ex.getMessage()).build();
    	}
    }
}
