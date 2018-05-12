/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package p1;

import javax.ws.rs.ClientErrorException;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.WebTarget;

/**
 * Jersey REST client generated for REST resource:Ej1Resource [ej1]<br>
 * USAGE:
 * <pre>
 *        p1Jersey client = new p1Jersey();
 *        Object response = client.XXX(...);
 *        // do whatever with response
 *        client.close();
 * </pre>
 *
 * @author Portatil
 */
public class p1Jersey {

    private WebTarget webTarget;
    private Client client;
    private static final String BASE_URI = "http://localhost:8080/ej1/webresources";

    public p1Jersey() {
        client = javax.ws.rs.client.ClientBuilder.newClient();
        webTarget = client.target(BASE_URI).path("ej1");
    }

    public String getHtml(String palabra) throws ClientErrorException {
        WebTarget resource = webTarget;
        if (palabra != null) {
            resource = resource.queryParam("palabra", palabra);
        }
        return resource.request(javax.ws.rs.core.MediaType.TEXT_HTML).get(String.class);
    }

    public void close() {
        client.close();
    }
    
}
