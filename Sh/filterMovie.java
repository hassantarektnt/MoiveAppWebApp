/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Movie;

import Models.Movie;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Sherif
 */
@WebServlet(name = "filterMovie", urlPatterns = {"/filterMovie"})
public class filterMovie extends HttpServlet {

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
        String keyword = request.getParameter("keyword");
        String selector = request.getParameter("selector") ;
        
        /*if (keyword.equals("Actor")) keyword = "MainActor" ;
        else if (keyword.equals("Actress")) keyword = "MainActress" ;
        else keyword = "Year" ;*/
       /* HashMap <String , Movie> movies = (HashMap <String , Movie> )request.getServletContext().getAttribute("movies");
        String result = "" ;
        for (HashMap.Entry<String, Movie> movie : movies.entrySet()) {
            
            if (selector.equals("Year") && movie.getValue().year == Integer.valueOf(keyword) ) {
                result += movie.getValue().posterURL ;
            }
            
            else if (movie.getValue().mainActor.equals(keyword) && selector.equals("Actor")) {
                result += movie.getValue().posterURL ;
            }
            
             else if (movie.getValue().mainActress.equals(keyword)) {
                result += movie.getValue().posterURL ;
            }
            
        }*/
        HttpSession currentSession = request.getSession();
        String result = "" ;
        List <Movie> filter = new ArrayList <Movie> () ;
        List <Movie> movies =   (List <Movie> )currentSession.getAttribute("filter");
         for (int i = 0 ; i < movies.size() ; i++ ) {
            
            if (selector.equals("Year") && movies.get(i).year == Integer.valueOf(keyword) ) {
                result += movies.get(i).posterURL ;
                filter.add(movies.get(i)) ;
                        
            }
            
            else if (movies.get(i).mainActor.toLowerCase().equals(keyword.toLowerCase()) && selector.equals("Actor")) {
                result += movies.get(i).posterURL ;
                filter.add(movies.get(i)) ;
            }
            
             else if (movies.get(i).mainActress.toLowerCase().equals(keyword.toLowerCase())) {
                result += movies.get(i).posterURL ;
                filter.add(movies.get(i)) ;
            }
            
        }
        
        
        currentSession.setAttribute("filter",filter);
        response.getWriter().write(result);
        
        
        
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

}
