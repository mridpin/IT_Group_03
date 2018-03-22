/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package actions.parking.edit;

import com.opensymphony.xwork2.ActionSupport;
import java.util.List;
import model.Garage;
import model.parking.Parking;
import model.ParkingFormatted;

/**
 *
 * @author ridao
 * Esta clase se encarga de redirigir desde index.jsp a parking.jsp indicando si se esta modificando o creando un parking
 * para mostrar el formulario adecuado
 * Las operaciones CRUD de editar y crear y las validaciones se hacen en la clase CreateParkingActionSupport
 */
public class EditParkingActionSupport extends ActionSupport {

    String index;
    ParkingFormatted parkingFormatted;
    String isEdit;

    public EditParkingActionSupport() {
    }

    public String toEdit() throws Exception {
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
    
    public String toCreate() throws Exception {
        this.setIsEdit("isCreate");
        return SUCCESS;
    }

    public String getIndex() {
        return index;
    }

    public void setIndex(String index) {
        this.index = index;
    }

    public String getIsEdit() {
        return isEdit;
    }

    public void setIsEdit(String isEdit) {
        this.isEdit = isEdit;
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
