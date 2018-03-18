/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package actions;

import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;
import model.Garage;
import model.Parking;
import model.ParkingFormatted;

/**
 *
 * @author ridao
 */
public class CreateParkingActionSupport extends ActionSupport {

    Parking parking;
    String isEdit; //Variable que se emplea en parkings.jsp pasa saber si estamos editando o creando
    String matricula;
    String modelo;
    String entrada;
    String salida;
    String tiempoPermitido;

    public CreateParkingActionSupport() {
    }

    public String execute() throws Exception {
        this.setIsEdit("isCreate");
        return SUCCESS;
    }
    
    public String createParking() throws Exception {
        parking = new Parking();
        parking.setMatricula(matricula);
        parking.setModelo(modelo);
        if (entrada.matches("\\d\\d:\\d\\d")) {
            int hours = Integer.parseInt(entrada.split(":")[0]);
            int mins = Integer.parseInt(entrada.split(":")[1]);
            parking.setEntrada(hours*60 + mins);
        }
        if (salida.matches("-?\\d")) {
            parking.setSalida(Integer.parseInt(salida));
        } else if (salida.matches("\\d\\d:\\d\\d")) {
            int hours = Integer.parseInt(salida.split(":")[0]);
            int mins = Integer.parseInt(salida.split(":")[1]);
            parking.setSalida(hours*60 + mins);
        }
        if (tiempoPermitido.matches("\\d+")) {
            parking.setTiempoPermitido(Integer.parseInt(tiempoPermitido));
        }
        Garage.createParking(parking);
        return SUCCESS;
    }

    public Parking getParking() {
        return parking;
    }

    public void setParking(Parking parking) {
        this.parking = parking;
    }

    public String getIsEdit() {
        return isEdit;
    }

    public void setIsEdit(String isEdit) {
        this.isEdit = isEdit;
    }

    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public String getEntrada() {
        return entrada;
    }

    public void setEntrada(String entrada) {
        this.entrada = entrada;
    }

    public String getSalida() {
        return salida;
    }

    public void setSalida(String salida) {
        this.salida = salida;
    }

    public String getTiempoPermitido() {
        return tiempoPermitido;
    }

    public void setTiempoPermitido(String tiempoPermitido) {
        this.tiempoPermitido = tiempoPermitido;
    }
    
    

}
