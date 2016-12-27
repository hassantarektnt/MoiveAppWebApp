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
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
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
 * @author samuel
 */
@WebServlet(name = "SigninServlet", urlPatterns = {"/SigninServlet"})
public class SigninServlet extends HttpServlet {

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
        ///
        ArrayList<rentedMovie> myMovies = new ArrayList<>();
                    rentedMovie movie = new rentedMovie(0, "h", 0, "12", "12", "1", "1", "1", "1", 0, 0, "1", "1");
                    myMovies.add(movie);
                   
           
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        boolean found = false;

        Connection connection = getConnection();
        if (connection == null) {
            //processRequest(request, response);
            return;
        }

        PreparedStatement statement = connection.prepareStatement("select * from User where Email = ?");
        statement.setString(1, email);
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
            CurrentUser currentUser = new CurrentUser();
            currentUser.email = resultSet.getString("email");
            if (currentUser.email.equals(email)) {
                String userPass = resultSet.getString("Password");
                if (userPass.equals(password)) {
                    found = true;
                    currentUser.name = resultSet.getString("name");
                    currentUser.type = resultSet.getString("type");
                    currentUser.userId = resultSet.getInt("userId");
                    currentUser.age = resultSet.getString("Age");
                    currentUser.gender =resultSet.getString("Gender");
                    
                    HttpSession session = request.getSession();
                    session.setAttribute("currentUser", currentUser);
                     session.setAttribute("myMovies", myMovies);
                    session.setAttribute("index", 0);
                    response.sendRedirect("home.jsp");
                }
            }
        }

        if (found == false) {
            String errorMessage = "Invalid Email or Password";
            response.sendRedirect("welcome.jsp?errorMessage=" + errorMessage);
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(SigninServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(SigninServlet.class.getName()).log(Level.SEVERE, null, ex);
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
