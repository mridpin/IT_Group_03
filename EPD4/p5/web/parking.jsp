<%-- 
    Document   : parking
    Created on : Mar 7, 2018, 7:15:46 PM
    Author     : ridao
--%>

<%@page import="parkingSystem.Parking"%>
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
                <h1>Crear o Editar Aparcamientos</h1>
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
                            // Comprbamos si estamos editando o creando un parking mediante el formulario
                            if (request.getParameter("editar") != null) {
                                Parking parking = ((Parking) session.getAttribute("Parking"));
                                int entrada = parking.getEntrada();
                                // Turn 60/h+min integer into hh:mm with 2 digit padding
                                String horaEntrada = String.format("%02d", (entrada / 60)) + ":" + String.format("%02d", (entrada % 60));
                                int salida = (parking.getSalida().matches("\\d+")) ? Integer.parseInt(parking.getSalida()) : -1;
                                String horaSalida = (salida != -1) ? String.format("%02d", (salida / 60)) + ":" + String.format("%02d", (salida % 60)) : "--";
                        %>                         
                        <td>
                            <form method="get" action="ParkingCRUDServlet" id="form"></form>
                            <input type="text" name="matricula" form="form" readonly="readonly" value="<%=parking.getMatricula()%>">
                        </td>
                        <td>
                            <input type="text" name="modelo" form="form" value="<%=parking.getModelo()%>">
                        </td>
                        <td>
                            <input type="text" name="entrada" form="form" value="<%=horaEntrada%>">
                        </td>
                        <td>
                            <input type="text" name="salida" form="form" value="<%=horaSalida%>">
                        </td>
                        <td>
                            <input type="number" name="tiempo" form="form" value="<%=parking.getTiempoPermitido()%>">
                        </td>
                        <%
                        } else if (request.getParameter("crear") != null) {
                        %>
                        <td>
                            <form method = "get" action = "ParkingCRUDServlet" id = "form" ></form> 
                            <input type="text" name="matricula" form="form" value="1234EXA">
                        </td>
                        <td>
                            <input type="text" name="modelo" form="form" value="Example Car 3">
                        </td>
                        <td>
                            <input type="text" name="entrada" form="form" value="00:00">
                        </td>
                        <td>
                            <input type="text" name="salida" form="form" value="00:00">
                        </td>
                        <td>
                            <input type="number" name="tiempo" form="form" value="0">
                        </td>
                        <%
                            }
                        %>
                    </tr>
                </table>
                <br />
                <%
                    if (request.getParameter("editar") != null) {
                %>
                <input type="submit" name="guardar" value="Guardar" form="form">
                <%
                } else if (request.getParameter("crear") != null) {
                %>
                <input type="submit" name="anyadir" value="A&ntilde;adir" form="form">
                <%
                    }
                %>
            </section>
        </article>

    </body>
</html>
