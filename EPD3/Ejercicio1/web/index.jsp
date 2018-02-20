<%@page import="java.util.List"%>
<%@page import="parkingSystem.parkingSpot"%>
<%@page language="java" contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EPD03 - EJ1 Grupo 3</title>
    </head>
    <body>
        <jsp:useBean id="vBeanGarage" scope="session" class="parkingSystem.garage"/>
        
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
            List<parkingSpot> parkingSpots = vBeanGarage.currentSpots();

            for(int i=0;i<parkingSpots.size();i++)
            {
                
                parkingSpot current = parkingSpots.get(i);
                
                
                //We show all of the attributes of each entry
                out.write("<tr>");
                
                out.write("<td>");
                out.write(current.getMatricula());
                out.write("</td>");
                
                out.write("<td>");
                out.write(current.getModelo());
                out.write("</td>");
                
                out.write("<td>");
                out.write(current.getHoraEntrada());
                out.write("</td>");
                
                out.write("<td>");
                out.write(current.getHoraSalida());
                out.write("</td>");
                
                out.write("<td>");
                out.write(current.getTiempoPermitido());
                out.write("</td>");
                
                out.write("</tr>");
    
            }

        
        %>
        
        </table>
        
    </body>
</html>
