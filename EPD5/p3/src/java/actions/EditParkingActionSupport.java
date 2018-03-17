/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package actions;

import com.opensymphony.xwork2.ActionSupport;
import java.util.List;
import model.Garage;
import model.Parking;

/**
 *
 * @author ridao
 */
public class EditParkingActionSupport extends ActionSupport {

    String index;
    Parking parking;
    String isEdit; //Variable que se emplea en parkings.jsp pasa saber si estamos editando o creando
    String matricula;
    String modelo;
    String entrada;
    String salida;
    String tiempoPermitido;

    public EditParkingActionSupport() {
    }

    public String execute() throws Exception {
        List<Parking> parkings = Garage.currentSpots();
        for (Parking p : parkings) {
            if (p.getMatricula().equals(index)) {
                this.setParking(p);
                this.setIsEdit("isEdit");
                return SUCCESS;
            }
        }
        return ERROR;
    }

    public String editParking() throws Exception {
        parking = new Parking();
        parking.setMatricula(matricula);
        parking.setModelo(modelo);
        if (entrada.matches("\\d+")) {
            parking.setEntrada(Integer.parseInt(entrada));
        }
        if (salida.matches("-?\\d+")) {
            parking.setSalida(Integer.parseInt(salida));
        }
        if (tiempoPermitido.matches("\\d+")) {
            parking.setTiempoPermitido(Integer.parseInt(tiempoPermitido));
        }
        Garage.updateParking(parking);
        return SUCCESS;
    }

    public String getIndex() {
        return index;
    }

    public void setIndex(String index) {
        this.index = index;
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
