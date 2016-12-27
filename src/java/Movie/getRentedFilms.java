/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Movie;

import Models.CurrentUser;
import Models.rentedMovie;
import static Movie.SignupServlet.getConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
 * @author hassan
 */
@WebServlet(name = "getRentedFilms", urlPatterns = {"/getRentedFilms"})
public class getRentedFilms extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        //connect to data base and get all rentd movies information
        //a3mal class Rented Movie 
        //return array list of rented movies 

        /*
        SELECT * FROM  moviedb.Movie inner join moviedb.Rent
        on MovieId = MovieMovieId 
        where UserEmail ='h@gmail.com'
         */
        HttpSession session = request.getSession();
        CurrentUser currentUser;
        currentUser = (CurrentUser) session.getAttribute("currentUser");

        Connection connection = getConnection();
        String selectStatement = "SELECT * FROM  moviedb.Movie inner join moviedb.Rent"
                + " on MovieId = MovieMovieId " + " where UserEmail ='" + currentUser.email + "'";
        PreparedStatement statement = connection.prepareStatement(selectStatement);
        ResultSet resultSet = statement.executeQuery();
        ArrayList<rentedMovie> myMovies = new ArrayList<>();
        while (resultSet.next()) {
            rentedMovie r = new rentedMovie(resultSet.getInt("MovieId"),
                    resultSet.getString("Name"),
                    resultSet.getInt("Year"),
                    resultSet.getString("MainActor"),
                    resultSet.getString("MainActress"),
                    resultSet.getString("PosterUrl"),
                    resultSet.getString("BackdropPath"),
                    resultSet.getString("Overview"),
                    resultSet.getString("Rate"),
                    resultSet.getInt("Price"),
                    resultSet.getInt("NumOfCopies"),
                    resultSet.getString("DueDate"),
                    "rented");
            myMovies.add(r);
        }
        session.setAttribute("myMovies", myMovies);
        

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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(getRentedFilms.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(getRentedFilms.class.getName()).log(Level.SEVERE, null, ex);
        }
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
