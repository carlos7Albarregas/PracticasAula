<%-- 
    Document   : Logout
    Created on : 12-oct-2018, 12:24:57
    Author     : Carlos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        HttpSession sesion= request.getSession();
        sesion.removeAttribute("sesion");
        sesion.invalidate();
        if(request.getParameter("error")!=null)
        {
            response.sendRedirect("Login.jsp?error="+false);
        }
        else{
            response.sendRedirect("Login.jsp");
        }
        
        %>
    </body>
</html>
