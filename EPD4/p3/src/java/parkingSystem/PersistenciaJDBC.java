/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parkingSystem;

import java.sql.SQLException;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author ridao
 */
public class PersistenciaJDBC {

     Session hs = null; // hs = hibernateSession

    public PersistenciaJDBC() {
        // Se abre la sesion
        this.hs = NewHibernateUtil.getSessionFactory().openSession();
    }

    // Metodo que devuelve una lista resultado de hacer un SELECT a la bbdd
    public List<Parkingspot> currentSpots() throws SQLException {
        // Paso 1: get la current sesion
        hs = NewHibernateUtil.getSessionFactory().getCurrentSession();
        // Paso 2: comenzar transaccion
        Transaction tx = hs.beginTransaction();
        // Paso 3: crear query
        Query query = hs.createQuery("From Parkingspot");
        // Paso 4: recoger resultados
        List<Parkingspot> lista = query.list();
        // Paso 5: commit
        tx.commit();
        return lista;
    }

//    private static Parkingspot SetResultToParking(ResultSet resultado) throws SQLException {
//        int minutosEntrada = resultado.getInt("entrada") % 60;
//        int horasEntrada = resultado.getInt("entrada") / 60;
//        String entrada = String.format("%02d", horasEntrada) + ":" + String.format("%02d", minutosEntrada);
//
//        String salida = "";
//        if (!resultado.getString("salida").equals("--")) {
//            int minutosSalida = resultado.getInt("salida") % 60;
//            int horasSalida = resultado.getInt("salida") / 60;
//            salida = String.format("%02d", horasSalida) + ":" + String.format("%02d", minutosSalida);
//        } else {
//            salida = "--";
//        }
//
//        Parkingspot parking = new Parkingspot(resultado.getString("matricula"), resultado.getString("modelo"), entrada, salida, resultado.getInt("tiempo_permitido"));
//        return parking;
//    }

}
