/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Carlos
 */
@WebServlet(name = "ServletCliente", urlPatterns = {"/ServletCliente"})
public class ServletCliente extends HttpServlet {

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
            
            String nombre= request.getParameter("param1");
            String nombre2= request.getParameter("param2");
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServletCliente</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Informacion del cliente</h1>");
            
            out.println("Metodo - "+request.getMethod()+"<br/>");
            out.println("URL - "+request.getRequestURI()+"<br/>");
            out.println("Protocolo - "+request.getProtocol()+"<br/>");
            out.println("Path - "+request.getPathInfo()+"<br/>");
            out.println("Remoto - "+request.getRemoteAddr()+"<br/>");
            out.println("Tipo - "+request.getAuthType()+"<br/>");
            out.println("Context path - "+request.getContextPath()+"<br/>");
            out.println("Parametros: "+"<br/>");
            
            out.println("param1: "+nombre);
            out.println("param2: "+nombre2);
            
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
    @Override
  
    public void init(ServletConfig config) throws ServletException {
        
        
        System.out.println("parametro1: "+config.getInitParameter("param1"));
        System.out.println("parametro2: "+config.getInitParameter("param2"));
        super.init(config); //To change body of generated methods, choose Tools | Templates.
    }

}
