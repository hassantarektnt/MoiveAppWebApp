/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Movie;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author khaled
 */
@WebServlet(name = "AddMovie", urlPatterns = {"/AddMovie"})
public class AddMovie extends HttpServlet {

    public static Connection connection = null;

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager
                    .getConnection("jdbc:mysql://localhost:3306/moviedb?"
                            + "user=root&password=371995&characterEncoding=utf8");
            return connection;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        Connection conn = getConnection();
        String SQL_QUERY="Insert Into Movie(`Name` , `Year` , `MainActor`,`MainActress`,`PosterUrl` , `BackdropPath` ,"
                + "`Overview` ,`Rate`,`Price` , `NumOfCopies`) "
                + " Values(? , ? , ? , ? , ? , ? , ? , ? , ? , ?);";
        PreparedStatement statement = conn.prepareStatement( SQL_QUERY,Statement.RETURN_GENERATED_KEYS);
        statement.setString(1, request.getParameter("MName"));
        statement.setInt(2, Integer.parseInt(request.getParameter("MYear")));
        statement.setString(3, request.getParameter("MMainActor"));
        statement.setString(4, request.getParameter("MMainActress"));
        statement.setString(5, request.getParameter("MPoster"));
        statement.setString(6, request.getParameter("MBackdrop"));
        statement.setString(7, request.getParameter("MOverview"));
        statement.setString(8, request.getParameter("MRate"));
        statement.setInt(9, Integer.parseInt(request.getParameter("MPrice")));
        statement.setInt(10, Integer.parseInt(request.getParameter("MCopy")));
        
        
        
        statement.executeUpdate();
        //Movie movie = new Movie();
        
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(AddMovie.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(AddMovie.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
