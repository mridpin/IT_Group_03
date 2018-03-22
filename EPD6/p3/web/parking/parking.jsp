<%-- 
    Document   : parking
    Created on : Mar 7, 2018, 7:15:46 PM
    Author     : ridao
--%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Parking</title>
        <s:head />
    </head>
    <body>
        <h1><strong>IT - EPD05 - P3 - Grupo03</strong></h1>
        <article>
            <h2>APARCAMIENTOS</h2>
            <section>
                <!-- Conditions in struct
                https://www.mkyong.com/struts2/struts-2-if-elseif-else-tag-example/-->
                <s:i18n name="myBundle">
                    <s:set name="isEdit" value="isEdit"/>
                    <s:if test="%{#isEdit=='isEdit'}">                    
                        <h3><s:text name="edit"></s:text></h3>
                        <s:form namespace="/parking" action="editParking" validate="true">
                            <s:textfield key="matricula.required"></s:textfield>            
                            <s:textfield key="matricula" disabled="disabled" value="%{parkingFormatted.matricula}"></s:textfield>                                
                            <s:textfield key="modelo" value="%{parkingFormatted.modelo}"></s:textfield>                                
                            <s:textfield key="entrada" value="%{parkingFormatted.entrada}"></s:textfield>                                
                            <s:textfield key="salida" value="%{parkingFormatted.salida}"></s:textfield>                                
                            <s:textfield key="tiempoPermitido" value="%{parkingFormatted.tiempoPermitido}"></s:textfield>                                
                            <s:submit key="save"></s:submit>
                        </s:form>
                    </s:if>
                    <s:else>
                        <h3><s:text name="create"></s:text></h3>
                        <s:form namespace="/parking" action="createParking" validate="true">
                            <s:textfield key="matricula"></s:textfield>                            
                            <s:textfield key="modelo"></s:textfield>                                
                            <s:textfield key="entrada"></s:textfield>                                
                            <s:textfield key="salida"></s:textfield>                                
                            <s:textfield key="tiempoPermitido"></s:textfield>
                            <s:submit key="save"></s:submit>
                        </s:form>
                    </s:else>            
                    <p><s:text name="warning"></s:text><p>
                    </s:i18n>
            </section>
        </article>

    </body>
</html>
