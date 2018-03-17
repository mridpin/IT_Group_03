package actions;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.opensymphony.xwork2.ActionSupport;
import java.util.List;
import model.Garage;
import model.Parking;

/**
 *
 * @author ridao
 */
public class LoadAllParkingsActionSupport extends ActionSupport {
    
    List<Parking> parkings;
    
    public LoadAllParkingsActionSupport() {
    }

    public List<Parking> getParkings() {
        return parkings;
    }

    public void setParkings(List<Parking> parkings) {
        this.parkings = parkings;
    }   
    
    public String execute() throws Exception {
        setParkings(Garage.currentSpots());
        return SUCCESS;
    }
    
    public String showOverdue() throws Exception {
        setParkings(Garage.getCochesExcedidos(Garage.currentSpots()));
        return SUCCESS;
    }    
    public String showNotOverdue() throws Exception {
        setParkings(Garage.getCochesNoExcedidos(Garage.currentSpots()));
        return SUCCESS;
    }    
}
