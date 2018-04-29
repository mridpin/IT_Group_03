/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package libreria;

import java.util.ArrayList;
import java.util.List;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;


@WebService(serviceName = "LibreriaService")
public class LibreriaService {

    Almacen a = new Almacen();
    /**
     * This is a sample web service operation
     * @return 
     */
    @WebMethod(operationName = "listBooks")
    public List<Libro> listBooks() {
        return  new Almacen().consultaLibrosDisponibles();
    }
}
