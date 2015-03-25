package duy.miniblog.controller;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import duy.miniblog.entity.ATest;
import duy.miniblog.entity.User;
import duy.miniblog.service.PostService;

@Controller
public class LayoutController
{

    @Autowired
    private PostService postService;

    private static final Logger logger = LoggerFactory.getLogger(LayoutController.class);

    @RequestMapping(value = "ajax", method = RequestMethod.GET)
    public String ajaxTest()
    {
        return "Ajax";
    }
    
    @RequestMapping(value = "postDetail", method = RequestMethod.GET)
    public String postDetail()
    {
        return "PostDetail";
    }
    
    @RequestMapping(value = "getPosts", method = RequestMethod.GET)
    public String getAllPosts(Model model)
    {
        model.addAttribute("list", postService.getAllPosts());
        return "AllPosts";
    }

    @RequestMapping(value = "welcome")
    public String home(Model model) throws Exception
    {
        logger.info("call home() method");
        model.addAttribute("listAllPosts", postService.getAllPosts());
        return "Welcome";
    }

    @RequestMapping(value = "validateForm", method = RequestMethod.GET)
    public String returnForm(ModelMap model)
    {
        model.addAttribute("user", new User());
        return "FormPage";
    }

    @RequestMapping(value = "validateForm", method = RequestMethod.POST)
    public String validateForm(@Valid User user, BindingResult result, ModelMap model)
            throws Exception
    {
        if (result.hasErrors()) {
            return "FormPage";
        }
        model.addAttribute("message", "Successfully saved person: " + user.toString());

        return "FormPage";
    }

    @RequestMapping(value = "home")
    public String test() throws Exception
    {
        return "Home";
    }

    @RequestMapping(value = "register")
    public String register() throws Exception
    {
        return "Register";
    }
    
    @RequestMapping(value = "myProfile")
    public String myProfile() throws Exception
    {
        return "MyProfile";
    }
    
    @RequestMapping(value = "myPosts")
    public String myPosts() throws Exception
    {
        return "MyPosts";
    }

    @RequestMapping(value = "test2")
    public String test2() throws Exception
    {
        throw new Exception("Keep Moving Forward");
    }

    @RequestMapping(value = "atest", method = RequestMethod.GET)
    public String at1(Model model)
    {
        model.addAttribute("atest", new ATest());
        return "TestPage";
    }

    @RequestMapping(value = "atest", method = RequestMethod.POST)
    public String at2(@Valid ATest atest, BindingResult result, ModelMap model) throws Exception
    {
        if (result.hasErrors()) {
            return "TestPage";
        }
        model.addAttribute("message", "Successfully saved person: " + atest.toString());
        return "TestPage";
    }
}
