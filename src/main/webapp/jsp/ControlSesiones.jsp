<%-- 
    Document   : ControlSesiones
    Created on : 08-oct-2018, 17:32:24
    Author     : Carlos
LOS ATRIBUTOS NO SE PONEN POR PARAMETROS INICIAL (que se vea por url), SINO A TRAVES DE ATRIBUTOS DE SESIONES O DE PETICION.
con un checkbox de eliminar sesion

HttpSession sesion =request.getsession()
sesion.getAtributte ( si es distinto de nulo escribo el atributo, sino "")


IGUAL QUE LAS COOKIES
ControlSession
a la hora de hacer el getatribute hay que hacer el casting porque devuelve un Object 
y luego ponemos setAtributte (creando previamente el objeto httpSession)

--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String cadena=null;
    String url="MenuSesiones.jsp";
    HttpSession sesion= request.getSession();
    
    String nombre=request.getParameter("nombreSesion");
    String valor= request.getParameter("valorSesion");
    
    if(nombre.length()!=0) //entra aqui si ha escrito algo
    {
       
        if(sesion.getAttribute(nombre)==null) //no ha sido creada la sesion
        {
            if(request.getParameter("Submit").equals("Crear"))
            {
                sesion.setAttribute(nombre, valor);
                cadena="La sesion "+nombre+" ha sido creada con valor "+valor;
            }
            else if(request.getParameter("Submit").equals("Modificar"))
            {
                //NO SE PUEDE MODIFICAR SI NO ESTA CREADA LA SESION
                cadena="No existe aun la sesion y no se puede modificar";
            }
            else if(request.getParameter("Submit").equals("Consultar"))
            {
                //NO SE PUEDE CONSULTAR SI NO ESTA CREADA LA SESION
                cadena="No existe aun la sesion y no se puede consultar";
            }
            else if(request.getParameter("Submit").equals("Eliminar"))
            {
                //NO SE PUEDE ELIMINAR SI NO ESTA CREADA LA SESION
                cadena="No existe aun la sesion y no se puede eliminar";
            }
        }
        else{
            //ya ha sido creada
            if(request.getParameter("Submit").equals("Crear"))
            {
                //LA SESION NO SE PUEDE REPETIR
                cadena="La sesion "+nombre+" ya ha sido creada";
            }
            else if(request.getParameter("Submit").equals("Modificar"))
            {                
                sesion.setAttribute(nombre, valor);
                cadena="La sesion ha sido modificada";
                
            }
            else if(request.getParameter("Submit").equals("Consultar"))
            {
                
                cadena="La sesion "+nombre+" tiene un valor "+sesion.getAttribute(nombre);
            }
            else if(request.getParameter("Submit").equals("Eliminar"))
            {
               sesion.removeAttribute(nombre);
               sesion.invalidate();
               url="../index.html";
            }
        }
    }
    else{
        cadena="";
    }
    response.sendRedirect(url+"?mensaje="+cadena);
    %>
