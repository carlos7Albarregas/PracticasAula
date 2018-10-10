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
            sesion.removeAttribute("mensaje");//elimino para evitar problemas con la cadena
            
            Enumeration<String> sesiones=sesion.getAttributeNames();
            while(sesiones.hasMoreElements())
            {
                nombre=sesiones.nextElement();
                valor = sesion.getAttribute(nombre);  
                salida="La sesion "+nombre+" ha visitado la pagina "+valor+" veces";
            }
            if(nombre.isEmpty())
            {
                salida="No hay ninguna sesion iniciada";
                
            }
            %>
        <form action="visitasSesion.jsp" method="post">
            
            <div>
                
                <%
                    
                    if(!nombre.isEmpty() && request.getParameter("Submit")!=null)
                    {
                        if(request.getParameter("Submit").equals("Recargar"))
                        {
                            
                            int cont=Integer.parseInt(valor.toString());
                            cont=cont+1;
                            valor=Integer.toString(cont);
                            salida="La sesion "+nombre+" ha visitado la pagina "+valor+" veces";
      
                            sesion.setAttribute(nombre, valor);
                        }
                        else{
                            sesion.removeAttribute(nombre);
                            sesion.invalidate();
                            salida="Sesion eliminada";
                            
                        }
                        
                    }
                    
                    %>
                    <h2><%=salida%></h2>
                <input type="submit" name="Submit" value="Recargar"/>
                <input type="submit" name="Submit" value="Eliminar"/>
                
            </div>
            
        </form>
        <p><a href='../index.html'>Vuelta al menu inicial</a></p>
    </body>
</html>
