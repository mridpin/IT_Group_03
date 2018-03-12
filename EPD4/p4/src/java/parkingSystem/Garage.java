package parkingSystem;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Garage {

    // Devuelve todos los coches en el aparcamiento
    public static List<ParkingSpot> currentSpots() {
        List<ParkingSpot> list = null;
        try {
            list = PersistenciaJDBC.currentSpots();
        } catch (SQLException e) {
            e.printStackTrace();
        }
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

    public static void updateParking(ParkingSpot parking) {
        try {
            int entrada = Integer.parseInt(parking.getHoraEntrada().split(":")[1]) + Integer.parseInt(parking.getHoraEntrada().split(":")[0]) * 60;
            String salida = "";
            if (!parking.getHoraSalida().equals("--")) {
                Integer salidaMinutos = (Integer.parseInt(parking.getHoraSalida().split(":")[0]) * 60) + Integer.parseInt(parking.getHoraSalida().split(":")[1]);
                salida = salidaMinutos.toString();
            } else {
                salida = "--";
            }
            PersistenciaJDBC.updateParking(parking.getMatricula(), parking.getModelo(), entrada, salida, parking.getTiempoPermitido());
        } catch (SQLException ex) {
            Logger.getLogger(Garage.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void deleteParking(ParkingSpot parking) {
        try {
            PersistenciaJDBC.deleteParking(parking.getMatricula());
        } catch (SQLException ex) {
            Logger.getLogger(Garage.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void createParking(ParkingSpot parking) {
        int entrada = Integer.parseInt(parking.getHoraEntrada().split(":")[1]) + Integer.parseInt(parking.getHoraEntrada().split(":")[0]) * 60;
        String salida = "";
        if (!parking.getHoraSalida().equals("--")) {
            Integer salidaMinutos = (Integer.parseInt(parking.getHoraSalida().split(":")[0]) * 60) + Integer.parseInt(parking.getHoraSalida().split(":")[1]);
            salida = salidaMinutos.toString();
        } else {
            salida = "--";
        }
        try {
            PersistenciaJDBC.createParking(parking.getMatricula(), parking.getModelo(), entrada, salida, parking.getTiempoPermitido());
        } catch (SQLException ex) {
            Logger.getLogger(Garage.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
