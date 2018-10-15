<%-- 
    Document   : ComprobarLogin
    Created on : 12-oct-2018, 12:24:29
    Author     : Carlos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    boolean res=false;
    HttpSession sesion= request.getSession();
    String [] valores=new String[2];
    valores[0]=request.getParameter("usu");
    valores[1]=request.getParameter("pass");
    
    if(request.getParameter("recordar")!=null)
    {
        if(sesion.getAttribute("sesion")!=null) //significa que hay ya una sesion abierta
        {
            String [] comprobar= (String[])sesion.getAttribute("sesion"); //obtenemos valores de la sesion
                
                if(request.getParameter("usu").equals(comprobar[0]) && request.getParameter("pass").equals(comprobar[1]))
                {
                    sesion.setAttribute("sesion", valores);
                    response.sendRedirect("InformacionLog.jsp");
                }
                else{
                    res=true;
                    response.sendRedirect("Login.jsp?error="+res);
                }
        }
        else{ //NO HAY SESION
            sesion.setAttribute("sesion",valores);

            Cookie cookie= new Cookie("creada", request.getParameter("usu"));
            cookie.setMaxAge(60*60);
            response.addCookie(cookie);

            response.sendRedirect("InformacionLog.jsp");
        }
    }
    else //si NO ha marcado el checkbox
    {
        
        if(request.getParameter("usu").isEmpty() || request.getParameter("pass").isEmpty())
        {//si esta vacio algun campo vuelta al index
            res=true;
            response.sendRedirect("Login.jsp?error="+res);
        }
        else
        {
        
            if(sesion.getAttribute("sesion")==null)//me creo la sesion si no hay ninguna
            {
                sesion.setAttribute("sesion", valores);
                response.sendRedirect("InformacionLog.jsp");
            }
            else{
            //hay que buscar y comprobar que el usuario mete bien usuario y contraseña
                String [] comprobar= (String[])sesion.getAttribute("sesion"); //obtenemos valores de la sesion
                
                if(request.getParameter("usu").equals(comprobar[0]) && request.getParameter("pass").equals(comprobar[1]))
                {
                    sesion.setAttribute("sesion", valores);
                    response.sendRedirect("InformacionLog.jsp");
                }
                else{
                    res=true;
                    response.sendRedirect("Login.jsp?error="+res);
                }
            }
        }
    }
    
    %>
