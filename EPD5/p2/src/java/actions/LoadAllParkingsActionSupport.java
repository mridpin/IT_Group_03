package actions;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.List;
import model.Garage;
import model.Parkingspot;
import model.ParkingFormatted;

/**
 *
 * @author ridao
 */
public class LoadAllParkingsActionSupport extends ActionSupport {

    List<ParkingFormatted> parkings;
    String matricula;

    public LoadAllParkingsActionSupport() {
    }

    public String execute() throws Exception {
        setParkings(this.formatParking(Garage.currentSpots()));
        return SUCCESS;
    }

    public String showOverdue() throws Exception {
        setParkings(this.formatParking(Garage.getCochesExcedidos(Garage.currentSpots())));
        return SUCCESS;
    }

    public String showNotOverdue() throws Exception {
        setParkings(this.formatParking(Garage.getCochesNoExcedidos(Garage.currentSpots())));
        return SUCCESS;
    }

    public String searchByPlate() throws Exception {
        List<Parkingspot> results = Garage.buscar(matricula, Garage.currentSpots());
        this.setParkings(this.formatParking(results));
        return SUCCESS;
    }

    public String showParked() throws Exception {
        List<Parkingspot> results = Garage.enAparcamiento(Garage.currentSpots());
        this.setParkings(this.formatParking(results));
        return SUCCESS;
    }

    public List<ParkingFormatted> getParkings() {
        return parkings;
    }

    public void setParkings(List<ParkingFormatted> parkings) {
        this.parkings = parkings;
    }

    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public List<ParkingFormatted> formatParking(List<Parkingspot> parkings) {
        List<ParkingFormatted> result = new ArrayList<>();
        for (Parkingspot p : parkings) {
            String entrada = String.format("%02d", p.getHoraEntrada() / 60) + ":" + String.format("%02d", p.getHoraEntrada() % 60);
            String salida;
            if (p.getHoraSalida() != -1) {
                salida = String.format("%02d", p.getHoraSalida() / 60) + ":" + String.format("%02d", p.getHoraSalida() % 60);
            } else {
                salida = "--";
            }
            ParkingFormatted park = new ParkingFormatted(p.getMatricula(), p.getModelo(), entrada, salida, p.getTiempoPermitido());
            result.add(park);
        }
        return result;
    }

}
