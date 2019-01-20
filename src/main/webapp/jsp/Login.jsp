<%-- 
    Document   : Login
    Created on : 12-oct-2018, 12:24:08
    Author     : Carlos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/estilosCookSesion.css" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">
        <title>Cookies y Sesiones</title>
    </head>
    <body>
        
        <div id='contenedor'>
        <form action="ComprobarLogin.jsp" method="post">
            
            <br/>
            <%
                Cookie cookie=null;
                
                if(request.getParameter("error")!=null)
                {
                    if(request.getParameter("error").equals("false"))
                    {
                        Cookie[] cookies=request.getCookies();
                        for(int i=0;i<cookies.length;i++)
                        {
                            if(cookies[i].getName().equals("creada"))
                            {
                                cookie=cookies[i];
                                break;
                            }
                        }
                        if(cookie==null)
                        {
                            
                            %>
                            <input type="checkbox" name="recordar" value="ON" />Recordar usuario
                            <br/>
                            <label for="usuario">Usuario</label>
                            <input type="text" id="usuario" name="usu"/>
                            <br/>
                            <%
                        }
                        else
                        {
                            %>
                            <input type="checkbox" name="recordar" value="ON" />Recordar usuario
                            <br/>
                            <label for="usuario">Usuario</label>
                            <input type="text" id="usuario" name="usu" value= "<%=cookie.getValue() %>"/>
                            <br/>
                            <%
                        }
                        
                    }
                    else if(request.getParameter("error").equals("true"))
                    {
                        %>
                        <h2>Uno de los campos estaba incompletos/erroneos</h2>
                        <input type="checkbox" name="recordar" value="ON" />Recordar usuario
                        <br/>
                        <label for="usuario">Usuario</label>
                        <input type="text" id="usuario" name="usu"/>
                        <br/>
                        <%
                    }
                    
                }
                else
                {
                    %>
                    <input type="checkbox" name="recordar" value="ON" />Recordar usuario
                    <br/>
                    <label for="usuario">Usuario</label>
                    <input type="text" id="usuario" name="usu"/>
                    <br/>
                    <%
                }
                %>
            
            <label for="contra">Contraseña</label>
            <input type="password" id="contra" name="pass"/>
            
            <input type="submit" value="Enviar"/>
        </form>
                
        </div>
                <p><a href='../index.html'>Vuelta al menu inicial</a></p>
    </body>
</html>
