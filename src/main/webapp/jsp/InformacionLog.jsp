<%-- 
    Document   : InformacionLog
    Created on : 12-oct-2018, 12:24:44
    Author     : Carlos
--%>

<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/estilosCookSesion.css" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">
        <title>Informacion usuario</title>
    </head>
    <body>
        <div id="info">
            <h2>Bienvenido al menu de administracion</h2>
            <br/>
            <%
                HttpSession sesion= request.getSession();
                String cadena;
                boolean res=true;
                Cookie cookie=null;
                Cookie[] cookies=request.getCookies();
                for(int i=0;i<cookies.length;i++)
                {
                    if(cookies[i].getName().equals("creada"))
                    {
                        cookie=cookies[i];
                        break;
                    }
                }
                
                if(cookie!=null)
                {
                    //muestra creacion de la cookie
                    res=false;
                    %>
                    <p>Nombre de usuario: <%=request.getParameter("usu") %></p>
                    <p>Caducidad de la cookie: <%=cookie.getMaxAge() %></p>
                    <a href="Logout.jsp?error='res'">Cerrar Sesion</a>
                    <%
                }
                else{
                    Date acceso=new Date(sesion.getLastAccessedTime());
                    GregorianCalendar fecha=new GregorianCalendar();
                    fecha.setTime(acceso);
                    cadena=fecha.get(Calendar.DAY_OF_MONTH)+"/"+(fecha.get(Calendar.MONTH)+1)+"/"+fecha.get(Calendar.YEAR)
                    +" a las "+fecha.get(Calendar.HOUR_OF_DAY)+":"+fecha.get(Calendar.MINUTE);
                    %>
                    <p>Nombre de usuario: <%=request.getParameter("usu") %></p>
                    <p>Contraseña: <%=request.getParameter("pass") %></p>
                    <p>Ultimo acceso: <%=cadena %></p>
                    <a href="Logout.jsp">Cerrar Sesion</a>
                    <%
                }
                %>
        </div>
    </body>
</html>
