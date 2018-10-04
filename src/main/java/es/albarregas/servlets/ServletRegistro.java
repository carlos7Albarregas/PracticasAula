/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Enumeration;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Carlos
 */
@WebServlet(name = "ServletRegistro", urlPatterns = {"/ServletRegistro"})
public class ServletRegistro extends HttpServlet {

    private int[] error = new int[4];
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Registro</title>");
            out.println("<link rel='stylesheet' type='text/css' href='css/estilosRegistro.css'>");
            out.println("</head>");
            out.println("<body>");
            out.println("<div id='contenedor'");
            
            
            if (!todoCorrecto()) { //MUESTRO OTRA VEZ EL FORMULARIO ADEMAS DE COMPROBARLO UNA VEZ ENVIADOS
                
                String nom= request.getParameter("Nombre");
                String ape= request.getParameter("Apellido");
                String usu= request.getParameter("usuario");
                String contra= request.getParameter("pass");
                String sexo=request.getParameter("sexo");
                String dia= request.getParameter("dia");
                String mes= request.getParameter("mes");
                String anio= request.getParameter("anyo");
                
                out.println("<p><strong>DATOS INCORRECTOS</strong></p>");
                
                out.println("<form action=ServletRegistro method='post'>");
                out.println("<fieldset id='primercuadro'>");
                
                out.println("<legend>Informacion Personal</legend>");
                
                out.println("<label for='nombre'>* Nombre</label>");
                if(error[0]==-1)
                    /* En el caso que sea erroneo muestro el aspa roja y logicamente en value no habra nada*/
                {
                    out.println("<input id='nombre' name='Nombre' type='text' value="+nom+">");
                    out.println("<img src='imagenes/aspa.jpg' heigh=20px width=20px");
                    out.println("<strong>NOMBRE ES OBLIGATORIO</strong>");
                    out.println("<br/>");
                }
                else/* En el caso que sea CORRECTO muestro el check y en value lo que haya introducido el usuario*/
                {
                    out.println("<input id='nombre' name='Nombre' type='text' value="+nom+">");
                    out.println("<img src='imagenes/check.jpg' heigh=20px width=20px");
                    out.println("<br/>");
                }
                
                
                out.println("<br/>");
                out.println("<label for='apellido'>Apellidos</label>");
                out.println("<input id='apellido' name='Apellido' type='text'value="+ape+">");
                out.println("<br/>");
                out.println("<label for='sexo'>Sexo</label>");
                if(sexo.equals("hombre"))
                    /*Dependiendo de si ha seleccionado el radioButtom de hombre o mujer lo checkeare en uno u otro caso*/
                {
                    out.println("<input type='radio' name='sexo' value='hombre' checked="+sexo+" />Hombre");
                    out.println("<input type='radio' name='sexo' value='mujer' />Mujer");
                }
                else
                {
                    out.println("<input type='radio' name='sexo' value='hombre'  />Hombre");
                    out.println("<input type='radio' name='sexo' value='mujer' checked="+sexo+" />Mujer");
                }
                
                
                out.println("<br/>");
                out.println("<label for='fecha'>Fecha nacimiento</label>");
                if(error[2]==-1)// FECHA ERRONEA VUELVO A MOSTRAR DE NUEVO LOS SELECT DE CADA DIA, MEZ Y AÑO
                {
                    
                    out.println("<select name='dia'>");

                    out.println("<option value='1'>1</option>");
                    out.println("<option value='2'>2</option>");
                    out.println("<option value='3'>3</option>");
                    out.println("<option value='4'>4</option>");
                    out.println("<option value='5'>5</option>");
                    out.println("<option value='6'>6</option>");
                    out.println("<option value='7'>7</option>");
                    out.println("<option value='8'>8</option>");
                    out.println("<option value='9'>9</option>");
                    out.println("<option value='10'>10</option>");
                    out.println("<option value='11'>11</option>");
                    out.println("<option value='12'>12</option>");
                    out.println("<option value='13'>13</option>");
                    out.println("<option value='14'>14</option>");
                    out.println(" <option value='15'>15</option>");
                    out.println("<option value='16'>16</option>");
                    out.println("<option value='17'>17</option>");
                    out.println("<option value='18'>18</option>");
                    out.println("<option value='19'>19</option>");
                    out.println("<option value='20'>20</option>");
                    out.println("<option value='21'>21</option>");
                    out.println("<option value='22'>22</option>");
                    out.println("<option value='23'>23</option>");
                    out.println("<option value='24'>24</option>");
                    out.println("<option value='25'>25</option>");
                    out.println("<option value='26'>26</option>");
                    out.println("<option value='27'>27</option>");
                    out.println("<option value='28'>28</option>");
                    out.println("<option value='29'>29</option>");
                    out.println("<option value='30'>30</option>");
                    out.println("<option value='31'>31</option>");
                    
                out.println("/</select>");
                out.println("/");
                out.println("<select name='mes'>");
                    
                    out.println("<option value='1'>Enero</option>");
                    out.println("<option value='2'>Febrero</option>");
                    out.println("<option value='3'>Marzo</option>");
                    out.println("<option value='4'>Abril</option>");
                    out.println("<option value='5'>Mayo</option>");
                    out.println("<option value='6'>Junio</option>");
                    out.println("<option value='7'>Julio</option>");
                    out.println("<option value='8'>Agosto</option>");
                    out.println("<option value='9'>Septiembre</option>");
                    out.println("<option value='10'>Octubre</option>");
                    out.println("<option value='11'>Noviembre</option>");
                    out.println("<option value='12'>Diciembre</option>");
                out.println("</select>");
                out.println("/");
                out.println("<select name='anyo'>");
                    out.println("<option value='1970'>1970</option>");
                        out.println("<option value='1971'>1971</option>");
                        out.println("<option value='1972'>1972</option>");
                        out.println("<option value='1973'>1973</option>");
                        out.println("<option value='1974'>1974</option>");
                        out.println("<option value='1975'>1975</option>");
                        out.println("<option value='1976'>1976</option>");
                        out.println("<option value='1977'>1977</option>");
                        out.println("<option value='1978'>1978</option>");
                        out.println("<option value='1979'>1979</option>");
                        out.println("<option value='1980'>1980</option>");
                        out.println("<option value='1981'>1981</option>");
                        out.println("<option value='1982'>1982</option>");
                        out.println("<option value='1983'>1983</option>");
                        out.println("<option value='1984'>1984</option>");
                        out.println("<option value='1985'>1985</option>");
                        out.println("<option value='1986'>1986</option>");
                        out.println("<option value='1987'>1987</option>");
                        out.println("<option value='1988'>1988</option>");
                        out.println("<option value='1989'>1989</option>");
                        out.println("<option value='1990'>1990</option>");
                        out.println(" <option value='1991'>1991</option>");
                        out.println("<option value='1992'>1992</option>");
                        out.println("<option value='1993'>1993</option>");
                        out.println("<option value='1994'>1994</option>");
                        out.println("<option value='1995'>1995</option>");
                        out.println("<option value='1996'>1996</option>");
                        out.println("<option value='1997'>1997</option>");
                        out.println("<option value='1998'>1998</option>");
                        out.println("<option value='1999'>1990</option>");
                        out.println("<option value='2000'>2000</option>");
                        out.println("<option value='2001'>2001</option>");
                        out.println("<option value='2002'>2002</option>");
                        out.println("<option value='2003'>2003</option>");
                        out.println("<option value='2004'>2004</option>");
                        out.println("<option value='2005'>2005</option>");
                        out.println("<option value='2006'>2006</option>");
                        out.println("<option value='2007'>2007</option>");
                        out.println("<option value='2008'>2008</option>");
                        out.println("<option value='2009'>2009</option>");
                        out.println("<option value='2010'>2010</option>");
                out.println("</select>");   
                out.println("<img src='imagenes/aspa.jpg' heigh=20px width=20px");
                out.println("<strong>FECHA ES INCORRECTA</strong>");
                    out.println("<br/>");
                }
                // FECHA CORRECTA
                else{
                    /*Simplemente aqui lo que hago es recoger lo que haya seleccionado el usuario. Para ello indicandolo
                    en la propiedad value y selected para que lo seleccione lo tendriamos ya*/
                    out.println("<select name='dia' id='dia'>");
                    out.println("<option disabled value="+dia+" selected>"+dia+"</option>");
                    out.println("<option value='1'>1</option>");
                    out.println("<option value='2'>2</option>");
                    out.println("<option value='3'>3</option>");
                    out.println("<option value='4'>4</option>");
                    out.println("<option value='5'>5</option>");
                    out.println("<option value='6'>6</option>");
                    out.println("<option value='7'>7</option>");
                    out.println("<option value='8'>8</option>");
                    out.println("<option value='9'>9</option>");
                    out.println("<option value='10'>10</option>");
                    out.println("<option value='11'>11</option>");
                    out.println("<option value='12'>12</option>");
                    out.println("<option value='13'>13</option>");
                    out.println("<option value='14'>14</option>");
                    out.println("<option value='15'>15</option>");
                    out.println("<option value='16'>16</option>");
                    out.println("<option value='17'>17</option>");
                    out.println("<option value='18'>18</option>");
                    out.println("<option value='19'>19</option>");
                    out.println("<option value='20'>20</option>");
                    out.println("<option value='21'>21</option>");
                    out.println("<option value='22'>22</option>");
                    out.println("<option value='23'>23</option>");
                    out.println("<option value='24'>24</option>");
                    out.println("<option value='25'>25</option>");
                    out.println("<option value='26'>26</option>");
                    out.println("<option value='27'>27</option>");
                    out.println("<option value='28'>28</option>");
                    out.println("<option value='29'>29</option>");
                    out.println("<option value='30'>30</option>");
                    out.println("<option value='31'>31</option>");
                    
                    out.println("</select>");
                    
                    out.println("<select name='mes' id='mes'>");
                    out.println("<option disabled value="+mes+" selected>"+mes+"</option>");
                    out.println("<option value='1'>Enero</option>");
                    out.println("<option value='2'>Febrero</option>");
                    out.println("<option value='3'>Marzo</option>");
                    out.println("<option value='4'>Abril</option>");
                    out.println("<option value='5'>Mayo</option>");
                    out.println("<option value='6'>Junio</option>");
                    out.println("<option value='7'>Julio</option>");
                    out.println("<option value='8'>Agosto</option>");
                    out.println("<option value='9'>Septiembre</option>");
                    out.println("<option value='10'>Octubre</option>");
                    out.println("<option value='11'>Noviembre</option>");
                    out.println("<option value='12'>Diciembre</option>");
                    out.println("</select>");
                    
                    out.println("<select name='anyo' id='anyo'>");
                    out.println("<option disabled value="+anio+" selected>"+anio+"</option>");
                    out.println("<option value='1970'>1970</option>");
                        out.println("<option value='1971'>1971</option>");
                        out.println("<option value='1972'>1972</option>");
                        out.println("<option value='1973'>1973</option>");
                        out.println("<option value='1974'>1974</option>");
                        out.println("<option value='1975'>1975</option>");
                        out.println("<option value='1976'>1976</option>");
                        out.println("<option value='1977'>1977</option>");
                        out.println("<option value='1978'>1978</option>");
                        out.println("<option value='1979'>1979</option>");
                        out.println("<option value='1980'>1980</option>");
                        out.println("<option value='1981'>1981</option>");
                        out.println("<option value='1982'>1982</option>");
                        out.println("<option value='1983'>1983</option>");
                        out.println("<option value='1984'>1984</option>");
                        out.println("<option value='1985'>1985</option>");
                        out.println("<option value='1986'>1986</option>");
                        out.println("<option value='1987'>1987</option>");
                        out.println("<option value='1988'>1988</option>");
                        out.println("<option value='1989'>1989</option>");
                        out.println("<option value='1990'>1990</option>");
                        out.println(" <option value='1991'>1991</option>");
                        out.println("<option value='1992'>1992</option>");
                        out.println("<option value='1993'>1993</option>");
                        out.println("<option value='1994'>1994</option>");
                        out.println("<option value='1995'>1995</option>");
                        out.println("<option value='1996'>1996</option>");
                        out.println("<option value='1997'>1997</option>");
                        out.println("<option value='1998'>1998</option>");
                        out.println("<option value='1999'>1990</option>");
                        out.println("<option value='2000'>2000</option>");
                        out.println("<option value='2001'>2001</option>");
                        out.println("<option value='2002'>2002</option>");
                        out.println("<option value='2003'>2003</option>");
                        out.println("<option value='2004'>2004</option>");
                        out.println("<option value='2005'>2005</option>");
                        out.println("<option value='2006'>2006</option>");
                        out.println("<option value='2007'>2007</option>");
                        out.println("<option value='2008'>2008</option>");
                        out.println("<option value='2009'>2009</option>");
                        out.println("<option value='2010'>2010</option>");
                    out.println("</select>");
                    
                    out.println("<img src='imagenes/check.jpg' heigh=20px width=20px");
                    out.println("<br/>");
                }
                
                out.println("</fieldset>");
                /* SEGUNDO FIELDSET*/
            out.println("<fieldset id='segundo'>");
                out.println("<legend>Datos de acceso</legend>");
                
                out.println("<label for='usuario'>* Usuario</label>");
                if(error[1]==-1)// USUARIO INCORRECTO (CAMPO VACIO) HACEMOS COMO EN NOMBRE
                {
                    out.println("<input id='usuario' name='usuario' type='text' value="+usu+ ">");
                    out.println("<img src='imagenes/aspa.jpg' heigh=20px width=20px");
                    out.println("<strong>USUARIO ES OBLIGATORIO</strong>");
                    out.println("<br/>");
                }
                else
                {
                    out.println("<input id='usuario' name='usuario' type='text' value="+usu+ ">");
                    out.println("<img src='imagenes/check.jpg' heigh=20px width=20px");
                    out.println("<br/>");
                }
                out.println("<br/>");
                out.println("<label for='pass'>* Contraseña</label>");
                if(error[3]==-1) //CAMPO ERRONEO HACEMOS IGUAL QUE ANTERIORMENTE
                {
                    out.println("<input id='pass' name='pass' type='password' value="+contra+">");
                    out.println("<img src='imagenes/aspa.jpg' heigh=20px width=20px");
                    out.println("<strong>CONTRASEÑA ES OBLIGATORIO</strong>");
                    out.println("<br/>");
                }
                else
                {
                    out.println("<input id='pass' name='pass' type='password' value="+contra+">");
                    out.println("<img src='imagenes/check.jpg' heigh=20px width=20px");
                    out.println("<br/>");
                }
                
            out.println("</fieldset>");
            /* TERCER FIELDSET*/
            out.println("<fieldset id='tercero'>");
                
            out.println("<legend>Informacion general</legend>");
            out.println("<label for='pref'>Preferencias</label><br/>");
               
            out.println("<input type='checkbox' name='pref' value='deporte' />Deporte");
            out.println("<br/>");
            out.println("<input type='checkbox' name='pref' value='lectura' />Lectura");
            out.println("<br/>");
            out.println("<input type='checkbox' name='pref' value='cine' />Cine");    
            out.println("<br/>");
            out.println("<input type='checkbox' name='pref' value='viajes' />Viajes");   
            out.println("<br/>");
 
            out.println("</fieldset>");
            
            out.println("<input type='submit' name='Submit' id='button' value='Enviar'/>");
            out.println("<input type='reset' value='Limpiar formulario'>");
        out.println("</form>");
               
            }/** FIN IF. */
            /* SI LOS DATOS SON CORRECTOS MOTRAMOS LA SALIDA DE INFORMACION*/
            else {
                out.println("<p>DATOS CORRECTOS</p>"); //mostramos los datos
                
                Map parametros = request.getParameterMap(); //OBTENEMOS TODA LA INFORMACION
                Set s = parametros.entrySet(); 
                Iterator it = s.iterator();

                while (it.hasNext()) {
                    Map.Entry<String, String[]> entry = (Map.Entry<String, String[]>) it.next(); //VAMOS ITERANDO
                    /*con getKey() obtienes la clave y getValue() el valor. En lugar de hacerlo con getParameter() seria mas
                    correcto hacerlo con getKey y getValue . Asi como esta seria una mezcla de parameter y mapa*/
                    String key = entry.getKey();
                    /*
                    Aqui lo que hago es primero para que no me muestre el valor de enviar hago una condicion, seguidamente
                    para que no me muestre la fecha tres veces, dos condiciones para que en el caso de me venga el dia o el mes
                    no me haga nada. Una vez que me venga ya el año es cuando voy a mostrar la fecha
                    */
                    if (!key.startsWith("Sub") && !key.equals("dia") && !key.equals("mes")) {
                        if (key.equals("pref")) {
                            String[] results = request.getParameterValues("pref");// con esto obtenemos todo lo q haya marcado en checkbox
                            out.println("Preferencias"); 
                            for (int i = 0; i < results.length; i++) {
                                out.println("<strong>" + results[i] + "</strong>");
                            }

                        } else if (key.equals("anyo")) {
                            //AQUI MUESTRO FECHA
                            String mes=obtenerMes(Integer.parseInt(request.getParameter("mes"
                                    + "")));
                            //EL METODO OBTENER MES ESTA EXPLICADO MAS ABAJO EN LA DECLARACION
                            out.println("Fecha nacimiento - " + "<strong>" + request.getParameter("dia") + " de "
                                    + mes + " de " + request.getParameter("anyo") + "</strong><br/>");

                        } else {
                            
                            out.println(key + " - <strong>" + request.getParameter(key) + "</strong><br/>");
                        }

                    }

                }
                out.println("<p><a href='index.html'>Vuelta al menu inicial</a></p>");
            }
            out.println("</div>");

            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        for (int i = 0; i < error.length; i++) {
            error[i] = -1; //SI VALE -1 SIGNIFICA QUE HA HABIDO ALGUN ERROR
        }

        String nombre = request.getParameter("Nombre");
        String usu = request.getParameter("usuario");
        String pass = request.getParameter("pass");
        String dia = request.getParameter("dia");
        String mes = request.getParameter("mes");
        String anyo = request.getParameter("anyo");

        if (!nombre.isEmpty()) //aqui compuruebo si hay algun campo q no ha rellenado en el caso que haya algo pongo un valor
                                  // distinto de 0
        {
            error[0] = 0;
        }
        if (!usu.isEmpty()) {
            error[1] = 1;
        }
        /* COMPROBACION FECHA*/
        
        if (esBisiesto(anyo)) {
            // Si es bisiesto significa que el mes de febrero tiene un dia mes (29) los demas meses dependiendo el caso 30 o 31
            // hago un array porque asi me sera mas facil comprobar cuando el dia de un mes no sea 30 o 31
            int[] meses = {31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
            int fechaDia = Integer.parseInt(dia);
            int fechaMes = Integer.parseInt(mes);
            if (fechaDia <= meses[fechaMes - 1]) 
                /*Simplemente aqui lo que hacemos es que cuando el dia que haya cogido sea menor con respecto a la posicion
                del mes de este dia, significa que es correcto
                */
            {
                error[2] = 2;
                //fecha correcta
            } 
            else {
                error[2] = -1;
                //fecha incorrecta
            }
        }
            else{
            //MISMA LOGICA SOLO QUE AL NO SER BISIESTO FEBRERO TIENE 28
                int[] meses={31,28,31,30,31,30,31,31,30,31,30,31};
                int fechaDia=Integer.parseInt(dia);
                int fechaMes=Integer.parseInt(mes);
                if(fechaDia <= meses[fechaMes-1])
                {
                    error[2]=2;
                    //fecha correcta
                }
                else{
                    error[2]=-1;
                    //fecha incorrecta
                }
            }
        
        if (!pass.isEmpty()) {
            error[3] = 3;
        }
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    public boolean esBisiesto(String anyo) {
        int anio = Integer.parseInt(anyo);
        if ((anio % 4 == 0) && ((anio % 100 != 0) || (anio % 400 == 0))) {
            return true;
        } else {
            return false;
        }
    }

    public boolean todoCorrecto() {
        //si todas las posiciones son true significa que esta todo correcto
        boolean res = true;

        for (int i = 0; i < error.length; i++) {
            
            if (error[i] == -1) {
                res = false;
            }

        }
        return res;
    }
    
    public String obtenerMes(int mes)
            //Esto lo hago para obtener el mes con cadena y no con numero. Para ello con un switch haciendo un caso para cada mes
            //valdria
    {
        String result="";
        switch(mes)
        {
            case 1: result="Enero";
                break;
                
            case 2:result="Febrero";
                break;
                
            case 3:result="Marzo";
                break;
                
            case 4: result="Abril";
                break;
                
            case 5:
                result="Mayo";
                break;
            case 6:result="Junio";
                break;
            case 7:
                result="Julio";
                break;
            case 8:
                result="Agosto";
                break;
            case 9:
                result="Septiembre";
                break;
            case 10:
                result="Octubre";
                break;
            case 11:
                result="Noviembre";
                break;
            case 12:
                result="Diciembre";
                break;
        }
        return result;
    }
}
