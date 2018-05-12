<%@page import="Entidades.Libro"%>
<%@page import="javax.ws.rs.core.GenericType"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="libros" scope="request" class="Entidades.LibroJersey"/>

        <%
            //We want to add a new Book
            if (request.getParameter("nuevoLibro") != null) {
                GenericType<Libro> genericTypeLibro = new GenericType<Libro>() {
                };

                //We create the new Book
                Libro newLibro = new Libro();
                newLibro.setAutor(request.getParameter("autor"));
                newLibro.setTitulo(request.getParameter("titulo"));
                newLibro.setPrecio(Float.parseFloat(request.getParameter("precio")));
                newLibro.setIsbn(Integer.parseInt(request.getParameter("isbn")));

                //We send it to the Web Service to create it
                libros.create_XML(newLibro);

                out.write("<h1>Se ha creado el nuevo libro correctamente</h1><br>");

            } //We want to get a book
            else if (request.getParameter("getLibro") != null) {
                GenericType<Libro> genericTypeLibro = new GenericType<Libro>() {
                };

                //We fecth the book
                Libro result = libros.find_XML(genericTypeLibro, request.getParameter("id"));

                //We check if it exists
                if (result != null) {
                    out.write("<h1>Libro encontrado:</h1><br>Titulo: " + result.getTitulo() + "<br>Autor: " + result.getAutor() + "<br>ISBN: " + result.getIsbn() + "<br>Precio: " + result.getPrecio() + "<br>");
                } else {
                    out.write("<h1>El libro no ha podido ser encontrado</h1><br>");
                }

            } 
            //We want to modify a book
            else if (request.getParameter("modificarLibro") != null) {
                GenericType<Libro> genericTypeLibro = new GenericType<Libro>() {
                };

                //We try to fetch the book
                Libro result = libros.find_XML(genericTypeLibro, request.getParameter("id"));

                //We check if it exists before we try to modify it
                if (result != null) {
                    
                    //We modify it
                    result.setAutor(request.getParameter("autor"));
                    result.setPrecio(Float.parseFloat(request.getParameter("precio")));
                    result.setTitulo(request.getParameter("titulo"));
                    result.setIsbn(Integer.parseInt(request.getParameter("isbn")));

                    //We send it to the Web Service to edit it
                    libros.edit_XML(result, request.getParameter("id"));

                    out.write("<h1>El libro se ha modificado correctamente</h1><br>");
                } else {
                    out.write("<h1>El libro no existe, por lo que no se puede modificar</h1><br>");
                }

            } 
            //We want to delete it
            else if (request.getParameter("deleteLibro") != null) {
                GenericType<Libro> genericTypeLibro = new GenericType<Libro>() {
                };
                Libro result;

                //We fetch it to check if it exists
                result = libros.find_XML(genericTypeLibro, request.getParameter("id"));

                //We check if it exists
                if (result != null) {

                    //We call the Web service to delete it
                    libros.remove(request.getParameter("id"));

                    out.write("<h1>El libro se ha borrado correctamente</h1><br>");
                }
                else
                {
                    out.write("<h1>El libro no existe, por lo que no se puede borrar</h1><br>");
                }

            }

        %>

        <h2>EPD08 - P6 - Grupo03</h2>
        <br>
        <h2>Selecciona una opci&oacute;n</h2>
        <br>
        <h3>Crear un libro</h3>
        <br>
        <form action="index.jsp" name="nuevoLibro">
            <input type="hidden" name="nuevoLibro"/>
            Autor: <input type="text" name="autor" />
            <br>
            ISBN: <input type="text" name="isbn" />
            <br>
            Precio: <input type="text" name="precio" />
            <br>
            T&iacute;tulo: <input type="text" name="titulo" />
            <br>
            <br>
            <input type="submit" name="Crear" value="Crear"/>
            <hr>
        </form>

        <h3>Mostrar un libro</h3>
        <br>
        <form action="index.jsp" name="getLibro">
            <input type="hidden" name="getLibro"/>
            ID del Libro: <input type="text" name="id" />
            <br>
            <br>
            <input type="submit" name="Buscar" value="Buscar"/>
            <hr>
        </form>

        <h3>Modificar un libro</h3>
        <br>
        <form action="index.jsp" name="modificarLibro">
            <input type="hidden" name="modificarLibro"/>
            Autor: <input type="text" name="autor" />
            <br>
            ID del Libro: <input type="text" name="id" />
            <br>
            ISBN: <input type="text" name="isbn" />
            <br>
            Precio: <input type="text" name="precio" />
            <br>
            T&iacute;tulo: <input type="text" name="titulo" />
            <br>
            <br>
            <input type="submit" name="Modificar" value="Modificar"/>
            <hr>
        </form>

        <h3>Eliminar un libro</h3>
        <br>
        <form action="index.jsp" name="deleteLibro">
            <input type="hidden" name="deleteLibro"/>
            ID del Libro: <input type="text" name="id" />
            <br>
            <br>
            <input type="submit" name="Eliminar" value="Eliminar"/>
            <hr>
        </form>

    </body>
</html>
