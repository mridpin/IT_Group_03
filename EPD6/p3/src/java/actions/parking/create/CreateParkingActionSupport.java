/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package actions.parking.create;

import static com.opensymphony.xwork2.Action.ERROR;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;
import java.util.List;
import model.Garage;
import model.ParkingFormatted;
import model.parking.Parking;

/**
 *
 * @author ridao
 */
public class CreateParkingActionSupport extends ActionSupport {

    String index;
    ParkingFormatted parkingFormatted;
    Parking parking;
    String isEdit; //Variable que se emplea en parkings.jsp pasa saber si estamos editando o creando

    String matricula;
    String modelo;
    String entrada;
    String salida;
    int tiempoPermitido;

    public CreateParkingActionSupport() {
    }

    public String execute() throws Exception {
        this.setIsEdit("isCreate");
        return SUCCESS;
    }

    public String forwardEdit() throws Exception {
        List<Parking> parkings = Garage.currentSpots();
        for (Parking p : parkings) {
            if (p.getMatricula().equals(index)) {
                this.setParkingFormatted(this.formatParking(p));
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
        if (entrada.matches("\\d\\d:\\d\\d")) {
            int hours = Integer.parseInt(entrada.split(":")[0]);
            int mins = Integer.parseInt(entrada.split(":")[1]);
            parking.setEntrada(hours * 60 + mins);
        }
        if (salida.matches("-?\\d")) {
            parking.setSalida(Integer.parseInt(salida));
        } else if (salida.matches("\\d\\d:\\d\\d")) {
            int hours = Integer.parseInt(salida.split(":")[0]);
            int mins = Integer.parseInt(salida.split(":")[1]);
            parking.setSalida(hours * 60 + mins);
        }
        if (tiempoPermitido > 0) {
            parking.setTiempoPermitido(tiempoPermitido);
        }
        Garage.updateParking(parking);
        return SUCCESS;
    }

    public String createParking() throws Exception {
        parking = new Parking();
        parking.setMatricula(matricula);
        parking.setModelo(modelo);
        if (entrada.matches("\\d\\d:\\d\\d")) {
            int hours = Integer.parseInt(entrada.split(":")[0]);
            int mins = Integer.parseInt(entrada.split(":")[1]);
            parking.setEntrada(hours * 60 + mins);
        }
        if (salida.matches("-?\\d")) {
            parking.setSalida(Integer.parseInt(salida));
        } else if (salida.matches("\\d\\d:\\d\\d")) {
            int hours = Integer.parseInt(salida.split(":")[0]);
            int mins = Integer.parseInt(salida.split(":")[1]);
            parking.setSalida(hours * 60 + mins);
        }
        if (tiempoPermitido > 0) {
            parking.setTiempoPermitido(tiempoPermitido);
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

    public int getTiempoPermitido() {
        return tiempoPermitido;
    }

    public void setTiempoPermitido(int tiempoPermitido) {
        this.tiempoPermitido = tiempoPermitido;
    }

    public ParkingFormatted getParkingFormatted() {
        return parkingFormatted;
    }

    public void setParkingFormatted(ParkingFormatted parkingFormatted) {
        this.parkingFormatted = parkingFormatted;
    }

    public ParkingFormatted formatParking(Parking parking) {
        String entrada = String.format("%02d", parking.getEntrada() / 60) + ":" + String.format("%02d", parking.getEntrada() % 60);
        String salida;
        if (parking.getSalida() != -1) {
            salida = String.format("%02d", parking.getSalida() / 60) + ":" + String.format("%02d", parking.getSalida() % 60);
        } else {
            salida = "--";
        }
        ParkingFormatted park = new ParkingFormatted(parking.getMatricula(), parking.getModelo(), entrada, salida, parking.getTiempoPermitido());
        return park;
    }
}
