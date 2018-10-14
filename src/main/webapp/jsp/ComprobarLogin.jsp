<%-- 
    Document   : ComprobarLogin
    Created on : 12-oct-2018, 12:24:29
    Author     : Carlos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    boolean res=false;
    String [] valor=request.getParameterValues("recordar");
    HttpSession sesion= request.getSession();
    
    if(valor!=null)
    {
        sesion.setAttribute(request.getParameter("usu"),request.getParameter("pass"));
        
        Cookie cookie= new Cookie("creada", request.getParameter("usu"));
        cookie.setMaxAge(60*60);
        response.addCookie(cookie);
        
        request.getRequestDispatcher("InformacionLog.jsp").forward(request, response);
    }
    
    if(request.getParameter("usu").isEmpty() || request.getParameter("pass").isEmpty())
    {
        res=true;
        response.sendRedirect("Login.jsp?error="+res);
    }
    else{
        
        if(sesion.getAttribute(request.getParameter("usu"))==null)
        {
            sesion.setAttribute(request.getParameter("usu"),request.getParameter("pass"));
            request.getRequestDispatcher("InformacionLog.jsp").forward(request, response);
        }
        else{
            //hay que buscar y comprobar que el usuario mete bien usuario y contraseña
            
            if(request.getParameter("pass").equals(sesion.getAttribute(request.getParameter("usu"))))
            {
                sesion.setAttribute(request.getParameter("usu"),request.getParameter("pass"));
                request.getRequestDispatcher("InformacionLog.jsp").forward(request, response);
            }
            else{
                res=true;
                response.sendRedirect("Login.jsp?error="+res);
            }
        }
    }
    %>
