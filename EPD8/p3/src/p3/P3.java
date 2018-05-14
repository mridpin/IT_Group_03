/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package p3;

import java.net.URI;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.UriBuilder;

/**
 *
 * @author ridao
 */
public class P3 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Client client = ClientBuilder.newClient();
        URI uri = UriBuilder.fromUri("http://localhost:8080/p2").build();
        WebTarget target = client.target(uri).path("webresources").path("p2");
        
        String fivePass = target.queryParam("length", 5).request(MediaType.TEXT_PLAIN).get(String.class);
        String tenPass = target.queryParam("length", 10).request(MediaType.TEXT_PLAIN).get(String.class);
        System.out.println("STRONG PASSWORD GENERATOR:");
        System.out.println("\t- Five character password: " + fivePass);
        System.out.println("\t- Ten character password: " + tenPass);
    }
    
}
