<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%! private static final String DEFAULT_NAME = "World"; %>
<!DOCTYPE html>
<html>
    <head>
        <title>
            Hello JavaServer Page
        </title>
    </head>
<%-- Determine the specified name (or use default) --%>
    <%
        String name = request.getParameter("name");
        if ((name == null) || (name.length() == 0)){
            name = DEFAULT_NAME;
        }
    %>
    <body bgcolor ="white">
        <h1> 
            <b style="color:blue;">
                Hello, <%= name %>
            </b>
        </h1>
    </body>
</html>
