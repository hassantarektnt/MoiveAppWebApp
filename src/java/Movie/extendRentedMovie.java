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
@WebServlet(name = "extendRentedMovie", urlPatterns = {"/extendRentedMovie"})
public class extendRentedMovie extends HttpServlet {

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
        //get rented movie from  database then update it's in data base
        /*
        UPDATE moviedb.Rent
        SET DueDate= '15/12/2016'
        WHERE MovieMovieId='1';
         */
        HttpSession session = request.getSession();
        CurrentUser currentUser = (CurrentUser) session.getAttribute("currentUser");

        int i = (int) session.getAttribute("index");
        ArrayList<rentedMovie> myMovies = (ArrayList<rentedMovie>) session.getAttribute("myMovies");
        String date = request.getParameter("newReturnDate");
        Connection connection = getConnection();
        String Statement = "UPDATE moviedb.Rent SET DueDate= '"
                + date + "' WHERE MovieMovieId='"
                + myMovies.get(i).id
                + "' and UserEmail='" + currentUser.email + "' ;";
        PreparedStatement statement = connection.prepareStatement(Statement);
        statement.execute();
        response.sendRedirect("profile.jsp");

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
            Logger.getLogger(extendRentedMovie.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(extendRentedMovie.class.getName()).log(Level.SEVERE, null, ex);
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
