<%-- 
    Document   : visitasSesion
    Created on : 10-oct-2018, 0:29:34
    Author     : Carlos
--%>

<%@page import="java.util.Enumeration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Visitas sesion</title>
    </head>
    <body>
        <%
            String nombre="";
            Object valor=new Object();
            String salida="";
            
            HttpSession sesion= request.getSession();
            Enumeration<String> sesiones=sesion.getAttributeNames();
            while(sesiones.hasMoreElements())
            {
                nombre=sesiones.nextElement();
                
                if(!nombre.equals("mensaje")) //porque tengo una sesion por defecto que es mensaje
                {
                    valor = sesion.getAttribute(nombre);
                    salida="La sesion "+nombre+" ha visitado la pagina "+valor+" veces";
                }
                
            }
            if(nombre.isEmpty())
            {
                salida="No hay ninguna sesion iniciada";
                
            }
            %>
        <form action="visitasSesion.jsp" method="post">
            
            <div>
                <h2><%=salida%></h2>
                <%
                    
                    if(!nombre.isEmpty() && request.getParameter("Submit")!=null)
                    {
                        if(request.getParameter("Submit").equals("Recargar"))
                        {
                            
                            int cont=Integer.valueOf((String)valor);
                            cont=cont+1;
                            
                            sesion.setAttribute(nombre, cont);
                        }
                        else{
                            sesion.removeAttribute(nombre);
                            sesion.invalidate();
                            salida="Sesion eliminada";
                            
                        }
                        
                    }
                    
                    %>
                <input type="submit" name="Submit" value="Recargar"/>
                <input type="submit" name="Submit" value="Eliminar"/>
                
            </div>
            
        </form>
        <p><a href='../index.html'>Vuelta al menu inicial</a></p>
    </body>
</html>
