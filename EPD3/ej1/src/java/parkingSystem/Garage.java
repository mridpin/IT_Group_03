package parkingSystem;


import java.util.ArrayList;
import java.util.List;

public class Garage {
    
    
    public static List<ParkingSpot> currentSpots()
    {
        List<ParkingSpot> list = new ArrayList<ParkingSpot>();
        
        ParkingSpot entry1 = new ParkingSpot();
        entry1.setMatricula("12784HIH");
        entry1.setModelo("BMW");
        entry1.setHoraEntrada("10:05");
        entry1.setHoraSalida("--");
        entry1.setTiempoPermitido(30);
        list.add(entry1);
        
        ParkingSpot entry2 = new ParkingSpot();
        entry2.setMatricula("76234AAC");
        entry2.setModelo("Toyota");
        entry2.setHoraEntrada("10:07");
        entry2.setHoraSalida("10:35");
        entry2.setTiempoPermitido(30);
        list.add(entry2);
        
        ParkingSpot entry3 = new ParkingSpot();
        entry3.setMatricula("32162BAQ");
        entry3.setModelo("Audi");
        entry3.setHoraEntrada("10:45");
        entry3.setHoraSalida("--");
        entry3.setTiempoPermitido(90);
        list.add(entry3);
        
        ParkingSpot entry4 = new ParkingSpot();
        entry4.setMatricula("87823CDA");
        entry4.setModelo("Mercedes");
        entry4.setHoraEntrada("10:46");
        entry4.setHoraSalida("11:05");
        entry4.setTiempoPermitido(15);
        list.add(entry4);
        
        return list;
    }
    
}
