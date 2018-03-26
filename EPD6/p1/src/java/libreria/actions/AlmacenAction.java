
package libreria.actions;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import libreria.Almacen;
import libreria.Libro;


public class AlmacenAction extends ActionSupport{
    
    //All books in the store
    List<Libro> libros = null;
    //Books that are going to be bought
    List<Libro> selected =null;
    //Selected book (isbn) in the form
    String current = null;

    public String getCurrent() {
        return current;
    }

    public void setCurrent(String current) {
        this.current = current;
    }

    //Called in the action first, attemps to load all the books in the store
    public String execute()
    {
        try {
            libros = new Almacen().consultaLibrosDisponibles();            
            return SUCCESS;
        } catch (SQLException ex) {
            Logger.getLogger(Almacen.class.getName()).log(Level.SEVERE, null, ex);
            return ERROR;
        }
    }
    
    //Gets the book that was selected and adds in into the list of books ready for purchase
    public String getLibrosSeleccionados()
    {
        
        try {
            //We get the session
            Map session = (Map) ActionContext.getContext().get("session");
            //We get the list of the isbns of the selected books, it's stored in the session
            List<String> selectedBooks = (List<String>)session.get("isbn");
            
            //If it's null(no books have been selected so far) we create it
            if(selectedBooks == null)
            {
                selectedBooks = (List<String>) new ArrayList();
            }
            //We add the isbn of the selected book and add it to the list of the previously selected book
            selectedBooks.add(current);
            
            //We recomputate the list of selected books (actual Object Libro) 
            selected = new Almacen().consultaListaLibrosSolicitados(selectedBooks);
            
            //We update the session parameter of the isbns of the selected books
            session.put("isbn",selectedBooks);
            return SUCCESS;
        } catch (Exception ex) {
            Logger.getLogger(AlmacenAction.class.getName()).log(Level.SEVERE, null, ex);
            return ERROR;
        }
        
               
    }
    
    //Calculates the list of selected books and calculates the final cost
    public String processPurchase()
    {
        try{
        Map session = (Map) ActionContext.getContext().get("session");
        
        //We get the list of selected book isbns
        List<String> selectedBooks = (List<String>)session.get("isbn");
        //If we havent selected any books, we simply don't selected any since we create it
        if(selectedBooks == null)
            {
                selectedBooks = (List<String>) new ArrayList();
            }
        //We get all the selected books from their isbn
        selected = new Almacen().consultaListaLibrosSolicitados(selectedBooks);
        
        //We now calculate the total amount of the purchase
        double total=0.0;
        
        for(int i=0;i<selected.size();i++)
        {
            total+=selected.get(i).getPrecio();
        }
        //Formatting of total
        session.put("total",BigDecimal.valueOf(total).setScale(3,RoundingMode.HALF_UP).doubleValue());
        
        return SUCCESS;
        
        }
        catch (Exception ex) {
            Logger.getLogger(AlmacenAction.class.getName()).log(Level.SEVERE, null, ex);
            return ERROR;
        }
        
    }

    public List<Libro> getSelected() {
        return selected;
    }

    public void setSelected(List<Libro> selected) {
        this.selected = selected;
    }
    
 
    public List<Libro> getLibros() {
        return libros;
    }

    public void setLibros(List<Libro> libros) {
        this.libros = libros;
    }
    
    
}
