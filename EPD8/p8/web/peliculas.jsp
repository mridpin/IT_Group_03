<%-- 
    Document   : peliculas
    Created on : May 15, 2018, 11:06:30 AM
    Author     : ridao
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="javax.ws.rs.core.GenericType"%>
<%@page import="model.POJOs.Pelicula"%>
<%@page import="model.PeliculasJerseyClient"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    PeliculasJerseyClient client = new PeliculasJerseyClient();

    if (request.getParameter("modificar") != null) {
        Pelicula p = new Pelicula();
        p.setId(Integer.parseInt(request.getParameter("id")));
        p.setNombre(request.getParameter("nombre"));
        //Date estreno = new SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy").parse(request.getParameter("fechaEstreno"));
        p.setFechaEstreno(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("fechaEstreno")));
        // Tue Jun 01 00:00:00 CEST 1993
        //Date video = new SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy").parse(request.getParameter("fechaVideo"));
        p.setFechaVideo(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("fechaVideo")));
        p.setIdioma(request.getParameter("idioma"));
        p.setPais(request.getParameter("pais"));
        client.edit_JSON(p, p.getId().toString());
        request.getRequestDispatcher("redirect.jsp").forward(request, response);
    } else if (request.getParameter("crear") != null) {
        Pelicula p = new Pelicula();
        p.setNombre(request.getParameter("nombre"));
//        Date estreno = new SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy").parse(request.getParameter("fechaEstreno"));
//        p.setFechaEstreno(estreno);
//        // Tue Jun 01 00:00:00 CEST 1993
//        Date video = new SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy").parse(request.getParameter("fechaVideo"));
//        p.setFechaVideo(video);
        p.setFechaEstreno(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("fechaEstreno")));
        // Tue Jun 01 00:00:00 CEST 1993
        //Date video = new SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy").parse(request.getParameter("fechaVideo"));
        p.setFechaVideo(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("fechaVideo")));
        p.setIdioma(request.getParameter("idioma"));
        p.setPais(request.getParameter("pais"));
        client.create_JSON(p);
        request.getRequestDispatcher("redirect.jsp").forward(request, response);
    } else if (request.getParameter("delete") != null) {
        client.remove(request.getParameter("id"));
        request.getRequestDispatcher("redirect.jsp").forward(request, response);
    }
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
            <form method="post" action="peliculas.jsp">
                <table border="2">
                    <tr>
                        <th>Nombre</th>
                        <th>Fecha estreno</th>
                        <th>Fecha V&iacute;deo</th>
                        <th>Idioma</th>
                        <th>Pa&iacute;s</th>
                    </tr>
                    <% if (request.getParameter("add") != null) {
                    %>
                    <tr>
                        <td><input type="text" name="nombre"></td>
                        <td><input type="text" name="fechaEstreno"></td>
                        <td><input type="text" name="fechaVideo"></td>
                        <td><input type="text" name="idioma"></td>
                        <td><input type="text" name="pais"></td>
                    </tr>
                </table>
                <input type = "submit" name = "crear" value = "Crear">
                <% } else {
                    GenericType<Pelicula> genericType = new GenericType<Pelicula>() {
                    };
                    Pelicula p = client.find_JSON(genericType, request.getParameter("id"));
                %>
                <tr>
                    <td><input type="text" name="nombre" value="<%=p.getNombre()%>"></td>
                    <td><input type="text" name="fechaEstreno" value="<%=p.getFechaEstreno()%>"></td>
                    <td><input type="text" name="fechaVideo" value="<%=new SimpleDateFormat("yyyy-MM-dd").parse(p.getFechaVideo().toString())%>"></td>
                    <td><input type="text" name="idioma" value="<%=p.getIdioma()%>"></td>
                    <td><input type="text" name="pais" value="<%=p.getPais()%>"></td>
                </tr>
                </table>
                <input type="hidden" name="id" value="<%=p.getId()%>">
                <input type = "submit" name = "modificar" value = "Guardar">
                <%
                    }
                %>
            </form>
            <p>Formato de las fechas: <em>Mon Jan 01 00:00:00 CEST 2000</em></p>
    </body> 
</html>
