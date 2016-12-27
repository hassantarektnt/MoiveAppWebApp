/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Movie;

import Models.CurrentUser;
import Models.Movie;
import Models.Rent;
import Models.Value;
import com.mysql.jdbc.Statement;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
@WebServlet(name = "MovieDetails", urlPatterns = {"/MovieDetails"})
public class MovieDetails extends HttpServlet {

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
            
            
                HttpSession current = request.getSession();
                String movieID = (String)current.getAttribute("clickedmovie");
                System.out.print("MID : "+request.getSession().getAttribute(Value.ATTRIBUTE_CURRENT_USER));
                CurrentUser currentUser = ((CurrentUser)request.getSession().getAttribute(Value.ATTRIBUTE_CURRENT_USER));
                
                String userEmail = "null";
                if (currentUser != null){
                    userEmail = currentUser.email;
                }
                Movie movie = new Movie();
                Rent rent = new Rent();
                Class.forName("com.mysql.jdbc.Driver");
                java.sql.Connection myConnection
                        = DriverManager.getConnection(Value.DATABASE_URL, Value.DATABASE_USERNAME, Value.DATABASE_PASSWORD);
                Statement stmt = (Statement)myConnection.createStatement();
                ResultSet result = stmt.executeQuery("SELECT * FROM Movie WHERE MovieId = " + movieID);
                
                while(result.next()){
                    movie.Id = result.getInt(Value.TABLE_MOVIE_ID);
                    movie.name = result.getString(Value.TABLE_MOVIE_NAME);
                    movie.year = result.getInt(Value.TABLE_MOVIE_YEAR);
                    movie.mainActor = result.getString(Value.TABLE_MOVIE_MAIN_ACTOR);
                    movie.mainActress = result.getString(Value.TABLE_MOVIE_MAIN_ACTRESS);
                    movie.rate = result.getString(Value.TABLE_MOVIE_RATE);
                    movie.price = result.getInt(Value.TABLE_MOVIE_PRICE);
                    movie.numOfCopies = result.getInt(Value.TABLE_MOVIE_NUM_OF_COPIES);
                    movie.posterUrl = result.getString(Value.TABLE_MOVIE_POSTER_URL);
                    movie.backdropPath = result.getString(Value.TABLE_MOVIE_BACKDROP_PATH);
                    movie.overview = result.getString(Value.TABLE_MOVIE_OVERVIEW);
                }
                result.close();
                stmt.close();
                System.out.print("Here");
                Statement stmt2 = (Statement)myConnection.createStatement();
                ResultSet result2 = stmt2.executeQuery("select * from rent where UserEmail = 'a.khalifa2795@gmail.com' and MovieMovieId = 1;");
                while(result2.next()){
                    rent.userEmail = result2.getString(Value.TABLE_RENT_USER_EMAIL);
                    rent.movieId = result2.getInt(Value.TABLE_RENT_MOVIE_ID);
                    rent.dueDate = result2.getString(Value.TABLE_RENT_DUE_DATE);
                    rent.state = result2.getString(Value.TABLE_RENT_STATE);
                }
                result2.close();
                stmt2.close();
                myConnection.close();
                request.setAttribute(Value.ATTRIBUTE_CURRENT_MOVIE, movie);
                request.setAttribute(Value.ATTRIBUTE_CURRENT_RENT, rent);
                RequestDispatcher rDispatcher = request.getRequestDispatcher(Value.JSP_MOVIE);
                rDispatcher.forward(request, response);
            } catch (Exception exc) {
                String str = exc.getMessage();
                response.sendRedirect("movie.jsp");
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
