package miniblog.controller;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class ErrorsController {

	@ExceptionHandler(Exception.class)
	public ModelAndView error(Exception e){
		ModelAndView m = new ModelAndView("ErrorPage");
		m.addObject("errName", e.getClass().getSimpleName());
		m.addObject("errMsg", e.getMessage());
		return m;
	}
}
