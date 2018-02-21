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
        <jsp:useBean id="vBeanGarage" scope="session" class="parkingSystem.Garage"/>     
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
                List<ParkingSpot> parkingSpots = vBeanGarage.currentSpots();
                if (request.getParameter("submit_busqueda") != null) {
                    List<ParkingSpot> resultados = vBeanGarage.buscar(request.getParameter("busqueda"), parkingSpots);
                    parkingSpots.clear();
                    parkingSpots.addAll(resultados);
                }

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
            %>
        </table>
        <br />
        <form action="agrupaciones.jsp" method="get">
            <input type="submit" name="submit" value="Ver Agrupaciones">
        </form>
        <br />
        <h3>Buscar si la matr&iacute;cula comienza por:</h3>
        <form action="index.jsp" method="get">
            <input type="text" name="busqueda">
            <input type="submit" name="submit_busqueda" value="Buscar">
        </form>
        <br />
        <h3>Ver todos</h3>
        <form action="index.jsp" method="get">
            <input type="submit" name="ver_todos" value="Ver todos">
        </form>
    </body>
</html>
