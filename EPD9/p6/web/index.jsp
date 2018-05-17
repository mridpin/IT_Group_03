<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.3.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Grupo 03 - EPD09 - P6</title>
        
        <script lang="text/javascript">

            $(document).ready(function ()
            {
                
                //Load the data entries into the table
                var xhttp = new XMLHttpRequest();
                //Get all the movies
                xhttp.open("GET", "http://localhost:8080/p7/webresources/pojos.pelicula/", false);
                xhttp.setRequestHeader("Accept", "application/xml");
                xhttp.send();
                //Get the raw XML
                var rawXML = xhttp.responseXML;
                //Get the table
                var table = $(this).find("#listado");
                
                //Find all the movies inside the XML
                var xmlRow = $(rawXML).find('pelicula');
                // We go through each movie
                $(xmlRow).each(function () {
                    //We insert a new row in the table
                    var row = $(table[0].insertRow(-1));
                    //We get the required element from the XML and put it inside 
                    var cell = $("<td/>").append(document.createTextNode($(this).find('id').text()));
                    row.append(cell);
                    var cell = $("<td/>").append(document.createTextNode($(this).find('nombre').text()));
                    row.append(cell);
                    var cell = $("<td/>").append(document.createTextNode($(this).find('fechaEstreno').text()));
                    row.append(cell);
                    var cell = $("<td/>").append(document.createTextNode($(this).find('fechaVideo').text()));
                    row.append(cell);
                    var cell = $("<td/>").append(document.createTextNode($(this).find('idioma').text()));
                    row.append(cell);
                    var cell = $("<td/>").append(document.createTextNode($(this).find('pais').text()));
                    row.append(cell);
                    
                });

               /* $("#form").submit(function ()
                {
                    var input = $("#form :input").val();

                    var xhttp = new XMLHttpRequest();
                    xhttp.open("DELETE", "http://localhost:8080/Experimento3/webresources/experimento3.libro/"+input, true);
                    xhttp.send();
                    $("h1").append(document.createTextNode("Se ha borrado el elemento correctamente"));

                });*/


            });

        </script>
    </head>
    <body>
        <h1>Grupo 03 - EPD09 - P6</h1>
        <br>
        <br>
        <h2>Listado de todas las pel&iacute;culas</h2>
        <br>
        <table id="listado" border="1">
            <tr>
                <th>Identificador</th>
                <th>Nombre</th>
                <th>Fecha de Estreno</th>
                <th>Fecha de lanzamiento en v&&iacute;deo</th>
                <th>Idioma</th>
                <th>Pa&iacute;s de origen</th>
            </tr>
        </table>
        <hr>
    </body>
</html>
