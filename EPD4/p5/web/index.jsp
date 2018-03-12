<%@page import="parkingSystem.Garage"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="parkingSystem.Parking"%>
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
                <th>
                    <form action="ParkingCRUDServlet" method="get" style="display:inline;">
                        <input type="hidden" name="crear" value="crear">
                        <button type="submit" name="submit" value="crear"><img src="imgs/add.png" alt="crear" width="40px"></button>
                    </form>
                </th>                
            </tr>

            <%
                //We get all the spots in the system and them we show them
                if (request.getParameter("Accion3") != null) {
                    session.setAttribute("lista", null);
                }
                List<Parking> resultados = new ArrayList();
                List<Parking> Parkings = Garage.currentSpots();
                if (session.getAttribute("lista") != null) {
                    resultados = (List) session.getAttribute("lista");
                    Parkings.clear();
                    Parkings.addAll(resultados);
                }
                String action = (String) session.getAttribute("action");
                if (action == null) {
                    response.sendRedirect("ServletP4");
                } else {
                    for (int i = 0; i < Parkings.size(); i++) {
                        Parking current = Parkings.get(i);

                        String matricula = current.getMatricula();
                        String modelo = current.getModelo();
                        int entrada = current.getEntrada();
                        // Turn 60/h+min integer into hh:mm with 2 digit padding
                        String horaEntrada = String.format("%02d", (entrada / 60)) + ":" + String.format("%02d", (entrada % 60));
                        int salida = (current.getSalida().matches("\\d+")) ? Integer.parseInt(current.getSalida()) : -1;
                        String horaSalida = (salida != -1) ? String.format("%02d", (salida / 60)) + ":" + String.format("%02d", (salida % 60)) : "--";
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
                <td>
                    <form action="ParkingCRUDServlet" method="get" style="display:inline;">
                        <input type="hidden" name="editar" value="editar">
                        <input type="hidden" name="indice" value="<%=i%>">
                        <button type="submit" name="submit" value="editar"><img src="imgs/edit.png" alt="edit" width="20px"></button>
                    </form>
                    <form action="ParkingCRUDServlet" method="get" style="display:inline;">
                        <input type="hidden" name="borrar" value="borrar">
                        <input type="hidden" name="indice" value="<%=i%>">
                        <button type="submit" name="submit" value="borrar"><img src="imgs/cancel.png" alt="delete" width="20px"></button>
                    </form>
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
            <input type="hidden" name="Accion3" value="index">
            <input type="submit" name="ver_todos" value="Ver todos">
        </form>
    </body>
</html>
