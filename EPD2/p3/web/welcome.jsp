<%-- 
    Document   : hombre
    Created on : Feb 14, 2018, 5:38:50 PM
    Author     : group03
--%>

<ul>
    <li>Nombre: <%=request.getCookies()[1]%></li>
    <li>Apellidos: <%=request.getCookies()[2]%></li>
    <li>Sexo: <%=request.getCookies()[3]%></li>
</ul>
<form method="get" action="logout.jsp">
    <input type="submit" name="submit" value="Logout" />
</form>

