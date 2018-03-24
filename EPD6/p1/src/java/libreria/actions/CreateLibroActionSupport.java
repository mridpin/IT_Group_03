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
        //TODO: Add validation
        
        
        //If all validation is passed
        
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
