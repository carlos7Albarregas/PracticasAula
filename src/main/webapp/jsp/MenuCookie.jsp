<%-- 
    Document   : MenuCookie
    Created on : 04-oct-2018, 21:26:27
    Author     : Carlos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/estilosCookie.css" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
        <title>Menu Cookie</title>
    </head>
    <body>
        <div>
        <form action="ControlCookie.jsp" method="post">
            <label for="nombre">Nombre de la cookie</label>
            <input id='nombre' name='nombreCookie' type="text"/>
            <br/>
            <label for="valor">Valor de la cookie</label>
            <input id='valor' name='valorCookie' type="text"/>
            <br/>
            
            <input type="submit" name="Submit" value="Crear"/>
            <input type="submit" name="Submit" value="Modificar"/>
            <input type="submit" name="Submit" value="Consultar"/>
            <input type="submit" name="Submit" value="Eliminar"/>
            <br/>
            <%
                String cad=null;
                
                if(request.getParameter("mensaje")!=null){
                    
                    cad=(request.getParameter("mensaje"));
                }
                else{
                    cad="";
                }
               
                %>
                <h2><%=cad%></h2>
        </form>
        </div>
        <p><a href='../index.html'>Vuelta al menu inicial</a></p>
    </body>
</html>
