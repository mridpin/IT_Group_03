<%-- 
    Document   : hombre
    Created on : Feb 14, 2018, 5:38:50 PM
    Author     : group03
--%>

<ul>
    <li>Nombre: <%=session.getAttribute("name")%></li>
    <li>Apellidos: <%=session.getAttribute("lastname")%></li>
    <li>Sexo: <%=session.getAttribute("gender")%></li>
</ul>
<form method="get" action="logout.jsp">
    <input type="submit" name="submit" value="Logout" />
</form>

