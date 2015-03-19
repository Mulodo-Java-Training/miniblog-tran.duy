package duy.miniblog.controller;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

// TODO: Auto-generated Javadoc
/**
 * The Class ErrorController: handles exception if any controller occurred error
 */
@ControllerAdvice
public class ErrorController
{

    /**
     * When any controller occurred error, this will show message on ErrorPage
     * page.
     * 
     * @param e
     *            the Exception
     * @return the model and view
     */
    @ExceptionHandler(Exception.class)
    public ModelAndView error(Exception e)
    {
        ModelAndView m = new ModelAndView("Error");
        m.addObject("errName", e.getClass().getSimpleName());
        m.addObject("errMsg", e.getMessage());
        return m;
    }
}
