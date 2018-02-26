<%-- 
    Document   : hombre
    Created on : Feb 14, 2018, 5:38:50 PM
    Author     : group03
--%>

<%!
    public String getCookieValue(Cookie[] cookies, String name) {
        String res = "";
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals(name)) {
                res = cookie.getValue();
            }
        }
        return res;
    }
%>
<ul>
    <li>Nombre: <%=getCookieValue(request.getCookies(), "name")%></li>
    <li>Apellidos: <%=getCookieValue(request.getCookies(), "lastname")%></li>
    <li>Sexo: <%=getCookieValue(request.getCookies(), "sex")%></li>
</ul>
<form method="get" action="logout.jsp">
    <input type="submit" name="submit" value="Logout" />
</form>

