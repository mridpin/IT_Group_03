/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import parkingSystem.Garage;
import parkingSystem.Parking;

/**
 *
 * @author ridao
 */
public class ParkingCRUDServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession(false);
        String url = "/parking.jsp";

        if (request.getParameter("editar") != null) {
            Parking parking = null;
            // Mostramos el parking que se va a editar usando el indice del formulario para cogerlo de la lista que devuelve el modelo
            parking = Garage.currentSpots().get(Integer.parseInt(request.getParameter("indice")));
            // Pasamos los datos a traves de variable de sesion
            session.setAttribute("Parking", parking);
        } else if (request.getParameter("guardar") != null) {
            int entrada = Integer.parseInt(request.getParameter("entrada").split(":")[1]) + Integer.parseInt(request.getParameter("entrada").split(":")[0]) * 60;
            String salida = "";
            if (!request.getParameter("salida").equals("--")) {
                Integer salidaMinutos = (Integer.parseInt(request.getParameter("salida").split(":")[0]) * 60) + Integer.parseInt(request.getParameter("salida").split(":")[1]);
                salida = salidaMinutos.toString();
            } else {
                salida = "--";
            }
            Parking parking = new Parking(request.getParameter("matricula"), request.getParameter("modelo"), entrada, salida, Integer.parseInt(request.getParameter("tiempo")));
            Garage.updateParking(parking);
            url = "/index.jsp";
        } else if (request.getParameter("borrar") != null) {
            int i = Integer.parseInt(request.getParameter("indice"));
            // El controlador pide al modelo todos los parking y se queda con el que indica el indice pasado por formulario
            Parking parking = Garage.currentSpots().get(i);
            Garage.deleteParking(parking);
            url = "/index.jsp";
        } else if (request.getParameter("crear") != null) {
            // Redireccionamos a parking.jsp manteniendo el parameter crear para distinguir alli los formularios de crear y editar
        } else if (request.getParameter("anyadir") != null) {
            // Tomamos los datos del formulario y los añadimos a la db
            int entrada = Integer.parseInt(request.getParameter("entrada").split(":")[1]) + Integer.parseInt(request.getParameter("entrada").split(":")[0]) * 60;
            String salida = "";
            if (!request.getParameter("salida").equals("--")) {
                Integer salidaMinutos = (Integer.parseInt(request.getParameter("salida").split(":")[0]) * 60) + Integer.parseInt(request.getParameter("salida").split(":")[1]);
                salida = salidaMinutos.toString();
            } else {
                salida = "--";
            }
            Parking parking = new Parking(request.getParameter("matricula"), request.getParameter("modelo"), entrada, salida, Integer.parseInt(request.getParameter("tiempo")));
            Garage.createParking(parking);
            url = "/index.jsp";
        }

        session.setAttribute("action", "controlador");
        ServletContext sc = getServletContext();
        RequestDispatcher rd = sc.getRequestDispatcher(url);
        rd.forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
