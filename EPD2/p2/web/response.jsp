
<%@page language="java" contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
 <%! String option,website;%>  
 <% 
 
    option = request.getParameter("option");
    
    switch(option)
    {
        case "request":
        {
            website= "https://docs.oracle.com/javaee/5/api/javax/servlet/http/HttpServletRequest.html";
            break;
        }
        case "out":
        {
            website= "https://docs.oracle.com/javaee/5/api/javax/servlet/jsp/JspWriter.html";
            break;
        }
        case "response":
        {
            website= "https://docs.oracle.com/javaee/5/api/javax/servlet/http/HttpServletResponse.html";
            break;
        }
        case "config":
        {
            website= "https://docs.oracle.com/javaee/5/api/javax/servlet/ServletConfig.html";
            break;
        }
        case "application":
        {
            website= "https://docs.oracle.com/javaee/5/api/javax/servlet/ServletContext.html";
            break;
        }
        case "session":
        {
            website= "https://docs.oracle.com/javaee/5/api/javax/servlet/http/HttpSession.html";
            break;
        }
    }
    
    response.sendRedirect(website);
 
 
 %>
    </body>
</html>
