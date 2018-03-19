

<%@page import="parkingSystem.Garage"%>
<%@page import="java.util.ArrayList"%>
<%@page import="parkingSystem.Parkingspot"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EPD03 - P2 Grupo 3</title>
    </head>
    <body> 
        <h1>Agrupaciones</h1>
        <%
            if (request.getParameter("excedidos") != null) {
                out.write("<h2>Parkings excedidos</h2>");
            } else if (request.getParameter("no_excedidos") != null) {
                out.write("<h2>Parkings no excedidos</h2>");
            }
        %>
        <table border="1">        
            <tr>                
                <th>Matr&iacute;cula</th>
                <th>Modelo</th>
                <th>Hora de entrada</th>
                <th>Hora de salida</th>
                <th>Tiempo permitido</th>                
            </tr>


            <%
                List<Parkingspot> filteredParking = new ArrayList();
                 List<Parkingspot> parkingspots = Garage.currentSpots();
                //We get all the spots in the system and them we show them
                ///List<Parkingspot> parkingspots = vBeanGarage.currentSpots();
                if(session.getAttribute("lista")!=null){
                 filteredParking = (List)session.getAttribute("lista");
                
                for (int i = 0; i < filteredParking.size(); i++) {
                    Parkingspot current = filteredParking.get(i);

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
            <input type="submit" name="excedidos" value="Ver Excedidos">
            <input type="submit" name="no_excedidos" value="Ver No Excedidos">
        </form>
        <br />
        <form action="ServletP4" method="get">
            <input type="hidden" name="Accion3" value="index">
            <input type="submit" name="todos" value="Ver Todos">
        </form>
    </body>
</html>
