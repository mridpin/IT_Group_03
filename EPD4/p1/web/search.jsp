<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EPD 4 - Problema 1</title>

        <%!
            public List getSpots() {
                //list is our garage and inside it there are other lists that
                //Represent the ParkingSpots
                List list = new ArrayList();
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost/problema1", "root", "");
                    Statement solicitud = (Statement) conexion.createStatement();
                    ResultSet resultados = solicitud.executeQuery("Select * from parkingspots");

                    ResultSetMetaData rsmd = resultados.getMetaData();

                    while (resultados.next()) {
                        List aux = new ArrayList();

                        for (int i = 1; i <= rsmd.getColumnCount(); i++) {

                            if (i >= 1 && i < 5) {
                                aux.add(resultados.getString(i));
                            } else {
                                aux.add(resultados.getInt(i));
                            }
                        }

                        list.add(aux);

                    }
                    resultados.close();
                    solicitud.close();
                    conexion.close();
                } catch (Exception ex) {
                    throw new RuntimeException("ERROR: " + ex.getMessage());
                }

                return list;

            }

            public List getSpotsStill() {

                List result = new ArrayList();

                List all = this.getSpots();

                for (int i = 0; i < all.size(); i++) {

                    List current = (List) all.get(i);
                    //If their exit time is still --, it means they are still in the parking lot
                    if (current.get(3).equals("--")) {
                        result.add(current);
                    }

                }

                return result;

            }

            public List getSpotsByLicense(String license) {

                List result = new ArrayList();

                List all = this.getSpots();

                for (int i = 0; i < all.size(); i++) {

                    List current = (List) all.get(i);

                    String matricula = (String) current.get(0);
                    //We check is the current license contains the string that was provided
                    if (matricula.startsWith(license)) {
                        result.add(current);
                    }

                }

                return result;

            }

        %>

    </head>
    <body>  <%

        List list = this.getSpots();

        if (request.getParameter("search") != null) {
            list = this.getSpotsByLicense(request.getParameter("license"));
        } else if (request.getParameter("still") != null) {
            list = this.getSpotsStill();
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


            <%                for (int i = 0; i < list.size(); i++) {

                    List current = (List) list.get(i);

                    out.write("<tr>");

                    for (int j = 0; j < current.size(); j++) {

            %>

            <td>
                <%= current.get(j)%>
            </td>

            <%

                    }

                    out.write("</tr>");

                }


            %>

        </table>



        <form action="search.jsp" method="POST">

            Introduce los numeros de la matricula a buscar: <input type="text" name="license" >
            <br>

            <input type="submit" name="search" value="Search By License">

        </form>   
        <br>
        <form action="search.jsp" method="POST">

            <input type="submit" name="still" value="Still in parked">

        </form>
    </body>
</html>
