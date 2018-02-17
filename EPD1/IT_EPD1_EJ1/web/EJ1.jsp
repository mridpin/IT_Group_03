

<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%! String smes, saludo;
            int hora, dia, mes, anyo;
            Calendar c;
        %>
    </head>
    <body>
        <%
            c = Calendar.getInstance();
            hora = c.get(Calendar.HOUR_OF_DAY);
            dia = c.get(Calendar.DAY_OF_MONTH);
            mes = c.get(Calendar.MONTH);
            anyo = c.get(Calendar.YEAR);
            saludo = "Buenas noches";
            if (hora>=5 && hora <=11)
                saludo = "Buenos d&iacute;as";
            else if (hora>11 && hora <21)
                saludo = "Buenas tardes";
            switch (mes){
                case 1: smes="Enero";break;
                case 2: smes="Febrero";break;
                case 3: smes="Marzo";break;
                case 4: smes="Abril";break;
                case 5: smes="Mayo";break;
                case 6: smes="Junio";break;
                case 7: smes="Julio";break;
                case 8: smes="Agosto";break;
                case 9: smes="Septiembre";break;
                case 10: smes="Octubre";break;
                case 11: smes="Noviembre";break;
                case 12: smes="Diciembre";break;
            }
            %>
            <p><%=saludo %>, hoy es: <%=dia%> de <%=smes%> de <%=anyo%> </p>
    </body>
</html>
