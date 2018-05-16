<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.3.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script lang="text/javascript">

            //We wait for the document to be loaded
            $(document).ready(function ()
            {
                //we prepare a function when the button in the form is pressed
                $("form :button").click(function ()
                {
                    //We prepare the request
                    var $xhttp = new XMLHttpRequest();
                    $xhttp.open("POST", "http://localhost:8080/ej1/Ejercicio1", false);
                    
                    //We get the value entered
                    var $input = $("form :input").val();

                    var $request = '<?xml version="1.0" encoding="UTF-8"?>'
                            + '<S:Envelope xmlns:S="http://schemas.xmlsoap.org/soap/envelope/" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/">'
                            + '<SOAP-ENV:Header/><S:Body><ns2:generatePassword xmlns:ns2="http://WebServices/">'
                            + '<length>' + $input + '</length>'
                            + '</ns2:generatePassword></S:Body></S:Envelope>';

                    $xhttp.setRequestHeader('Content-Type', 'text/xml');
                    $xhttp.send($request);

                    //We print the received XML document
                    $("#xml").append(document.createTextNode("XML Devuelto:"+$xhttp.responseText));

                    var xmlDoc = $xhttp.responseXML;
                    
                    //We print the response
                    $("#response").append(document.createTextNode("El resultado es: "+xmlDoc.getElementsByTagName("return")[0].childNodes[0].nodeValue));


                });


            });

        </script>
    </head>
    <body>
        <h1>Introduzca la longitud de la contrase&ntilde;a a generar:</h1>
        <br>
        <form>
            Longitud de la contrase&ntilde;a: <input type="text" name="length"/>
            <br>
            <input type="button" name="submit" value="Calcular contrase&ntilde;a"/>
        </form>

        <p id='xml'></p>
        <br>
        <p id="response"></p>

    </body>
</html>
