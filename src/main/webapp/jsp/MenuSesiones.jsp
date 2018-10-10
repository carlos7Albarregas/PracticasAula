<%-- 
    Document   : MenuSesiones
    Created on : 08-oct-2018, 17:30:40
    Author     : Carlos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/estilosSesion.css" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
        <title>Menu Sesiones</title>
    </head>
    <body>
        
        <div>
            <%
                
                HttpSession sesion= request.getSession();
                
                if(sesion.getAttribute("mensaje")!=null){
                    
                    %>
                    <h2><%=sesion.getAttribute("mensaje")%></h2>
                    <%
                    
                }
                else{
                    %><h2> </h2>
                    <%
                }
               
                %>
            <form action="ControlSesiones.jsp" method="post">
                
            <label for="nombre">Nombre de la sesion</label>
            <input id='nombre' name='nombreSesion' type="text"/>
            <br/>
            <label for="valor">Valor de la sesion</label>
            <input id='valor' name='valorSesion' type="text"/>
            <br/>
            
            <input type="submit" name="Submit" value="Crear"/>
            <input type="submit" name="Submit" value="Modificar"/>
            <input type="submit" name="Submit" value="Consultar"/>
            <input type="submit" name="Submit" value="Eliminar"/>
            <br/>
            
                
        </form>
        </div>
        <p><a href='../index.html'>Vuelta al menu inicial</a></p>
    </body>
</html>
