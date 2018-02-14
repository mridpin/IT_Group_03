<%@page language="java" contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%! String browser;%>
       
       <%
           
       browser = request.getHeader("user-agent");
       
       if(browser.indexOf("Chrome")!=-1)
       {
         %>
         <jsp:forward page="chrome.jsp" />
         <%
       }
       else if(browser.indexOf("Safari")!=-1)
       {
         %>
         <jsp:forward page="safari.jsp" />
         <%
       }
       else if(browser.indexOf("Firefox")!=-1)
       {
         %>
         <jsp:forward page="firefox.jsp" />
         <%
       }
       else
       {
         %>
         <jsp:forward page="notSupported.jsp" />
         <%
       }


       %>
       
    </body>
</html>
