/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import parkingSystem.Garage;
import parkingSystem.ParkingSpot;


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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(false);
        String url="/index.jsp";
            List<ParkingSpot> parkingSpots = Garage.currentSpots();
            List<ParkingSpot> resultados = new ArrayList();
            List<ParkingSpot> filteredParking = new ArrayList<>();
            if (request.getParameter("Accion1")!=null) {
                 url = "/index.jsp";
                if (request.getParameter("submit_busqueda_matricula") != null) {
                    resultados = Garage.buscar(request.getParameter("busqueda"), parkingSpots);
                } else if (request.getParameter("submit_busqueda_todavia_aparcamiento") != null) {
                    resultados = Garage.enAparcamiento(parkingSpots);
                }
                session.setAttribute("lista", resultados);
            } else if (request.getParameter("Accion2") != null) {
                 url = "/agrupaciones.jsp";
                if (request.getParameter("excedidos") != null) {
                    
                    filteredParking= Garage.getCochesExcedidos(parkingSpots);
                    session.setAttribute("excedidos", filteredParking);
                }else if (request.getParameter("no_excedidos") != null) {
                   
                    filteredParking=Garage.getCochesNoExcedidos(parkingSpots);
                     session.setAttribute("no_excedidos", filteredParking);
                }
                session.setAttribute("lista",filteredParking);
            }
            
            session.setAttribute("action", "controlador");
        
        ServletContext sc = getServletContext();
        RequestDispatcher rd = sc.getRequestDispatcher(url);
        rd.forward(request, response);

    
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet ServletP4</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet ServletP4 at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
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
