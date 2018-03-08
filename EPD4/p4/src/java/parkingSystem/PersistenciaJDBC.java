/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parkingSystem;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ridao
 */
public class PersistenciaJDBC {

    private static final String controlador = "com.mysql.jdbc.Driver";
    private static final String url = "jdbc:mysql://localhost/garage";
    private static final String usuario = "root";
    private static final String clave = "";

    static {
        try {
            Class.forName(controlador);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Error loading JDBC driver"
                    + " class. Cause: " + e);
        }
    }

    public static List<ParkingSpot> currentSpots() throws SQLException {
        List<ParkingSpot> lista = new ArrayList<>();
        // Paso 1: Crear connection
        Connection conexion = DriverManager.getConnection(url, usuario, clave);
        // Paso 2: Crear statement
        Statement solicitud = (Statement) conexion.createStatement();
        // Paso 3: Ejecutar query con el statement
        String sql = "SELECT * FROM parking";
        ResultSet resultados = solicitud.executeQuery(sql);
        while (resultados.next()) {
            ParkingSpot parking = PersistenciaJDBC.SetResultToParking(resultados);
            lista.add(parking);
        }
        resultados.close();
        solicitud.close();
        conexion.close();
        return lista;
    }

    private static ParkingSpot SetResultToParking(ResultSet resultado) throws SQLException {
        int minutosEntrada = resultado.getInt("entrada") % 60;
        int horasEntrada = resultado.getInt("entrada") / 60;
        String entrada = String.format("%02d", horasEntrada) + ":" + String.format("%02d", minutosEntrada);

        String salida = "";
        if (!resultado.getString("salida").equals("--")) {
            int minutosSalida = resultado.getInt("salida") % 60;
            int horasSalida = resultado.getInt("salida") / 60;
            salida = String.format("%02d", horasSalida) + ":" + String.format("%02d", minutosSalida);
        } else {
            salida = "--";
        }

        ParkingSpot parking = new ParkingSpot(resultado.getString("matricula"), resultado.getString("modelo"), entrada, salida, resultado.getInt("tiempo_permitido"));
        return parking;
    }

    static void updateParking(String matricula, String modelo, int horaEntrada, String horaSalida, int tiempoPermitido) throws SQLException {
        // Paso 1: Crear connection
        Connection conexion = DriverManager.getConnection(url, usuario, clave);
        // Paso 2: Crear statement
        Statement solicitud = (Statement) conexion.createStatement();
        // Paso 3: Ejecutar query con el statement
        String sql = "UPDATE parking SET modelo='" + modelo + "', entrada='" + horaEntrada + "', salida='" + horaSalida + "', tiempo_permitido='" + tiempoPermitido + "' WHERE matricula='" + matricula + "'";
        // executeQuery no funciona con insert, update, delete. https://stackoverflow.com/questions/1905607/cannot-issue-data-manipulation-statements-with-executequery
        solicitud.executeUpdate(sql);

        solicitud.close();
        conexion.close();
    }

    static void deleteParking(String matricula) throws SQLException {
        // Paso 1: Crear connection
        Connection conexion = DriverManager.getConnection(url, usuario, clave);
        // Paso 2: Crear statement
        Statement solicitud = (Statement) conexion.createStatement();
        // Paso 3: Ejecutar query con el statement
        String sql = "DELETE FROM parking WHERE matricula='" + matricula + "'";
        // executeQuery no funciona con insert, update, delete. https://stackoverflow.com/questions/1905607/cannot-issue-data-manipulation-statements-with-executequery
        solicitud.executeUpdate(sql);

        solicitud.close();
        conexion.close();
    }

    static void createParking(String matricula, String modelo, int entrada, String salida, int tiempoPermitido) throws SQLException {
        // Paso 1: Crear connection
        Connection conexion = DriverManager.getConnection(url, usuario, clave);
        // Paso 2: Crear statement
        Statement solicitud = (Statement) conexion.createStatement();
        // Paso 3: Ejecutar query con el statement
        String sql = "INSERT INTO parking (matricula, modelo, entrada, salida, tiempo_permitido) VALUES ('"+matricula+"', '"+modelo+"', '"+entrada+"', '"+salida+"', '"+tiempoPermitido+"')";
        // executeQuery no funciona con insert, update, delete. https://stackoverflow.com/questions/1905607/cannot-issue-data-manipulation-statements-with-executequery
        solicitud.executeUpdate(sql);

        solicitud.close();
        conexion.close();
    }

}
