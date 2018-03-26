/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package libreria.actions;

import com.opensymphony.xwork2.ActionSupport;
import libreria.Almacen;
import libreria.Editorial;
import libreria.Libro;

/**
 *
 * @author Portatil
 */
public class CreateLibroActionSupport extends ActionSupport{
    
    private String editorialid;
    private String autor;
    private String titulo;
    private String precio;
    private String isbn;
    
    
    
    public void validate()
    {
        
        //Autor must be provided
        if(this.getAutor().length()!=0)
        {
            //Autor must only be characters and spaces
            if(!this.getAutor().matches("^[a-zA-Z\\s]+$"))
            {
                addFieldError("autor","El campo autor solamente debe tener letras");
            }
        }
        else
        {
            addFieldError("autor","El campo autor no puede estar vacío");
        }
        //Titulo must be provided
        if(this.getTitulo().length()==0)
        {
            addFieldError("titulo","El campo titulo no puede estar vacío");
        }
        //Precio must be provided and a double
        if(this.getPrecio().length()!=0)
        {
            //https://stackoverflow.com/questions/1547574/regex-for-prices
            if(!this.getPrecio().matches("\\d{1,3}(?:[.,]\\d{3})*(?:[.,]\\d{2})?"))
            {
                addFieldError("precio","El campo precio debe ser positivo y numérico ");
            }
        }
        else
        {
            addFieldError("precio","El campo precio no puede estar vacío");
        }
        
        //Isbn must be provided
         if(this.getIsbn().length()!=0)
        {
           
            //ISBN must be a 3 digit number
            if(!this.getIsbn().matches("[0-9]{3}"))
            {
                addFieldError("isbn","El isbn debe tener 3 dígitos");
            }
            
        }
         else
         {
              addFieldError("isbn","El campo isbn no puede estar vacío");
         }
         //Editorial must be provided
         if(this.getEditorialid().length()!=0)
         {
            //Editorial must be a number of 10 digits max
            if(this.getEditorialid().matches("[0-9]{1,10}"))
            {
                Integer id = Integer.parseInt(this.getEditorialid());
                //Editorial ID must exist
                if(!new Almacen().consultaEditorialesDisponibles().contains(id))
                {
                    addFieldError("editorialid","La editorial debe ser válida");
                }
            }
            else
            {
                addFieldError("editorialid","El campo Editorial debe ser numérico ");
            }
         }
         else
         {
          addFieldError("editorialid","El campo Editorial ID no puede estar vacío");
         }
        
    }
    
    public String addBook()
    {
        try{
        //We set all of the parameters of the book to be added
        Libro l = new Libro();
        l.setAutor(autor);
        //l.setId(Integer.parseInt(id));
        l.setPrecio(Float.parseFloat(precio));
        l.setTitulo(titulo);
        l.setIsbn(Integer.parseInt(isbn));
        
        l.setEditorial(new Almacen().consultaEditorial(Integer.parseInt(editorialid)));
        
        //Then we add it
        
        new Almacen().nuevoLibro(l);
        
        return SUCCESS;
        }
        catch(Exception ex)
        {
            return ERROR;
        }
        
    }
    
    public String getEditorialid() {
        return editorialid;
    }

    public void setEditorialid(String editorialid) {
        this.editorialid = editorialid;
    }

    public String getAutor() {
        return autor;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getPrecio() {
        return precio;
    }

    public void setPrecio(String precio) {
        this.precio = precio;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }
    
}
