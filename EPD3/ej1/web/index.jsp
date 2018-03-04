<%@page import="java.util.List"%>
<%@page import="parkingSystem.ParkingSpot"%>
<%@page language="java" contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EPD03 - EJ1 Grupo 3</title>
    </head>
    <body>
        <jsp:useBean id="vBeanGarage" scope="session" class="parkingSystem.Garage"/>
        
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

            for(int i=0;i<parkingSpots.size();i++)
            {
                
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
        
    </body>
</html>
