package model;

import model.parking.Parking;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.dao.DAOHibernate;

public class Garage {

    private static DAOHibernate dao = new DAOHibernate();

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
        if (parking.getSalida() != -1) {
            // horasalida - horaentrada > tiempo permitido ==> excedido
            res = parking.getSalida() < parking.getEntrada()
                    || parking.getSalida() - parking.getEntrada() > parking.getTiempoPermitido();
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
            if (park.getSalida() == -1) {
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
