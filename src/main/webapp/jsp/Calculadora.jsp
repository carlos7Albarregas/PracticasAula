<%-- 
    Document   : Calculadora
    Created on : 05-oct-2018, 1:05:52
    Author     : Carlos
--%>

<%@page import="java.util.Calendar"%>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/calculadora.css" type="text/css">
        <title>Calculadora estandar</title>
    </head>
    <body>
        <div>
            <%
                String mensaje="";
                String textoFecha="";
                String nombreDia[]={"domingo","lunes","martes","miercoles","jueves","viernes","sabado"};
                String mes[]={"enero","febrero", "marzo", "abril", "mayo", "junio","julio","julio","agosto","septiembre","octubre","noviembre","diciembre"};
                
                if(request.getParameter("op")!=null)
                {
                    Calendar fecha= Calendar.getInstance();
                 
                    textoFecha=nombreDia[fecha.get(Calendar.DAY_OF_WEEK)]+" "+fecha.get(Calendar.DAY_OF_MONTH)+
                            " de "+mes[fecha.get(Calendar.MONTH)]+" de "+fecha.get(Calendar.YEAR);
                    try{
                       mensaje=resultados(request.getParameter("op"), Float.parseFloat(request.getParameter("num1")), Float.parseFloat(request.getParameter("num2"))); 
                    }catch(NumberFormatException e)
                    {
                        mensaje="Ha introducido un operando incorrecto. Imposible realizar la operacion!";
                    }
                    
                }
            %>
            <form action="Calculadora.jsp" method="post">
                <p id="fecha"><%=textoFecha%></p>
                <p id="salida"><%=mensaje%></p>
                <label for="nombre1">Primer operando</label>
                <input id='nombre' name='num1' type="text"/>
                <label for="nombre2">Segundo operando</label>
                <input id='nombre2' name='num2' type="text"/>
                <br/>
                
                <input type="radio" name="op" value="sumar" checked="checked"/>Sumar
                <input type="radio" name="op" value="restar" />Restar
                <input type="radio" name="op" value="multiplicar" />Multiplicar
                <input type="radio" name="op" value="dividir" />Dividir
                <br/>
                
                <input type="submit" name="Submit" value="Enviar"/>
                <input type="reset" name="limpiar" value="Limpiar"/>
                
            </form>
        </div>
        <p><a href='../index.html'>Vuelta al menu inicial</a></p>

        <%!
           public String resultados(String operacion, float num1,float num2)
            {
                String cadena="";
                float resultado=0;
                if(operacion!=null)
                {
                    if(operacion.equals("sumar"))
                    {
                        resultado=num1+num2;
                        cadena=num1+" + "+num2+" = "+Math.round(resultado*100.0)/100.0;  
                    }
                    else if(operacion.equals("restar"))
                    {
                        resultado=num1-num2;
                        cadena=num1+" - "+num2+" = "+Math.round(resultado*100.0)/100.0; 
                    }
                    else if(operacion.equals("multiplicar"))
                    {
                        resultado=num1*num2;
                        cadena=num1+" * "+num2+" = "+Math.round(resultado*100.0)/100.0; 
                    }
                    else if(operacion.equals("dividir"))
                    {
                        if(num2==0)
                        {
                            cadena="No se puede dividir entre 0";
                        }
                        else{
                            resultado=num1/num2;
                            cadena=num1+" / "+num2+" = "+Math.round(resultado*100.0)/100.0;
                        }  
                    }
                }
                else{
                    cadena="";
                }
                
                return cadena;
            }
        %>
    </body>
</html>
