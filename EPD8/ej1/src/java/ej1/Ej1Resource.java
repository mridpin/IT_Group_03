/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ej1;

import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.Consumes;
import javax.ws.rs.Produces;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PUT;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;

/**
 * REST Web Service
 *
 * @author Portatil
 */
@Path("ej1")
public class Ej1Resource {

    @Context
    private UriInfo context;

    /**
     * Creates a new instance of Ej1Resource
     */
    public Ej1Resource() {
    }

    /**
     * Retrieves representation of an instance of ej1.Ej1Resource
     * @return an instance of java.lang.String
     */
    @GET
    @Produces(MediaType.TEXT_HTML)
    public String getHtml(@QueryParam("palabra") String palabra) {
       return "<p>Palabra introducida: <strong>"+palabra+"</strong></p><br><p>N&uacute;mero de letras de la palabra: </p><strong>"+palabra.split("").length+"</strong>";
    }


}
