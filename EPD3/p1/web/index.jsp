<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EPD03 - P1 Grupo 3</title>
    </head>
    <body>

        <table border="1">

            <tr>

                <th>Matr&iacute;cula</th>
                <th>Modelo</th>
                <th>Hora de entrada</th>
                <th>Hora de salida</th>
                <th>Tiempo permitido</th>

            </tr>

            <%

                //We fill the list with all the cars in the system
                
                List<List> list = new ArrayList();

                List<Object> entry1 = new ArrayList();

                entry1.add("12784HIH");
                entry1.add("BMW");
                entry1.add("10:05");
                entry1.add("--");
                entry1.add(30);
                list.add(entry1);

                List<Object> entry2 = new ArrayList();
                entry2.add("76234AAC");
                entry2.add("Toyota");
                entry2.add("10:07");
                entry2.add("10:35");
                entry2.add(30);
                list.add(entry2);

                List<Object> entry3 = new ArrayList();
                entry3.add("32162BAQ");
                entry3.add("Audi");
                entry3.add("10:45");
                entry3.add("--");
                entry3.add(90);
                list.add(entry3);

                List<Object> entry4 = new ArrayList();
                entry4.add("87823CDA");
                entry4.add("Mercedes");
                entry4.add("10:46");
                entry4.add("11:05");
                entry4.add(15);
                list.add(entry4);
                
                //Now we print them all

                for (int i = 0; i < list.size(); i++) {

                    List<Object> current = list.get(i);

                    out.write("<tr>");

                    for (int j = 0; j < current.size(); j++) {

                        Object attribute = current.get(j);

            %>

            <td>
                <%=attribute%>
            </td>
            <%

                    }

                    out.write("</tr>");

                }


            %>

        </table>

    </body>
</html>
