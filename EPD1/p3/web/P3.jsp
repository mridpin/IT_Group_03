<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EPD1 Problema1</title>
        <%!
            float b1, b2, b3, proyecto, epd, noSupera;
            String nombre, ape, email, direc;
            double notatotal;
        %>
    </head>

    <body>
        <%
             b1 = Float.parseFloat(request.getParameter("b1"));
             b2 = Float.parseFloat(request.getParameter("b2"));
             b3 = Float.parseFloat(request.getParameter("b3"));
             proyecto = Float.parseFloat(request.getParameter("proyecto"));
             epd = Float.parseFloat(request.getParameter("epd"));
             nombre = request.getParameter("nombre");
             ape = request.getParameter("apellidos");
             email = request.getParameter("email");
             direc = request.getParameter("direccion");

        

             noSupera = (b1 + b2 + b3) / 3;

            if (noSupera <= 5) {
                proyecto = 0;
                epd = 0;
            }

            notatotal = (b1 * 0.311) + (b2 * 0.155) + (b3 * 0.233) + (proyecto * 0.2) + (epd * 0.1);

            if (notatotal >= 5) {
               out.print("Estimado " + nombre + " " + ape + "con direccion "+direc+ "enhorabuena usted ha aprobado la asignatura con un nota de  "+notatotal);
            }else{
                out.print("Estimado " + nombre + " " + ape + "con direccion "+direc+ "lo sentimos usted no ha aprobado la asignatura con un nota de  "+notatotal);
            }

            

        %>


    </body>
</html>
