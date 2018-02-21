package parkingSystem;

import java.util.ArrayList;
import java.util.List;

public class Garage {

    // Devuelve todos los coches en el aparcamiento
    public static List<ParkingSpot> currentSpots() {
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

        ParkingSpot entry5 = new ParkingSpot();
        entry5.setMatricula("1234ABC");
        entry5.setModelo("Tesla");
        entry5.setHoraEntrada("07:30");
        entry5.setHoraSalida("19:05");
        entry5.setTiempoPermitido(60);
        list.add(entry5);

        return list;
    }

    // Devuelve los coches que se han excedido iterando y filtrando todos los coches del aparcamiento
    public static List<ParkingSpot> getCochesExcedidos(List<ParkingSpot> parking) {
        List<ParkingSpot> list = new ArrayList<>();
        for (ParkingSpot park : parking) {
            if (isExcedido(park)) {
                list.add(park);
            }
        }
        return list;
    }

    // Devuelve los coches que NO se han excedido iterando y filtrando todos los vehiculos
    public static List<ParkingSpot> getCochesNoExcedidos(List<ParkingSpot> parking) {
        List<ParkingSpot> list = new ArrayList<>();
        for (ParkingSpot park : parking) {
            if (!isExcedido(park)) {
                list.add(park);
            }
        }
        return list;
    }

    // Calcula si los coches se han excedido
    private static boolean isExcedido(ParkingSpot parking) {
        boolean res = false;
        if (!"--".equals(parking.getHoraSalida())) {
            // horasalida - horaentrada > tiempo permitido ==> excedido
            String[] horaSalida = parking.getHoraSalida().split(":");
            int salida = Integer.parseInt(horaSalida[1]) + Integer.parseInt(horaSalida[0]) * 60;
            String[] horaEntrada = parking.getHoraEntrada().split(":");
            int entrada = Integer.parseInt(horaEntrada[1]) + Integer.parseInt(horaEntrada[0]) * 60;
            res = salida - entrada > parking.getTiempoPermitido();
        }
        return res;
    }

    public static List<ParkingSpot> buscar(String busqueda, List<ParkingSpot> parking) {
        List<ParkingSpot> list = new ArrayList<>();
        for (ParkingSpot park : parking) {
            if (park.getMatricula().startsWith(busqueda)) {
                list.add(park);
            }
        }
        return list;
    }

    public static List<ParkingSpot> enAparcamiento(List<ParkingSpot> parking) {
        List<ParkingSpot> list = new ArrayList<>();
        for (ParkingSpot park : parking) {
            if ("--".equals(park.getHoraSalida())) {
                list.add(park);
            }
        }
        return list;
    }
}
