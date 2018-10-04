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
        <%!
            /* Aqui en este metodo lo que hago es dependiendo la diferencia entre dias y los meses, maqueto una salida de 
            informacion u otra. Luego por ultimo retorno esa misma cadena
            */
            public String salida(int days,int months,String cadena)
            {
                if(months>1)
                {
                    if(days==0)
                    {
                        cadena=cadena.concat(" y "+months+" meses de edad");
                    }
                    else
                            {
                                if(days!=1)
                                {
                                    cadena=cadena.concat(", "+months+" meses y "+days+" dias de edad");
                                }
                                else if(days==1)
                                {
                                        cadena=cadena.concat(", "+months+" meses y "+days+" dia de edad");
                                }
                                        
                                
                            
                            }
                        }// FIN MESES MAYOR QUE 1
                        else
                        {
                            if(months==1)
                            {
                                
                                if(days>1)
                                {
                                    cadena=cadena.concat(", "+months+" mes y "+days+" dias de edad");
                                }
                                else{
                                    if(days==1)
                                    {
                                        cadena=cadena.concat(", "+months+" mes y "+days+" dia de edad");  
                                    }
                                    else{
                                        cadena=cadena.concat(" y "+months+" mes de edad");
                                    }
                                      
                                }
                                
                            }//FIN MESES IGUAL 1 
                            else if(months==0)
                            {
                                                               
                                if(days>1)
                                {
                                    cadena=cadena.concat(" y "+days+" dias de edad");
                                }
                                if(days==1){//dias igual a 1
                                        cadena=cadena.concat(" y "+days+" dia de edad");
                                    }
                                }
                                
                            }
                            
                return cadena;
            }
              
            %>
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
                 // paso el Date a LocalDate para hacer uso del metodo between
                 
                Instant ins= fechaDate.toInstant(); 
                LocalDate fechaUsu = ins.atZone(ZoneId.systemDefault()).toLocalDate();
               
                
                if((recogida.get(Calendar.MONTH)+1) <= (Calendar.getInstance().get(Calendar.MONTH)+1))
                    //SI ES MENOR IGUAL PUEDE HABER CUMPLIDO AÑOS (SI ESTA EN EL MISMO MES AL ACTUAL LA FECHA NACIMIENTO
                {
                    
                    days= Period.between(fechaUsu,LocalDate.now()).getDays();
                    months= Period.between(fechaUsu,LocalDate.now()).getMonths();
                    
                    if((recogida.get(Calendar.MONTH)+1) == (Calendar.getInstance().get(Calendar.MONTH)+1))
                        //PUEDE HABER CUMPLIDO MIRAMOS EL DIA
                    {
                        
                        if(Calendar.getInstance().get(Calendar.DAY_OF_MONTH) < recogida.get(Calendar.DAY_OF_MONTH))
                        {
                            
                            //NO HA LLEGADO AUN EL DIA
                            cadena=cadena.concat(" tienes "+(Calendar.getInstance().get(Calendar.YEAR)- recogida.get(Calendar.YEAR)-1)
                                +" años ");
                            cadena=salida(days, months, cadena);
                        }
                        else{
                            //YA HA PASADO EL DIA O ES EL MISMO

                            cadena=cadena.concat(" tienes "+(Calendar.getInstance().get(Calendar.YEAR)- recogida.get(Calendar.YEAR))
                                +" años ");
                            cadena=salida(days, months, cadena);
                        }   
                   }
                   else{
                        //En este caso al no ser igual el mes de nacimiento al actual, significa que ya ha cumplido años
                       cadena=cadena.concat(" tienes "+(Calendar.getInstance().get(Calendar.YEAR)- recogida.get(Calendar.YEAR)))
                               +" años ";
                       cadena=salida(days, months, cadena);
                   }
                    
                }
                else{//NO LO HA CUMPLIDO PORQUE ES MAYOR A LA DEL USUARIO
                    
                        days= Period.between(fechaUsu, LocalDate.now()).getDays();
                        months= Period.between(fechaUsu, LocalDate.now()).getMonths();
                        
                        cadena=cadena.concat(" tienes "+(Calendar.getInstance().get(Calendar.YEAR)- recogida.get(Calendar.YEAR))
                            +" años ");
                        cadena=salida(days, months, cadena);
                    }
            }
            else{ //SIGNIFICA QUE NO HA NACIDO AUN
                cadena=cadena.concat(" no has nacido todavia!");
            }
        %>
        <%
            
            %>
        <div id="contenedor"> <!-- Si quieres poner un metodo java tiene que ser con signo menor %-->
            
            <h2>Hola <%=cadena%></h2>
            <p><a href='../index.html'>Vuelta al menu inicial</a></p>
        </div>
    </body>
</html>
