/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package actions;

import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.validator.annotations.*;
import java.util.Date;

/**
 *
 * @author Javi
 */
public class Registro extends ActionSupport{
    private String nombre;
    private String apellidos;
    private String dni;
    private String email;
    private double peso;
    private String edad;
    private String contrasenia;
    private int altura;
    private String tarjeta;
    private String paginaWeb;
    private double precio;
    private Date date;

    public String getNombre() {
        return nombre;
    }

    @RequiredStringValidator(key = "nombre.required")
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public String getApellidos() {
        return apellidos;
    }

    @RequiredStringValidator(key = "apellidos.required")
    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getDni() {
        return dni;
    }

    @RequiredStringValidator(key = "dni.required")
    @RegexFieldValidator(regex = "^[0-9]{8}[TRWAGMYFPDXBNJZSQVHLCKE]$", key="dni.fail")
    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getEmail() {
        return email;
    }

    @RequiredStringValidator(key = "email.required")
    @EmailValidator(key = "email.fail")
    public void setEmail(String email) {
        this.email = email;
    }

    public double getPeso() {
        return peso;
    }

    @RequiredFieldValidator(key = "peso.required")
    @DoubleRangeFieldValidator(key = "peso.fail", minInclusive = "35", maxInclusive = "200")
    public void setPeso(double peso) {
        this.peso = peso;
    }

    public String getEdad() {
        return edad;
    }
    
    @RequiredStringValidator(key = "edad.required")
    @RegexFieldValidator(regex = "^(?:1[89]|[2-5]\\d|6[0-5])$", key="age.fail")
    public void setEdad(String edad) {
        this.edad = edad;
    }
    public String getContrasenia() {
        return contrasenia;
    }

    @RequiredStringValidator(key = "contrasenia.required")
    public void setContrasenia(String contrasenia) {
        this.contrasenia = contrasenia;
    }

    public int getAltura() {
        return altura;
    }
    
    @RequiredFieldValidator(key="altura.required")
    @IntRangeFieldValidator(min = "120", max = "270", key = "altura.fail")
    public void setAltura(int altura) {
        this.altura = altura;
    }

    public String getTarjeta() {
        return tarjeta;
    }
    
    @RequiredStringValidator(key = "tarjeta.required")
    @RegexFieldValidator(regex = "^3[47][0-9]{13}$", key="tarjeta.fail")
    public void setTarjeta(String tarjeta) {
        this.tarjeta = tarjeta;
    }

    public String getPaginaWeb() {
        return paginaWeb;
    }
    @RequiredStringValidator(key = "paginaWeb.required")
    @ExpressionValidator(key = "paginaWeb.fail", expression = "/^(https?:\\/\\/)?([\\da-z\\.-]+)\\.([a-z\\.]{2,6})([\\/\\w \\?=.-]*)*\\/?$/")
    public void setPaginaWeb(String paginaWeb) {
        this.paginaWeb = paginaWeb;
    }
    
    public double getPrecio() {
        return precio;
    }
    @RequiredFieldValidator(key = "precio.required")
    @DoubleRangeFieldValidator(key = "precio.fail", minInclusive = "5")
    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public Date getDate() {
        return date;
    }
    @RequiredFieldValidator(key = "date.required")
    @DateRangeFieldValidator(min = "1/1/2018", max = "12/31/2018", key = "date.fail")
    public void setDate(Date date) {
        this.date = date;
    }

    public Registro() {
    }
    
}
