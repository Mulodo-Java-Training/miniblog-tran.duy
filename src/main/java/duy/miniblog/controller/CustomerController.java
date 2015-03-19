package duy.miniblog.controller;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;

import javax.validation.constraints.Size;
import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.core.Response;

import org.hibernate.validator.constraints.Email;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import duy.miniblog.entity.Customer;

@Controller
@Path("/v1")
@Validated
public class CustomerController
{

    private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);

    @RequestMapping(value = "customer", method = RequestMethod.GET)
    public String abc(Model model)
    {
        logger.info("return Customer Page");
        model.addAttribute("customer", new Customer());
        return "CustomerPage";
    }

    @RequestMapping(value = "customer", method = RequestMethod.POST)
    public String abcd(@Valid Customer customer, BindingResult bindingResult, Model model)
    {
        if (bindingResult.hasErrors()) {
            logger.info("Return Customer Page");
            return "CustomerPage";
        }
        logger.info("Return Success Page");
        model.addAttribute("customer", customer);
        return "SuccessPage";
    }

    @POST
    @Path("customers")
    @Consumes("application/x-www-form-urlencoded")
    // the MIME media type of the request to a resource
    public Response createUser(

    @NotNull @Size(min = 3, max = 10) @FormParam("name") String name,

    @NotNull @Email @FormParam("email") String email)
    {
        try {
            logger.info("return blalalalala");
            Customer customer = new Customer();
            customer.setName(name);
            customer.setEmail(email);

            return Response.status(201).entity("Dang ki thanh cong!").build();
        } catch (Exception ex) {
            return Response.status(500).entity("Server Error " + ex.getMessage()).build();
        }
    }

}
