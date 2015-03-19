package duy.miniblog.util;

import java.util.ArrayList;
import java.util.List;

import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.ext.ExceptionMapper;
import javax.ws.rs.ext.Provider;

import org.jboss.resteasy.api.validation.ResteasyConstraintViolation;
import org.jboss.resteasy.api.validation.ResteasyViolationException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.google.gson.Gson;

@Provider
@Component
public class ValidationExceptionHandler implements ExceptionMapper<ResteasyViolationException>
{

    private static final Logger logger = LoggerFactory.getLogger(ValidationExceptionHandler.class);

    /**
     * {@inheritDoc}
     */
    @SuppressWarnings({ "unchecked", "rawtypes" })
    @Override
    @Produces(MediaType.APPLICATION_JSON)
    public Response toResponse(ResteasyViolationException exception)
    {
        Gson gson = new Gson();
        StringBuilder sb = new StringBuilder();
        List<String> messages = new ArrayList<String>();
        for (ResteasyConstraintViolation violation : exception.getViolations()) {
            // Create log message
            sb.append(violation.getMessage()).append("; ");
            // Create error response message
            messages.add(violation.getMessage());
        }

        logger.warn("Invalid request: {}", sb.toString());

        return Response.status(400).entity(gson.toJson(messages)).build();
    }
}
