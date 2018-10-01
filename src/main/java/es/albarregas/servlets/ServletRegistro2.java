/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Carlos
 */
@WebServlet(name = "ServletRegistro2", urlPatterns = {"/ServletRegistro2"})
public class ServletRegistro2 extends HttpServlet {
    private int[]error= new int[4];
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
            out.println("<title>ServletRegistro2</title>");            
            out.println("</head>");
            out.println("<body>");
            if(!todoCorrecto())
            {
                out.println("<div id='contenedor1'>");
                out.println("ERRORES EN EL FORMULARIO");
                if(error[0] ==-1)
                {
                    out.println("El campo \"Nombre\" es obligatorio");
                }
                if(error[1] ==-1)
                {
                    out.println("El campo \"Usuario\" es obligatorio");
                }
                if(error[2] ==-1)
                {
                    out.println("El campo \"fecha\" es obligatorio");
                }
                if(error[3] ==-1)
                {
                    out.println("El campo \"contraseña\" es obligatorcomo");
                }
                out.println("<input type=\"submit\" name=\"continuar\" id=\"button\" value=\"Continuar\"/>");
                out.println("</div>");
               
            }
            out.println("<h1>Servlet ServletRegistro2 at " + request.getContextPath() + "</h1>");
            out.println("prueba");
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
}
