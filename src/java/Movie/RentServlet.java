/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Movie;

import Models.Movie;
import Models.Rent;
import Models.Value;
import com.mysql.jdbc.Statement;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ACali
 */
@WebServlet(name = "RentServlet", urlPatterns = {"/RentServlet"})
public class RentServlet extends HttpServlet {

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
                Rent rent = new Rent();
                rent.userEmail = (String)request.getSession().getAttribute("rentEmail");
                rent.movieId = (Integer)request.getSession().getAttribute("rentMId");
                rent.dueDate = (String)request.getParameter(Rent.RENT_DUE_DATE);
                rent.state = "1";
                System.out.print("Here "+(String)request.getSession().getAttribute("rentEmail"));
                Class.forName("com.mysql.jdbc.Driver");
                //java.sql.Connection myConnection
                       // = DriverManager.getConnection(Value.DATABASE_URL, Value.DATABASE_USERNAME, Value.DATABASE_PASSWORD);
                 Connection connection = SignupServlet.getConnection();
                       String stmt_str = "INSERT INTO Rent VALUES (?, ?, ?, ?);";
                PreparedStatement preparedStatement = connection.prepareStatement(stmt_str, Statement.RETURN_GENERATED_KEYS);
                preparedStatement.setString(1, rent.userEmail);
                preparedStatement.setInt(2, rent.movieId);
                preparedStatement.setString(3, rent.dueDate);
                preparedStatement.setString(4, rent.state);
                preparedStatement.executeUpdate();
                //preparedStatement.close();
                //connection.close();
               
                //RequestDispatcher rDispatcher = request.getRequestDispatcher(Value.SERVLET_MOVIE_DETAILS);
                //rDispatcher.forward(request, response);
                response.sendRedirect("movie.jsp");
            } catch (Exception exc) {
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
