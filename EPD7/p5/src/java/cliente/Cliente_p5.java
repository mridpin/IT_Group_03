package cliente;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author EvilMezzen
 */
public class Cliente_p5 {


    public java.util.List<libreria.Libro> listarLibros(){
        return this.listBooks();
    }

    private static java.util.List<libreria.Libro> listBooks() {
        libreria.LibreriaService_Service service = new libreria.LibreriaService_Service();
        libreria.LibreriaService port = service.getLibreriaServicePort();
        return port.listBooks();
    }
    
}
