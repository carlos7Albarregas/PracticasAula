<%-- 
    Document   : visitasCookies
    Created on : 05-oct-2018, 16:20:43
    Author     : Carlos

CADA VEZ QUE EL USUARIO SE META LA PAGINA ME DIGA CUANTAS VECES LO HA VISITADO.
======================= FORMATO DE SALIDA ===========================
Mensaje de cuantas veces visita la pagina
 INFORMACION DE LA COOKIE ( SI ES LA PRIMERA VEZ)
CADUCIDAD: hasta q se cierre el navegador (-1)
nombre cookie:
segura:
version:
SOLO APARECE LA INFORMACION LA PRIMERA VEZ, si vuelvo a entra desde el menu NO tiene que aparecer la informacion

botones: recargar (muestra el numero de veces SOLO), eliminar (la vuelve a crear de nuevo con el mismo nombre 
y mostrar informacion), menu inicial
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/visitasCookie.css" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro" rel="stylesheet">
        <title>Contador de visitas</title>
    </head>
    <body>
        <%  String cadena="";
        Cookie cookie=null;
        Cookie[] cookies=request.getCookies();
        
        if(cookies!=null) //significa que hay al menos una cookie 
        {
            for(int i=0;i<cookies.length;i++)
            {
                if(!cookies[i].getName().equals("JSESSIONID"))
                {
                    cookie=cookies[i];
                    break;
                }
                else{
                        
                    cadena="No ha creado ninguna cookie"; 
                }
            }
            
        }
        
            %>
            
        <div>
            
            <form action="visitasCookies.jsp" method="post">
                
                <%  if(cookie!=null && request.getParameter("Submit")!=null)
                {
                    if(request.getParameter("Submit").equals("Recargar"))
                    {
                        //hay que transformar a entero
                        int valor=Integer.parseInt(cookie.getValue());
                        valor=valor+1;
                        cookie.setValue(Integer.toString(valor));
                        response.addCookie(cookie);
                        %>
                                <h2>La cookie <%=cookie.getName()%> ha visitado la pagina <%=cookie.getValue()%> veces</h2>
                                <%
                    }
                    else {
                        cookie= new Cookie(cookie.getName(),"1");
                        response.addCookie(cookie);
                            %>
                                <h3>La cookie <%=cookie.getName()%> ha sido borrada y creada </h3>
                                <%
                        
                    }
                }
                    %>
                    
                <%  if(cookie != null)//si hay una cookie Y EL VALOR ES 1 muestra el mensaje
                {
                    
                    if(cookie.getValue().equals("") || cookie.getValue().equals("1"))
                    {
                        
                        cookie=new Cookie(cookie.getName(),"1");
                        cookie.setMaxAge(-1);
                        response.addCookie(cookie);
                        %>
                        <h2>La cookie <%=cookie.getName()%> ha visitado la pagina <%=cookie.getValue()%> veces</h2>
                        <h3>Informacion de la cookie</h3>
                        <p>CADUCIDAD: hasta que se cierre el navegador</p>
                        <p>Segura: <%=cookie.getSecure()%></p>
                        <p>Nombre cookie: <%=cookie.getName()%> </p>
                        <p>Version: <%=cookie.getVersion()%></p>
                    <%
                    }  
                        
                }
                    else{ //no hay cookie creada
                        %>
                            <h2><%=cadena%></h2>
                            <%
                    }
                    %>
                
                
                    <input type="submit" name="Submit" value="Recargar"/>
                    <input type="submit" name="Submit" value="Eliminar"/>
            </form>
        </div>
        <p><a href='../index.html'>Vuelta al menu inicial</a></p>
            
    </body>
</html>
