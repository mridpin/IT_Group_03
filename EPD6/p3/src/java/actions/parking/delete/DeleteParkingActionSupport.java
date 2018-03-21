/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package actions.parking.delete;

import static com.opensymphony.xwork2.Action.ERROR;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;
import java.util.List;
import model.Garage;
import model.parking.Parking;

/**
 *
 * @author ridao
 */
public class DeleteParkingActionSupport extends ActionSupport {

    String index;

    public DeleteParkingActionSupport() {
    }

    public String deleteParking() throws Exception {
        List<Parking> parkings = Garage.currentSpots();
        for (Parking p : parkings) {
            if (p.getMatricula().equals(index)) {
                Garage.deleteParking(p);
                return SUCCESS;
            }
        }
        return ERROR;
    }

    public String getIndex() {
        return index;
    }

    public void setIndex(String index) {
        this.index = index;
    } 
}
