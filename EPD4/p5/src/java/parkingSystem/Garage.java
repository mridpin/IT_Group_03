package parkingSystem;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Garage {

    private static PersistenciaJDBC dao = new PersistenciaJDBC();

    // Devuelve todos los coches en el aparcamiento
    public static List<Parking> currentSpots() {
        List<Parking> list = null;
        try {
            list = dao.currentSpots();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // Devuelve los coches que se han excedido iterando y filtrando todos los coches del aparcamiento
    public static List<Parking> getCochesExcedidos(List<Parking> parking) {
        List<Parking> list = new ArrayList<>();
        for (Parking park : parking) {
            if (isExcedido(park)) {
                list.add(park);
            }
        }
        return list;
    }

    // Devuelve los coches que NO se han excedido iterando y filtrando todos los vehiculos
    public static List<Parking> getCochesNoExcedidos(List<Parking> parking) {
        List<Parking> list = new ArrayList<>();
        for (Parking park : parking) {
            if (!isExcedido(park)) {
                list.add(park);
            }
        }
        return list;
    }

    // Calcula si los coches se han excedido
    private static boolean isExcedido(Parking parking) {
        boolean res = false;
        if (!"--".equals(parking.getSalida()) && parking.getSalida().matches("\\d+")) {
            // horasalida - horaentrada > tiempo permitido ==> excedido
            res = Integer.parseInt(parking.getSalida()) < parking.getEntrada()
                    || Integer.parseInt(parking.getSalida()) - parking.getEntrada() > parking.getTiempoPermitido();
        }
        return res;
    }

    public static List<Parking> buscar(String busqueda, List<Parking> parking) {
        List<Parking> list = new ArrayList<>();
        for (Parking park : parking) {
            if (park.getMatricula().startsWith(busqueda)) {
                list.add(park);
            }
        }
        return list;
    }

    public static List<Parking> enAparcamiento(List<Parking> parking) {
        List<Parking> list = new ArrayList<>();
        for (Parking park : parking) {
            if ("--".equals(park.getSalida())) {
                list.add(park);
            }
        }
        return list;
    }

    public static void updateParking(Parking parking) {
        try {
            dao.updateParking(parking);
        } catch (SQLException ex) {
            Logger.getLogger(Garage.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void deleteParking(Parking parking) {
        try {
            dao.deleteParking(parking);
        } catch (SQLException ex) {
            Logger.getLogger(Garage.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void createParking(Parking parking) {
        try {
            dao.createParking(parking);
        } catch (SQLException ex) {
            Logger.getLogger(Garage.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
