<%-- 
    Document   : login
    Created on : Apr 15, 2018, 5:12:05 PM
    Author     : ridao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
    public Cookie findCookie(String name, Cookie[] cookies) {
        for (Cookie c : cookies) {
            if (c.getName().equals(name)) {
                return c;
            }
        }
        return null;
    }
%>
<%
    Cookie cookie = findCookie("user", request.getCookies());
    if (request.getParameter("submit") != null) {
        try {
            webservices.SingleSignOn_Service service = new webservices.SingleSignOn_Service();
            webservices.SingleSignOn port = service.getSingleSignOnPort();
            // TODO initialize WS operation arguments here
            java.lang.String token = cookie.getValue();
            port.logout(token);
            cookie.setMaxAge(0);
            response.addCookie(cookie);
            response.sendRedirect("index.jsp");
        } catch (Exception ex) {
            // TODO handle custom exceptions here
        }
    }
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IT GROUP 07 - EPD07 P7</title>
    </head>
    <body>
        <h1>IT GROUP 07 - EPD07 P7</h1>
        <article>
            <h2>LOGIN</h2>
            <h3>Bienvenido, su token es: <%=cookie.getValue()%></h3>
            <form method="post" action="login.jsp">
                <input type="submit" name="submit" value="logout">
            </form> 
        </article>
    </body>
</html>
