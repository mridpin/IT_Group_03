/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package actions;

import com.opensymphony.xwork2.ActionContext;
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
    
    public EditParkingActionSupport() {
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
    
}
