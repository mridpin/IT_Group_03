/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import parkingSystem.Garage;
import parkingSystem.Parkingspot;

/**
 *
 * @author ridao
 */
public class ServletP4 extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(false);
        String url="/index.jsp";
            List<Parkingspot> parkingspots = Garage.currentSpots();
            List<Parkingspot> resultados = new ArrayList();
            List<Parkingspot> filteredParking = new ArrayList<>();
            if (request.getParameter("Accion1")!=null) {
                 url = "/index.jsp";
                if (request.getParameter("submit_busqueda_matricula") != null) {
                    resultados = Garage.buscar(request.getParameter("busqueda"), parkingspots);
                } else if (request.getParameter("submit_busqueda_todavia_aparcamiento") != null) {
                    resultados = Garage.enAparcamiento(parkingspots);
                }
                session.setAttribute("lista", resultados);
            } else if (request.getParameter("Accion2") != null) {
                 url = "/agrupaciones.jsp";
                if (request.getParameter("excedidos") != null) {
                    
                    filteredParking= Garage.getCochesExcedidos(parkingspots);
                    session.setAttribute("excedidos", filteredParking);
                }else if (request.getParameter("no_excedidos") != null) {
                   
                    filteredParking=Garage.getCochesNoExcedidos(parkingspots);
                     session.setAttribute("no_excedidos", filteredParking);
                }
                session.setAttribute("lista",filteredParking);
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ServletP4.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ServletP4.class.getName()).log(Level.SEVERE, null, ex);
        }
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
