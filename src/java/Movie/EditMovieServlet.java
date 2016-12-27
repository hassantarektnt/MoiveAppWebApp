/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Movie;

import Models.Movie;
import Models.Value;
import com.mysql.jdbc.Statement;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Calendar;
import java.util.HashMap;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ACali
 */
@WebServlet(name = "EditMovieServlet", urlPatterns = {"/EditMovieServlet"})
public class EditMovieServlet extends HttpServlet {

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
            try {
                Movie movie = new Movie();
                movie.Id = Integer.parseInt((String)request.getParameter(Movie.MOVIE_ID));
                movie.name = (String)request.getParameter(Movie.MOVIE_NAME);
                movie.year = Integer.parseInt((String)request.getParameter(Movie.MOVIE_YEAR));
                movie.mainActor = (String)request.getParameter(Movie.MOVIE_MAIN_ACTOR);
                movie.mainActress = (String)request.getParameter(Movie.MOVIE_MAIN_ACTRESS);
                movie.rate = (String)request.getParameter(Movie.MOVIE_RATE);
                movie.price = Integer.parseInt((String)request.getParameter(Movie.MOVIE_PRICE));
                movie.numOfCopies = Integer.parseInt((String)request.getParameter(Movie.MOVIE_COPIES));
                movie.posterUrl = (String)request.getParameter(Movie.MOVIE_POSTER);
                movie.backdropPath = (String)request.getParameter(Movie.MOVIE_BACKDROP);
                movie.overview = (String)request.getParameter(Movie.MOVIE_OVERVIEW);
                
                HashMap <String , Movie> movies = (HashMap <String , Movie> )request.getServletContext().getAttribute("movies");
                String movieposter = "" ;
                for ( HashMap.Entry<String, Movie> movie2 : movies.entrySet()) {
                      if ( movie2.getValue().getId() == movie.Id) {
                          String key = movie2.getKey() ;
                         movies.remove(key);
                         movies.put(movie.name, movie) ;
                         break;
                      }
                }
                request.getServletContext().setAttribute("movies",movies);
                HttpSession currentSession = request.getSession();
                currentSession.setAttribute("clickedmovie",movie);
                Class.forName("com.mysql.jdbc.Driver");
                java.sql.Connection myConnection
                        = DriverManager.getConnection(Value.DATABASE_URL, Value.DATABASE_USERNAME, Value.DATABASE_PASSWORD);
                String stmt_str = 
                        "UPDATE Movie SET "
                        + "Name = ?, "
                        + "Year = ?, "
                        + "MainActor = ?, "
                        + "MainActress = ?, "
                        + "PosterUrl = ?, "
                        + "BackdropPath = ?, "
                        + "Overview = ?, "
                        + "Rate = ?, "
                        + "Price = ?, "
                        + "NumOfCopies = ? "
                        + "WHERE MovieID = ?;";
                PreparedStatement preparedStatement = myConnection.prepareStatement(stmt_str, Statement.RETURN_GENERATED_KEYS);
                preparedStatement.setString(1, movie.name);
                preparedStatement.setInt(2, movie.year);
                preparedStatement.setString(3, movie.mainActor);
                preparedStatement.setString(4, movie.mainActress);
                preparedStatement.setString(5, movie.posterUrl);
                preparedStatement.setString(6, movie.backdropPath);
                preparedStatement.setString(7, movie.overview);
                preparedStatement.setString(8, movie.rate);
                preparedStatement.setInt(9, movie.price);
                preparedStatement.setInt(10, movie.numOfCopies);
                preparedStatement.setInt(11, movie.Id);
                preparedStatement.executeUpdate();
                preparedStatement.close();
                myConnection.close();
                request.setAttribute(Movie.MOVIE_ID, movie.Id);
                //RequestDispatcher rDispatcher = request.getRequestDispatcher(Value.SERVLET_MOVIE_DETAILS);
                //rDispatcher.forward(request, response);
                response.sendRedirect("movie.jsp");
            } catch (Exception exc) {
                
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
