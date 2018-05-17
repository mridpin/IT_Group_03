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

                //Function that loads all the entries of the database into a table
                function showAllMovies()
                {
                    
                    var xhttp = new XMLHttpRequest();
                    //Get all the movies
                    xhttp.open("GET", "http://localhost:8080/p7/webresources/pojos.pelicula/", false);
                    xhttp.setRequestHeader("Accept", "application/xml");
                    xhttp.send();
                    //Get the raw XML
                    var rawXML = xhttp.responseXML;

                    //Get the table
                    var table = $(document).find("#listado");

                    //We clear the previous table except the header
                    table.find("tr:gt(0)").remove();

                    //Find all the movies inside the XML
                    var xmlRow = $(rawXML).find('pelicula');
                    // We go through each movie
                    $(xmlRow).each(function () {
                        //We insert a new row in the table
                        var row = $(table[0].insertRow(-1));
                        //We get the required element from the XML and put it inside the table
                        var cell = $("<td/>").append(document.createTextNode($(this).find('id').text()));
                        row.append(cell);
                        var cell = $("<td/>").append(document.createTextNode($(this).find('nombre').text()));
                        row.append(cell);
                        var cell = $("<td/>").append(document.createTextNode($(this).find('fechaEstreno').text().substring(0, 10)));
                        row.append(cell);
                        var cell = $("<td/>").append(document.createTextNode($(this).find('fechaVideo').text().substring(0, 10)));
                        row.append(cell);
                        var cell = $("<td/>").append(document.createTextNode($(this).find('idioma').text()));
                        row.append(cell);
                        var cell = $("<td/>").append(document.createTextNode($(this).find('pais').text()));
                        row.append(cell);

                    });
                }

                //Function that adds or edits a movie
                function addMovie()
                {
                    var xhttp = new XMLHttpRequest();
                    //We get all the inputs from the form
                    var inputs = $("#add :input");
                    //Array that will hold all of the values
                    var values = {};
                    //We move the values from inputs to values with the specified name in the form
                    inputs.each(function () {
                        values[this.name] = $(this).val();
                    });


                    //We prepare the string to send to the WS
                    var xmlfEstreno = "<fechaEstreno>" + values["fEstreno"] + "</fechaEstreno>";
                    var xmlId = "<id>" + values["id"] + "</id>";
                    var xmlfVideo = "<fechaVideo>" + values["fVideo"] + "</fechaVideo>";
                    var xmlIdioma = "<idioma>" + values["idioma"] + "</idioma>";
                    var xmlNombre = "<nombre>" + values["nombre"] + "</nombre>";
                    var xmlPais = "<pais>" + values["pais"] + "</pais>";

                    var xmlLibro = "<pelicula>" + xmlfEstreno + xmlfVideo + xmlId + xmlIdioma + xmlNombre + xmlPais + "</pelicula>";

                    xhttp.open("PUT", "http://localhost:8080/p7/webresources/pojos.pelicula/" + values["id"], true);
                    xhttp.setRequestHeader("Content-Type", "application/xml");
                    xhttp.send(xmlLibro);
                    alert("Se ha agregado el nuevo registro correctamente, para ver los cambios pulse 'Mostrar'");
                }

                //Function that deletes a movie
                function deleteMovie()
                {
                    
                    var xhttp = new XMLHttpRequest();
                    //We get all the inputs from the form
                    var inputs = $("#delete :input");
                    //Array that will hold all of the values
                    var values = {};
                    //We move the values from inputs to values with the specified name in the form
                    inputs.each(function () {
                        values[this.name] = $(this).val();
                    });

                    //We first check if the movie we want to delete exists
                    xhttp.open("GET", "http://localhost:8080/p7/webresources/pojos.pelicula/" + values["id"], true);
                    xhttp.setRequestHeader("Accept", "application/json");

                    xhttp.onreadystatechange = function () {
                        //We make sure it finished
                        if (xhttp.readyState == 4)
                        {
                            //If it doesnt exists
                            if (xhttp.status == 204)
                            {
                                //To be shown after redirect
                                $.post("index.jsp", function () {
                                    alert("No se puede eliminar ese registro ya que no existe");
                                });
                            }
                            //If it does exist
                            else if (xhttp.status == 200)
                            {
                                xhttp = new XMLHttpRequest();
                                xhttp.open("DELETE","http://localhost:8080/p7/webresources/pojos.pelicula/" + values["id"], true);
                                xhttp.send();
                                //To be shown after redirect
                                 $.post("index.jsp", function () {
                                    alert("Se ha eliminado la pelicula correctamente, para ver los cambios pulse 'Mostrar'");
                                });
                            }
                        }
                    };
                    xhttp.send();
           
                }
                
                //Function that loads a movie to edit to a form
                function editMovie()
                {
                    var inputs = $("#edit :input");
                    //Array that will hold all of the values
                    var values = {};
                    //We move the values from inputs to values with the specified name in the form
                    inputs.each(function () {
                        values[this.name] = $(this).val();
                    });
                    
                    var xhttp = new XMLHttpRequest();
                    //Get the selected movie
                    xhttp.open("GET", "http://localhost:8080/p7/webresources/pojos.pelicula/"+values["id"], false);
                    xhttp.setRequestHeader("Accept", "application/xml");
                    xhttp.send();
                    //Get the raw XML
                    var rawXML = xhttp.responseXML;
                    
                    //Find get the movie from the Raw XML
                    var xmlRow = $(rawXML).find('pelicula');
                    
                    //We put the values of the entry in the form
                    $("#add .id").val(xmlRow.find("id").text());
                    $("#add .nombre").val(xmlRow.find("nombre").text());
                    $("#add .fEstreno").val(xmlRow.find("fechaEstreno").text().substring(0,10));
                    $("#add .fVideo").val(xmlRow.find("fechaVideo").text().substring(0,10));
                    $("#add .idioma").val(xmlRow.find("idioma").text());
                    $("#add .pais").val(xmlRow.find("pais").text());
                    
                }


                //Show all the movies

                $("#get :button").click(function ()
                {
                    showAllMovies();
                });

                //Add a new movie
                $("#add :button").click(function () {
                    addMovie();
                });
                //Delete a movie
                $("#delete :button").click(function () {
                    deleteMovie();
                });
                
                //Edit a movie
                $("#edit :button").click(function () {
                    editMovie();
                });
                

            });

        </script>
    </head>
    <body>
        <h1>Grupo 03 - EPD09 - P6</h1>
        <br>
        <h2>Listado de todas las pel&iacute;culas</h2>
        <br>
        <table id="listado" border="1">
            <tr>
                <th>Identificador</th>
                <th>Nombre</th>
                <th>Fecha de Estreno</th>
                <th>Fecha de lanzamiento en v&iacute;deo</th>
                <th>Idioma</th>
                <th>Pa&iacute;s de origen</th>
            </tr>
        </table>
        <br>
        <form id="get">
            <input type="button" value="Mostrar"/>
        </form>
        <hr>
        <h2>Introduce los datos de la pel&iacute;cula a a&ntilde;adir/modificar</h2>
        <br/>
        <form id="add">
            ID: <input type="text" name="id" class="id"/>
            <br/>
            Nombre: <input type="text" name="nombre" class="nombre"/>
            <br/>
            Fecha de estreno: <input type="text" name="fEstreno" class="fEstreno"/>
            <br/>
            Fecha de lanzamiento en v&iacute;deo: <input type="text" name="fVideo" class="fVideo"/>
            <br/>
            Idioma: <input type="text" name="idioma" class="idioma"/>
            <br/>
            Pa&iacute;s de origen: <input type="text" name="pais" class="pais"/>
            <br/>
            <input type="button" name="submit" value="Aceptar"/>
        </form>
        <hr>
        <h2>Introduzca el identificador de la pel&iacute;cula a eliminar</h2>
        <br/>
        <form id="delete">
            ID: <input type="text" name="id"/>
            <br/>
            <input type="button" name="submit" value="Eliminar"/>
        </form>
         <hr>
        <h2>Introduzca el identificador de la pel&iacute;cula a modificar</h2>
        <br/>
        <form id="edit">
            ID: <input type="text" name="id"/>
            <br/>
            <input type="button" name="submit" value="Cargar"/>
        </form>
    </body>
</html>
