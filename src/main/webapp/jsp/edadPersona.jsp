<%-- 
    Document   : edadPersona
    Created on : 01-oct-2018, 17:35:28
    Author     : Carlos
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edad persona</title>
    </head>
    <body>
        <%
            String cadena=null;
            int dif=0; //para calcular los dias del cumpleaños
            int difMeses=0; //para calcular los meses de cumpleaños
            
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
                //proceso para calcular años, meses y dias
                
                if((recogida.get(Calendar.MONTH)+1) >= (Calendar.getInstance().get(Calendar.MONTH)+1))
                {
                   
                    if(Calendar.getInstance().get(Calendar.DAY_OF_MONTH) < recogida.get(Calendar.DAY_OF_MONTH))
                    {
                        difMeses=(Calendar.getInstance().get(Calendar.MONTH)+1)-(recogida.get(Calendar.MONTH)+1);
                        dif=recogida.get(Calendar.DAY_OF_YEAR)-Calendar.getInstance().get(Calendar.DAY_OF_YEAR);
                        System.out.println(">>dif meses: "+difMeses);
                        if(difMeses==0)
                        {
                            difMeses=11;
                        }
                        else{
                            System.out.println(">NEGATIVO");
                            difMeses=(recogida.get(Calendar.MONTH)+1)-(Calendar.getInstance().get(Calendar.MONTH)+1);
                            difMeses=(recogida.get(Calendar.MONTH)+1)-difMeses;
                            System.out.println(">NUEVA DIFERENCIA: "+difMeses);
                            
                        }
                        cadena=cadena.concat(" tiene "+(Calendar.getInstance().get(Calendar.YEAR)- recogida.get(Calendar.YEAR)-1)
                        +" años "+difMeses+" meses y "+(365-dif)+" dias ");
                    }
                    else{
                        
                        dif=Calendar.getInstance().get(Calendar.DAY_OF_YEAR)-recogida.get(Calendar.DAY_OF_YEAR);
                        difMeses=(Calendar.getInstance().get(Calendar.MONTH)+1)-(recogida.get(Calendar.MONTH)+1);
                        
                        cadena=cadena.concat(" tiene "+(Calendar.getInstance().get(Calendar.YEAR)- recogida.get(Calendar.YEAR))
                        +" años "+difMeses+" meses y "+(dif)+" dias ");
                    }
                    
                }
                else{
                        
                        dif=Calendar.getInstance().get(Calendar.DAY_OF_YEAR)-recogida.get(Calendar.DAY_OF_YEAR);
                        difMeses=(Calendar.getInstance().get(Calendar.MONTH)+1)-(recogida.get(Calendar.MONTH)+1);
                        
                        cadena=cadena.concat(" tiene "+(Calendar.getInstance().get(Calendar.YEAR)- recogida.get(Calendar.YEAR))
                        +" años "+difMeses+" meses y "+(dif)+" dias ");
                    }
            }
            else{ //SIGNIFICA QUE NO HA NACIDO AUN
                cadena=cadena.concat(" no ha cumplido años");
            }
        %>
        <div> <!-- Si quieres poner un metodo java tiene que ser con signo menor %-->
            
            <h2><%=cadena%></h2>
            <p><a href='../index.html'>Vuelta al menu inicial</a></p>
        </div>
    </body>
</html>
