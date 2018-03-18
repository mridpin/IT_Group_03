<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.jdbc.Statement"%>
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
    </head>
    <body>
       <%
           //Prepare variables for conexion
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost/problema1","root","");
            Statement solicitud = (Statement) conexion.createStatement();
            ResultSet resultados = solicitud.executeQuery("Select * from parkingspots");
            
            ResultSetMetaData rsmd = resultados.getMetaData();


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
                //We fecth the results
                while(resultados.next())
                {
                    
                    out.write("<tr>");
                    //For every colum of each result
                    for(int i=1;i<=rsmd.getColumnCount();i++)
                    {
                        
                        out.write("<td>");
                        
                        if(i>=1 && i<5)
                        {
                            out.write(resultados.getString(i));
                        }
                        else
                        {
                            %>
                            
                              <%=resultados.getInt(i)%> 
                            
                            <%
                        
                        }

                        out.write("</td>");    

                    }
                    out.write("</tr>");
                }
                    //We now close all the resources that we are using
                    resultados.close();
                    solicitud.close();
                    conexion.close();
            
            
            %>
            
            </table>
            
             <form action="groupBy.jsp" method="POST">
            
            <input type="submit" name="enviar" value="Group Spots">
            
            </form>
            
             <br>
        <form action="search.jsp" method="POST">
            
            <input type="submit" name="enviar" value="Search Spots">
            
        </form>
            
    </body>
</html>
