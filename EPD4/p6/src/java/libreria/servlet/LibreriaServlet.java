package libreria.servlet;

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
import libreria.Almacen;
import libreria.Libro;

public class LibreriaServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session != null) {

            String accion = request.getParameter("Accion");
            if (accion != null) {
                if (accion.equals("agregar")) {

                    List<String> listaIsbns = (List<String>) session.getAttribute("isbns");
                    String isbn = request.getParameter("seleccionLibros");
                    Libro libro = null;
                    try {
                        libro = new Almacen().consultaLibro(Integer.parseInt(isbn));
                        if (libro != null) {
                            if (listaIsbns == null) {
                                listaIsbns = new ArrayList<String>(10);
                            }
                            listaIsbns.add(isbn);
                            session.setAttribute("isbns",listaIsbns);
                            session.setAttribute("tienda.carro", new Almacen().consultaListaLibrosSolicitados(listaIsbns));
                        } else {
                            PrintWriter out = response.getWriter();
                            out.print("ERROR: Libro con ISBN " + isbn + " no estádisponible.");
                            out.close();
                        }
                    } catch (Exception ex) {
                        PrintWriter out = response.getWriter();
                        out.print("ERROR: " + ex.getMessage());
                        out.close();
                    }
                    //OJO!! debe empezar con '/' para indicar que es relativo al contexto actual
                    String url = "/Tienda.jsp";
                    ServletContext sc = getServletContext();
                    RequestDispatcher rd = sc.getRequestDispatcher(url);
                    rd.forward(request, response);
                } else if (accion.equals("comprar")) {
                    String url = "/Compra.jsp";
                    ServletContext sc = getServletContext();
                    RequestDispatcher rd = sc.getRequestDispatcher(url);
                    rd.forward(request, response);
                }
            } else {
                //If it's the first time we enter the page or if we refresh
                String url = "/Tienda.jsp";
                try {
                    session.setAttribute("articulos", new Almacen().consultaLibrosDisponibles());
                    session.setAttribute("tienda.carro",new ArrayList<List<Libro>>());
                    ServletContext sc = getServletContext();
                    RequestDispatcher rd = sc.getRequestDispatcher(url);
                    rd.forward(request, response);
                } catch (SQLException ex) {
                    Logger.getLogger(LibreriaServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    public String getServletInfo() {
        return "Short description";
    }
}
