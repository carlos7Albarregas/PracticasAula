/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Carlos
 */
@WebServlet(name = "ServletForm", urlPatterns = {"/ServletForm"})
public class ServletForm extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response, boolean correcto)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Formulario Simple</title>");
            out.println("<link rel='stylesheet' type='text/css' href='css/estilosServletForm.css'>");
            out.println("</head>");
            out.println("<body>");
            out.println("<div id='contenedor'>");
            out.println("<div id='borde'");
            if(!correcto)
            {
                out.println("No se han introducido datos");
            }
            else{
                out.println("<p>DATOS RECOGIDOS</p>");
                Enumeration<String> parametros=request.getParameterNames(); //se carga con usuario,email,marca y enviar
                while(parametros.hasMoreElements())
                {
                    String nombre=parametros.nextElement();
                    if(!nombre.startsWith("Sub")) //esto es para que no escriba enviar. EN el sub se pone lo que hayas puesto
                                                    // en la etiqueta name de enviar
                    {
                        out.println(nombre+ " - <strong>"+request.getParameter(nombre)+"</strong><br/>");
                        //getParameter te devuelve el valor del campo
                    }
                }
            }
            // el checkbox si esta checkeado pone lo de la etiqueta 'value' y si no, no lo pone
            out.println("</div>");
            out.println("</div>");
            out.println("<p><a href='index.html'>Vuelta al menu inicial</a></p>");
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
        boolean correcto=false;
        processRequest(request, response,correcto); // si llega aqui el usuario no ha introducido nada
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
        boolean correcto=true;
        processRequest(request, response,correcto); //DATOS INTRODUCIDOS
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

}
