package miniblog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UsersController {
	
	@RequestMapping(value="home")
	public String loadHomePage() throws Exception{
		return "HomePage";
	}
	
	@RequestMapping(value="register")
	public String register() throws Exception{
		return "Register";
	}
	
	@RequestMapping(value="t1")
	public String t1() throws Exception{
		return "Trang1";
	}
	
	@RequestMapping(value="t2")
	public String t2() throws Exception{
		return "Trang2";
	}
	
	@RequestMapping(value="test")
	public String test() throws Exception{
		return "Test";
	}

}
