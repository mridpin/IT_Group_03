<%@ page import="java.sql.*" %>
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

                //Prepare variables for conexion
                Class.forName("com.mysql.jdbc.Driver");
                Connection c = DriverManager.getConnection("jdbc:mysql://localhost/problema1", "root", "");

                //Setup and create Query
                Statement s = c.createStatement();

                ResultSet rs = s.executeQuery("SELECT * FROM parkingspots");

                ResultSetMetaData rsmd = rs.getMetaData();
                
                //We fetch the results and we iterate through it's colums to display them properly
            while(rs.next())
            {
               out.write("<tr>");
               
               for(int i=1;i<=rsmd.getColumnCount();i++)
               {
                   
                   out.write("<td>");
                   
                   if(i>=1 && i<5)
                   {
                       out.write(rs.getString(i));
                   }
                   else
                   {
                        %><%=rs.getInt(i)%><%
                   }
                   
                   out.write("</td>");
                   
                   
               }
               
               out.write("</tr>");
               
            }

            //We now close all the resources that we are using
            rs.close();
            s.close();
            c.close();


            %>

        </table>

    </body>
</html>
