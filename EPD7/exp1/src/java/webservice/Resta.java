/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package webservice;

import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;

/**
 *
 * @author ridao
 */
@WebService(serviceName = "Resta")
public class Resta {

    /**
     * This is a sample web service operation
     * @param min
     * @param sub
     */
    @WebMethod(operationName = "resta")
    public Integer resta(@WebParam(name = "minuendo") Integer min, @WebParam(name="substraendo") Integer sub) {
        return min - sub;
    }
}
