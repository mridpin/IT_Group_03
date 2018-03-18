<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
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

            public List LateSpots(List original) {

                Iterator it = original.iterator();

                while (it.hasNext()) {

                    List current = (List) it.next();

                    //If we know when it exited
                    if (!current.get(3).equals("--")) {

                        String sEntrada = (String) current.get(2);
                        String sSalida = (String) current.get(3);
                        //We split the Strings delimited with : into 0 --> Hours   1--> Minutes 
                        String auxEntrada[] = sEntrada.split(":", -1);
                        String auxSalida[] = sSalida.split(":", -1);

                        //We transform everything into minutes
                        int mEntrada = Integer.parseInt(auxEntrada[0]) * 60 + Integer.parseInt(auxEntrada[1]);
                        int mSalida = Integer.parseInt(auxSalida[0]) * 60 + Integer.parseInt(auxSalida[1]);

                        //If the car wasnt late, we remove it from the result
                        if (mSalida > mEntrada + (int) current.get(4)) {
                            it.remove();
                        }

                    } else {
                        it.remove();
                    }

                }

                return original;
            }

            public List notLateSpots(List original) {

                Iterator it = original.iterator();

                while (it.hasNext()) {

                    List current = (List) it.next();

                    //If we know when it exited
                    if (!current.get(3).equals("--")) {

                        String sEntrada = (String) current.get(2);
                        String sSalida = (String) current.get(3);
                        //We split the Strings delimited with : into 0 --> Hours   1--> Minutes 
                        String auxEntrada[] = sEntrada.split(":", -1);
                        String auxSalida[] = sSalida.split(":", -1);

                        //We transform everything into minutes
                        int mEntrada = Integer.parseInt(auxEntrada[0]) * 60 + Integer.parseInt(auxEntrada[1]);
                        int mSalida = Integer.parseInt(auxSalida[0]) * 60 + Integer.parseInt(auxSalida[1]);

                        //If the car wasnt late, we remove it from the result
                        if (mSalida < mEntrada + (int) current.get(4)) {
                            it.remove();
                        }

                    }

                }

                return original;
            }

        %>


    </head>
    <body>
        <%

            List list = this.getSpots();

            if (request.getParameter("late") != null) {
                list = this.LateSpots(list);
            } else if (request.getParameter("notlate") != null) {
                list = this.notLateSpots(list);
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



        <form action="groupBy.jsp" method="POST">

            <input type="submit" name="late" value="Late Spots">

        </form>   
        <br>
        <form action="groupBy.jsp" method="POST">

            <input type="submit" name="notlate" value="On Time Spots">

        </form>
    </body>
</html>
