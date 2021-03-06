<%@page language="java" contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EPD03 - P2 Grupo 3</title>
        <style>
            .form_inline {
                display: inline;
            }
        </style>
    </head>
    <body>
        <h1><strong>IT - EPD05 - P3 - Grupo03</strong></h1>
        <article>
        <section>
            <h2>APARCAMIENTOS</h2>
            <table border="1">        
                <tr>                
                    <th><s:text name="matricula"></s:text></th>
                    <th><s:text name="modelo"></s:text></th>
                    <th><s:text name="entrada"></s:text></th>
                    <th><s:text name="salida"></s:text></th>
                    <th><s:text name="tiempoPermitido"></s:text></th>
                                    
                    <th>
                        <s:form namespace="/parking" action="forwardToParkingCreate">
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
                            <s:form namespace="/parking" action="forwardToParkingEdit">
                                <s:hidden name="edit" value="edit" />
                                <s:hidden name="index" value="%{#parking.matricula}" />
                                <s:submit type="image" src="index/imgs/edit.png" width="40px" value="submit"></s:submit>
                            </s:form>
                        </td>
                        <td>
                            <s:form namespace="/parking" action="deleteParking">
                                <s:hidden name="delete" value="delete" />
                                <s:hidden name="index" value="%{#parking.matricula}" />
                                <s:submit type="image" src="index/imgs/cancel.png" width="40px" value="submit"></s:submit>
                            </s:form>
                        </td>
                    </tr>
                </s:iterator>
            </table>
            <br />
        </section>
        <section>
            <h3>
                Filtros
            </h3>
            <s:form namespace="/filter" action="showOverdue" cssClass="form_inline">
                <s:submit value="Mostrar Excedidos"></s:submit>
            </s:form>
            <s:form namespace="/filter" action="showNotOverdue" cssClass="form_inline">
                <s:submit value="Mostrar No Excedidos"></s:submit>
            </s:form>
            <s:form namespace="/" action="" cssClass="form_inline">
                <s:submit value="Mostrar Todos"></s:submit>
            </s:form>
        </section>
        <section>
            <h3>B&uacute;squedas</h3>
            <s:form namespace="/search" action="searchByPlate" >
                <s:textfield type="text" label="Por matrÝcula" name="matricula"></s:textfield>
                <s:submit value="Buscar" ></s:submit>
            </s:form>
            <s:form namespace="/search" action="showParked" >                
                <s:submit value="Mostrar vehÝculos aparcados" ></s:submit>
            </s:form>
        </section>
    </article>
</body>
</html>
