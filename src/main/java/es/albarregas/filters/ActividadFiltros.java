/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.filters;

import java.io.IOException;
import java.util.Calendar;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

/**
 *
 * @author Carlos
 */
@WebFilter(filterName="AllActivity", urlPatterns={"/*"})

public class ActividadFiltros implements Filter{
    private ServletContext context;
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.context = filterConfig.getServletContext(); 
        this.context.log("Activity initialized");
        
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        Calendar time = Calendar.getInstance();
        System.out.println("Acceso desde IP: " + request.getRemoteAddr() + " - "+time.get(Calendar.DAY_OF_MONTH)+"/"
                +(time.get(Calendar.MONTH)+1)+"/"+time.get(Calendar.YEAR)+" a las " + time.get(Calendar.HOUR_OF_DAY) + ":" + +
                        time.get(Calendar.MINUTE));
        System.out.println("*******************************************************************************");
        chain.doFilter(request, response);
        System.out.println("Contestado a las " + time.get(Calendar.HOUR_OF_DAY) + ":" + + time.get(Calendar.MINUTE));
        System.out.println("*******************************************************************************");
    }

    @Override
    public void destroy() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
