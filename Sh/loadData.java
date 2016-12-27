/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Movie;

import Models.Movie;
import static Movie.SignupServlet.getConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "loadData", urlPatterns = {"/loadData"})
public class loadData extends HttpServlet {

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
         Connection connection = getConnection();
         List <Movie> movies = new ArrayList <Movie> () ;
        if (connection == null) {
            processRequest(request, response);
            return;
        }
        PreparedStatement statement;
        HashMap <String,Movie> map = new HashMap <String,Movie> ();
        try {
            statement = connection.prepareStatement("select * from movie ");
            ResultSet resultSet = statement.executeQuery();
            String result = "" ;
            while (resultSet.next()) {
                Movie movie = new Movie (resultSet.getInt("MovieId"),resultSet.getString("Name") ,resultSet.getInt("Year"),resultSet.getString("MainActor"), 
                            resultSet.getString("MainActress"), resultSet.getString("PosterUrl"), resultSet.getString("BackdropPath"), resultSet.getString("Overview"),resultSet.getString("Rate"),resultSet.getInt("Price"),resultSet.getInt("NumOfCopies")) ;
                 
                movies.add(movie );
                result += movie.posterURL ;
                map.put(movie.name, movie);
            }
            
        HttpSession currentSession = request.getSession();
        currentSession.setAttribute("filter", movies);     
        request.getServletContext().setAttribute("movies", map);   
        response.getWriter().write(result);
        
            
        } catch (SQLException ex) {
            Logger.getLogger(loadData.class.getName()).log(Level.SEVERE, null, ex);
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

}
