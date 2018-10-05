<%-- 
    Document   : ControlCookie
    Created on : 04-oct-2018, 21:26:40
    Author     : Carlos
--%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
        String cadena=null;
        Cookie cookie=null;
        Cookie[] cookies=request.getCookies();
        if(cookies!=null)//Significa que hay cookies
        {
            for(int i=0;i<cookies.length;i++)
            {
                if(cookies[i].getName().equals(request.getParameter("nombreCookie"))) //si es igual trabajo con esta cookie
                {
                    cookie=cookies[i];
                    break;
                }
            }
        }
        
        if(request.getParameter("Submit").equals("Crear"))
        {
            if(cookie!=null) //quiere decir que ya esta y no acepta duplicados
            {
                cadena="La cookie "+request.getParameter("nombreCookie")+" ya ha sido creada";
            }
            else{
                cookie= new Cookie(request.getParameter("nombreCookie"), request.getParameter("valorCookie"));
                cookie.setMaxAge(60*60); //duracion de la cookie
                response.addCookie(cookie);
                cadena="Se creo la cookie "+request.getParameter("nombreCookie")+ " con valor "+request.getParameter("valorCookie");
               
            }
        }
        else if(request.getParameter("Submit").equals("Modificar"))
        {
            
            if(cookie!=null)
            {
                cookie.setValue(request.getParameter("valorCookie"));
                cookie.setMaxAge(60*60);
                response.addCookie(cookie);
                cadena="Se modifico la cookie "+request.getParameter("nombreCookie")+" al valor de "+cookie.getValue();
                
            }
            else{
                cadena="La cookie "+request.getParameter("nombreCookie")+" no se puede modificar porque no existe";
            }
        }
        else if(request.getParameter("Submit").equals("Consultar"))
        {
            if(cookie!=null)
            {
                cadena="La cookie "+request.getParameter("nombreCookie")+" tiene un valor de "+cookie.getValue();
            }
            else{
                cadena="La cookie "+request.getParameter("nombreCookie")+" no existe!";
            }
        }
        else if(request.getParameter("Submit").equals("Eliminar"))
        {
            if(cookie!=null)
            {
                cookie.setMaxAge(0);
                response.addCookie(cookie);
                cadena="La cookie "+request.getParameter("nombreCookie")+" ha sido eliminada";
            }
            else{
                cadena="La cookie "+request.getParameter("nombreCookie")+" no se puede eliminar porque no existe!";
            }
        }
        
        response.sendRedirect("MenuCookie.jsp?mensaje="+cadena);
%>

