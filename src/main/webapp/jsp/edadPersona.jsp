<%-- 
    Document   : edadPersona
    Created on : 01-oct-2018, 17:35:28
    Author     : Carlos
--%>
<%@page import="java.time.ZoneId"%>
<%@page import="java.time.Instant"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.Period"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/estilosPersonaJSP.css" type="text/css">
        <title>Edad persona</title>
    </head>
    <body>
        
        <%
            String cadena=null;
            int days=0; //para calcular los dias del cumpleaños
            int months=0; //para calcular los meses de cumpleaños
            
            //CONVERTIR STRING A DATE
            SimpleDateFormat fechaUsuario = new SimpleDateFormat("yyyy-MM-dd");
            String dateInString = request.getParameter("fecha");
            Date fechaDate = null;
            fechaDate= fechaUsuario.parse(dateInString);
            
            //CONVETIMOS DATE A CALENDAR
            Calendar recogida = Calendar.getInstance();
            recogida.setTime(fechaDate);
            
            cadena=request.getParameter("usuario"); // cogemos el nombre
            
            if(Calendar.getInstance().getTimeInMillis() >= recogida.getTimeInMillis()) //ESTO SIRVE PARA EL CASO DE QUE HAYA NACIDO
                //si es mayor significa que ya ha nacido
            {
                Instant ins= fechaDate.toInstant(); 
                LocalDate fechaUsu = ins.atZone(ZoneId.systemDefault()).toLocalDate();
                // paso el Date a LocalDate para hacer uso del metodo between
                
                if((recogida.get(Calendar.MONTH)+1) >= (Calendar.getInstance().get(Calendar.MONTH)+1))
                {
                   
                    if(Calendar.getInstance().get(Calendar.DAY_OF_MONTH) < recogida.get(Calendar.DAY_OF_MONTH))
                    {
                        //proceso para calcular años, meses y dias. Fecha inicial y fecha final (actual)
                        days= Period.between(fechaUsu,LocalDate.now()).getDays();
                        months= Period.between(fechaUsu,LocalDate.now()).getMonths();
                        
                        cadena=cadena.concat(" tiene "+(Calendar.getInstance().get(Calendar.YEAR)- recogida.get(Calendar.YEAR)-1)
                        +" años "+months+" meses y "+days+" dias ");
                    }
                    else{
                        //proceso para calcular años, meses y dias. Fecha inicial y fecha final (actual)
                        days= Period.between(fechaUsu, LocalDate.now()).getDays();
                        months= Period.between(fechaUsu, LocalDate.now()).getMonths();
                        
                        cadena=cadena.concat(" tiene "+(Calendar.getInstance().get(Calendar.YEAR)- recogida.get(Calendar.YEAR))
                        +" años "+months+" meses y "+days+" dias ");
                    }
                    
                }
                else{
                        //proceso para calcular años, meses y dias. Fecha inicial y fecha final (actual)
                        days= Period.between(fechaUsu, LocalDate.now()).getDays();
                        months= Period.between(fechaUsu, LocalDate.now()).getMonths();
                        
                        cadena=cadena.concat(" tiene "+(Calendar.getInstance().get(Calendar.YEAR)- recogida.get(Calendar.YEAR))
                        +" años "+months+" meses y "+days+" dias ");
                    }
            }
            else{ //SIGNIFICA QUE NO HA NACIDO AUN
                cadena=cadena.concat(" no ha cumplido años");
            }
        %>
        <div id="contenedor"> <!-- Si quieres poner un metodo java tiene que ser con signo menor %-->
            
            <h2><%=cadena%></h2>
            <p><a href='../index.html'>Vuelta al menu inicial</a></p>
        </div>
    </body>
</html>
