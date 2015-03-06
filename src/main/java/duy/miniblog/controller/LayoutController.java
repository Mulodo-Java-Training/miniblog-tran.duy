package duy.miniblog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LayoutController
{

    @RequestMapping(value="welcome")
    public String home()
    {
        return "Welcome";
    }
    
    @RequestMapping(value="test")
    public String test()
    {
        return "Test";
    }
    
    @RequestMapping(value="register")
    public String register()
    {
        return "Register";
    }
    
    @RequestMapping(value="test2")
    public String test2()
    {
        return "Test2";
    }
}
