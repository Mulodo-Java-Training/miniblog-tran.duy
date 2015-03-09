package duy.miniblog.controller;

import javax.ws.rs.HeaderParam;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LayoutController
{

    @RequestMapping(value="welcome")
    public String home(@HeaderParam("accessToken") String accessToken) throws Exception
    {
    	if(accessToken == null) return "Welcome";
    	return "Home";
    }
    
    @RequestMapping(value="test")
    public String test() throws Exception
    {
        return "Test"; 
    }
    
    @RequestMapping(value="register")
    public String register() throws Exception
    {
        return "Register";
    }
    
    @RequestMapping(value="test2") 
    public String test2() throws Exception
    {
        throw new Exception("Keep Moving Forward");
    }
}
