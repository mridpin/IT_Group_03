<%-- 
    Document   : index
    Created on : May 15, 2018, 10:18:41 AM
    Author     : ridao
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javax.ws.rs.core.GenericType"%>
<%@page import="model.PeliculasJerseyClient"%>
<%@page import="java.util.List"%>
<%@page import="model.POJOs.Pelicula"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    PeliculasJerseyClient client = new PeliculasJerseyClient();
    GenericType<List<Pelicula>> genericType = new GenericType<List<Pelicula>>() {
    };
    List<Pelicula> peliculas = client.findAll_JSON(genericType);
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>    
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EPD08 P8 - Grupo 03</title>
    </head>
    <body>
        <h1>EPD08 P8 - Grupo 03</h1>
        <article>
            <h2>PEL&Iacute;CULAS</h2>
            <table border="2">
                <tr>
                    <th>Nombre</th>
                    <th>Fecha estreno</th>
                    <th>Fecha V&iacute;deo</th>
                    <th>Idioma</th>
                    <th>Pa&iacute;s</th>
                    <th colspan="2">
                        <form method="get" action="peliculas.jsp">
                            <input type="submit" name="add" value="Añadir">
                        </form>
                    </th>
                </tr>
                <%
                    for (Pelicula p : peliculas) {
                %>
                <tr>
                    <td><%=p.getNombre()%></td>
                    <td><%=sdf.format(p.getFechaEstreno())%></td>
                    <td><%=sdf.format(p.getFechaVideo())%></td>
                    <td><%=p.getIdioma()%></td>
                    <td><%=p.getPais()%></td>
                    <td>
                        <form method="get" action="peliculas.jsp">
                            <input type="hidden" name="id" value="<%=p.getId()%>">
                            <input type="submit" name="edit" value="Modificar">
                        </form>
                    </td>
                    <td>
                        <form method="get" action="peliculas.jsp">
                            <input type="hidden" name="id" value="<%=p.getId()%>">
                            <input type="submit" name="delete" value="Borrar">
                        </form>
                    </td>
                </tr>
                <%
                    }
                %>
            </table>
        </article>
    </body>
</html>
