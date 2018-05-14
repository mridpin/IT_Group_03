/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package webservices;

import java.util.Random;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.Produces;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PUT;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;

/**
 * REST Web Service
 *
 * @author ridao
 */
@Path("p2")
public class Webservice {

    @Context
    private UriInfo context;

    /**
     * Creates a new instance of Webservice
     */
    public Webservice() {
    }

    /**
     * PUT method for updating or creating an instance of Webservice
     * @param content representation for the resource
     */
    @PUT
    @Consumes(MediaType.TEXT_PLAIN)
    public void putText(String content) {
    }
    
        /**
     * Retrieves representation of an instance of webservices.Webservice
     * @return an instance of java.lang.String
     */
    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public String getStrongPassword(@QueryParam("length") Integer length) {
        Random r = new Random();
        String seed = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890";
        String res = "";
        for (int i = 0; i<length; i++) {
            res += seed.charAt(r.nextInt(seed.length()));
        }
        return res;
    }
}
