
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Noticias</title>
        <%

        %>
    </head>
    <body>
        <h1>Noticias de &uacute;ltima hora</h1>
        <form method="post" action="#">
                    
                    <% if (request.getParameter("ocultar1") != null && request.getParameter("ocultar1").equals("ocultar")) {
                    %>
                    <h3>Noticia1</h3>
                <br>
                    <p>Información no mostrada</p>
                    <% } else { %>
                    <%@include file="/Trump.jsp" %>
                    <% }%>
                    <br>
                    Ocultar noticia: <input name="ocultar1" type="radio" value="ocultar" /> Mostrar noticia: <input name="ocultar1" type="radio" value="mostrar" />
                    <br>
                    <% if (request.getParameter("ocultar2") != null && request.getParameter("ocultar2").equals("ocultar")) {
                    %>
                    <h3>Noticia2</h3>
                <br>
                    <p>Información no mostrada</p>
                    <% } else { %>
                    <%@include file="/Corea.jsp" %>
                    <% }%>
                    <br>
                    Ocultar noticia: <input name="ocultar2" type="radio" value="ocultar" /> Mostrar noticia: <input name="ocultar2" type="radio" value="mostrar" />
                    <br>
                    <% if (request.getParameter("ocultar3") != null && request.getParameter("ocultar3").equals("ocultar")) {
                    %>
                    <h3>Noticia3</h3>
                <br>
                    <p>Información no mostrada</p>
                    <% } else { %>
                    <%@include file="/Panther.jsp" %>
                    <% }%>
                    <br>
                    Ocultar noticia: <input name="ocultar3" type="radio" value="ocultar" /> Mostrar noticia: <input name="ocultar3" type="radio" value="mostrar" />
                    <br>
                    
                    <input name="btnSub" type="submit" value="Confirmar" />
        </form>
    </body>
</html>
