<%-- 
    Document   : parking
    Created on : Mar 7, 2018, 7:15:46 PM
    Author     : ridao
--%>

<%@page import="parkingSystem.ParkingSpot"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Parking</title>
    </head>
    <body>
        <article>
            <section>
                <h1>Aparcamientos</h1>
                <table border="1">        
                    <tr>                
                        <th>Matr&iacute;cula</th>
                        <th>Modelo</th>
                        <th>Hora de entrada</th>
                        <th>Hora de salida</th>
                        <th>Tiempo permitido</th>                
                    </tr>
                    <tr>       
                        <%
                            // Comprbamos si estamos editando o creando un parking mediante el campo oculto del formulario
                            if (request.getParameter("editar") != null) {

                        %>                         
                        <td>
                            <form method="get" action="ParkingSpotCRUDServlet" id="form"></form>
                            <input type="text" name="matricula" disabled="disabled" value="<%=((ParkingSpot) session.getAttribute("parkingSpot")).getMatricula()%>">
                        </td>
                        <td>
                            <input type="text" name="modelo" form="form" value="<%=((ParkingSpot) session.getAttribute("parkingSpot")).getModelo()%>">
                        </td>
                        <td>
                            <input type="text" name="entrada" form="form" value="<%=((ParkingSpot) session.getAttribute("parkingSpot")).getHoraEntrada()%>">
                        </td>
                        <td>
                            <input type="text" name="salida" form="form" value="<%=((ParkingSpot) session.getAttribute("parkingSpot")).getHoraSalida()%>">
                        </td>
                        <td>
                            <input type="number" name="tiempo" form="form" value="<%=((ParkingSpot) session.getAttribute("parkingSpot")).getTiempoPermitido()%>">
                        </td>
                        <%
                            }
                        %>
                    </tr>
                </table>
                    <br />
                    <input type="submit" name="guardar" value="Guardar" form="form">
            </section>
        </article>

    </body>
</html>
