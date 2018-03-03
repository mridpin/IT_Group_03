<%@page import="parkingSystem.Garage"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="parkingSystem.ParkingSpot"%>
<%@page language="java" contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EPD03 - P2 Grupo 3</title>
    </head>
    <body>
    
        <h1>Aparcamientos</h1>
        <table border="1">        
            <tr>                
                <th>Matr&iacute;cula</th>
                <th>Modelo</th>
                <th>Hora de entrada</th>
                <th>Hora de salida</th>
                <th>Tiempo permitido</th>                
            </tr>

            <%
                //We get all the spots in the system and them we show them
                if(request.getParameter("Accion3")!= null){
                    session.setAttribute("lista", null);
                }
                List<ParkingSpot> resultados  = new ArrayList();
                List<ParkingSpot> parkingSpots = Garage.currentSpots();
                if(session.getAttribute("lista")!=null){
                    resultados = (List)session.getAttribute("lista");
                    parkingSpots.clear();
                    parkingSpots.addAll(resultados);
                }
                String action = (String) session.getAttribute("action");
            if (action == null) {
                response.sendRedirect("ServletP4");
            } else {

                for (int i = 0; i < parkingSpots.size(); i++) {
                    ParkingSpot current = parkingSpots.get(i);

                    String matricula = current.getMatricula();
                    String modelo = current.getModelo();
                    String horaEntrada = current.getHoraEntrada();
                    String horaSalida = current.getHoraSalida();
                    int tiempoPermitido = current.getTiempoPermitido();
                
                    //We show all of the attributes of each entry
%>

            <tr>
                <td>
                    <%=matricula%>
                </td>
                <td>
                    <%=modelo%>
                </td>
                <td>
                    <%=horaEntrada%>
                </td>
                <td>
                    <%=horaSalida%>
                </td>
                <td>
                    <%=tiempoPermitido%>
                </td>
            </tr>
            <%
                }
        }
            %>
        </table>
        <br />
        <form action="ServletP4" method="get">
            <input type="hidden" name="Accion2" value="agrupaciones">
            <input type="submit" name="submit" value="Ver Agrupaciones">
        </form>
        <br />

        <h3>B&uacute;squedas</h3>        
        <form action="ServletP4" method="get">
            <label>Buscar si la matr&iacute;cula comienza por: </label><input type="text" name="busqueda">
            <input type="hidden" name="Accion1" value="index">
            <input type="submit" name="submit_busqueda_matricula" value="Buscar">
        </form>
        <form action="ServletP4" method="get">
            <label>Buscar veh&iacute;culos todav&iacute;a en el aparcamiento: </label>
            <input type="hidden" name="Accion1" value="index">
            <input type="submit" name="submit_busqueda_todavia_aparcamiento" value="Buscar">
        </form>
        <br />
        <h3>Ver todos</h3>
        <form action="ServletP4" method="get">
            <input type="hidden" name="Accion1" value="index">
            <input type="submit" name="ver_todos" value="Ver todos">
        </form>
    </body>
</html>
