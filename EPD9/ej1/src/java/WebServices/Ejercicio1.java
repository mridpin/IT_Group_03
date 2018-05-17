/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package WebServices;

import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;

/**
 *
 * @author Portatil
 */
@WebService(serviceName = "Ejercicio1")
public class Ejercicio1 {
    
    
    /**
     * This is a sample web service operation
     */
    @WebMethod(operationName = "hello")
    public String hello(@WebParam(name = "name") String txt) {
        return "Hello " + txt + " !";
    }

    /**
     * Generates an alphanumeric password that is the size of the parameter
     * passed as an input parameter
     */
    @WebMethod(operationName = "generatePassword")
    public String generatePassword(@WebParam(name = "length") int length) {
        
        //All the possible characters and numbers that the password might have
        List possibleResults = Arrays.asList("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxys1234567890".split(""));
        
        //Generate the password
        Collections.shuffle(possibleResults);
        
        //We transform the password into a String
        return String.join("",possibleResults.subList(0,length));
    }
}
