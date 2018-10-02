<%-- 
    Document   : JSPSaludos
    Created on : 01-oct-2018, 17:01:47
    Author     : Carlos
--%>

<%@page import="java.time.LocalTime"%>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Saludos</title>
    </head>
    <body>
        <%
            String tratamiento=null; //seria local a services
            if(request.getParameter("est").equals("Hombre"))
            {
                tratamiento=" señor";
            }
            else{
                tratamiento=" señora ";
            }
            
            int hora= LocalTime.now().getHour();
            
            String saludo=null;
             
            if(hora>= 8 && hora< 13)
            {
                saludo="os dias";
            }else if(hora>=13 && hora<19)
            {
                saludo="as tardes";
            }
            else{
                saludo="as noches";
            }
            
        %>
        <div>
            <h2>Buen<%=saludo %> <%=tratamiento %> <%= request.getParameter("usuario")%> </h2>
        </div>
        <p><a href='../index.html'>Vuelta al menu inicial</a></p>
    </body>
</html>
