/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package p2;

import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;

/**
 *
 * @author victormartinelli
 */
@WebService(serviceName = "p2")
public class p2 {
    
    @WebMethod(operationName = "contadorLetras")
    public Integer contadorLetras(@WebParam(name = "frase") String frase) {
        return frase.split("").length;
    }
    
}
