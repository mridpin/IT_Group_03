/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package actions;

import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.validator.annotations.*;

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
    private int edad;
    private String contrasenia;
    private int altura;

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

    @DoubleRangeFieldValidator(key = "peso.required", minInclusive = "35", maxInclusive = "200")
    public void setPeso(double peso) {
        this.peso = peso;
    }

    public int getEdad() {
        return edad;
    }

    @IntRangeFieldValidator(key = "edad.required", min = "14", max = "70")
    public void setEdad(int edad) {
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

    @IntRangeFieldValidator(key = "altura.required", min = "120", max = "270")
    public void setAltura(int altura) {
        this.altura = altura;
    }

    public Registro() {
    }
    
}
