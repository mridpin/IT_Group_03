package model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.dao.DAOHibernate;

public class Garage {

    private static DAOHibernate dao = new DAOHibernate();

    // Devuelve todos los coches en el aparcamiento
    public static List<Parkingspot> currentSpots() {
        List<Parkingspot> list = null;
        try {
            list = dao.currentSpots();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // Devuelve los coches que se han excedido iterando y filtrando todos los coches del aparcamiento
    public static List<Parkingspot> getCochesExcedidos(List<Parkingspot> parking) {
        List<Parkingspot> list = new ArrayList<>();
        for (Parkingspot park : parking) {
            if (isExcedido(park)) {
                list.add(park);
            }
        }
        return list;
    }

    // Devuelve los coches que NO se han excedido iterando y filtrando todos los vehiculos
    public static List<Parkingspot> getCochesNoExcedidos(List<Parkingspot> parking) {
        List<Parkingspot> list = new ArrayList<>();
        for (Parkingspot park : parking) {
            if (!isExcedido(park)) {
                list.add(park);
            }
        }
        return list;
    }

    // Calcula si los coches se han excedido
    private static boolean isExcedido(Parkingspot parking) {
        boolean res = false;
        if (parking.getHoraSalida() != -1) {
            // horasalida - horaentrada > tiempo permitido ==> excedido
            res = ( parking.getHoraSalida() - parking.getHoraEntrada()) > parking.getTiempoPermitido();
        }
        return res;
    }

    public static List<Parkingspot> buscar(String busqueda, List<Parkingspot> parking) {
        List<Parkingspot> list = new ArrayList<>();
        for (Parkingspot park : parking) {
            if (park.getMatricula().startsWith(busqueda)) {
                list.add(park);
            }
        }
        return list;
    }

    public static List<Parkingspot> enAparcamiento(List<Parkingspot> parking) {
        List<Parkingspot> list = new ArrayList<>();
        for (Parkingspot park : parking) {
            if (park.getHoraSalida() == -1) {
                list.add(park);
            }
        }
        return list;
    }
}
