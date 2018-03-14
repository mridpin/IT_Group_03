<%@page language="java" contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EPD03 - P2 Grupo 3</title>
    </head>
    <body>
        <h1><strong>IT - EPD05 - P3 - Grupo03</strong></h1>
        <h2>APARCAMIENTOS</h2>
        <table border="1">        
            <tr>                
                <th>Matr&iacute;cula</th>
                <th>Modelo</th>
                <th>Hora de entrada</th>
                <th>Hora de salida</th>
                <th>Tiempo permitido</th>                
                <th>
                    <s:form action="createParking" theme="simple">
                        <s:hidden name="create" value="create" />
                        <s:submit type="image" src="index/imgs/add.png" width="40px" value="submit"></s:submit>
                    </s:form>
                </th>                
            </tr>

            <!-- How to iterate:
            https://www.mkyong.com/struts2/struts-2-iterator-tag-example/
            https://stackoverflow.com/questions/2754939/how-do-you-iterate-through-a-list-of-objects 
            -->            
            <s:iterator value="parkings" var="parking">
                <tr>
                    <td>
                        <s:property value="#parking.matricula" />
                    </td>
                    <td>
                        <s:property value="#parking.modelo" />
                    </td>
                    <td>
                        <s:property value="#parking.entrada" />
                    </td>
                    <td>
                        <s:property value="#parking.salida" />
                    </td>
                    <td>
                        <s:property value="#parking.tiempoPermitido" />
                    </td>
                    <!-- Sending iterator variables in the form: 
                    https://stackoverflow.com/questions/13020727/how-to-submit-specific-iterator-entry-to-action-in-struts-2 
                    -->
                    <td>
                        <s:form action="editParking" theme="simple">
                            <s:hidden name="edit" value="edit" />
                            <s:hidden name="index" value="%{#parking.matricula}" />
                            <s:submit type="image" src="index/imgs/edit.png" width="40px" value="submit"></s:submit>
                        </s:form>
                    </td>
                    <td>
                        <s:form action="deleteParking" theme="simple">
                            <s:hidden name="delete" value="delete" />
                            <s:hidden name="index" value="%{#parking.matricula}" />
                            <s:submit type="image" src="index/imgs/cancel.png" width="40px" value="submit"></s:submit>
                        </s:form>
                    </td>
                </tr>
            </s:iterator>
        </table>
        <!--
       <td>
           <form action="ParkingCRUDServlet" method="get" style="display:inline;">
               <input type="hidden" name="editar" value="editar">
               <input type="hidden" name="indice" value="">
               <button type="submit" name="submit" value="editar"><img src="imgs/edit.png" alt="edit" width="20px"></button>
           </form>
           <form action="ParkingCRUDServlet" method="get" style="display:inline;">
               <input type="hidden" name="borrar" value="borrar">
               <input type="hidden" name="indice" value="">
               <button type="submit" name="submit" value="borrar"><img src="imgs/cancel.png" alt="delete" width="20px"></button>
           </form>
       </td>
   </tr>

</table>
<br />
<form action="ServletP4" method="get">
   <input type="hidden" name="Accion2" value="agrupaciones">
   <input type="submit" name="submit" value="Ver Agrupaciones">
</form>
<br />

<h3>B&uacute;squedas</h3>        
<form action="ServletP4" method="get">
   <label>Buscar si la matr&iacute;cula comienza por: </label><input type="text" name="busqueda">
   <input type="hidden" name="Accion1" value="index">
   <input type="submit" name="submit_busqueda_matricula" value="Buscar">
</form>
<form action="ServletP4" method="get">
   <label>Buscar veh&iacute;culos todav&iacute;a en el aparcamiento: </label>
   <input type="hidden" name="Accion1" value="index">
   <input type="submit" name="submit_busqueda_todavia_aparcamiento" value="Buscar">
</form>
<br />
<h3>Ver todos</h3>
<form action="ServletP4" method="get">
   <input type="hidden" name="Accion3" value="index">
   <input type="submit" name="ver_todos" value="Ver todos">
</form> -->
    </body>
</html>
