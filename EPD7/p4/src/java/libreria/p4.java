/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package libreria;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author EvilMezzen
 */
public class p4 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        List l = new ArrayList();
        l.addAll(listLibros());
        for(int i=0;i<l.size();i++)
            System.out.println(l.get(i));
    }
    private static List listLibros(){
        LibreriaService service = new LibreriaService();
        return service.listBooks();
    }
}
