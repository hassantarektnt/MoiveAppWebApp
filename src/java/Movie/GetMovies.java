/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Movie;

import Models.Rent;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.json.JsonArray;
import javax.json.JsonObject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author khaled
 */
public class GetMovies extends HttpServlet {

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
        Connection connection = getConnection();
        ResultSet resultSet = null;
        ArrayList<Rent> rents = new ArrayList<Rent>();
        PreparedStatement stmt = connection.prepareStatement("Select * from Rent");
        resultSet = stmt.executeQuery();
        while(resultSet.next()){
            Rent temp = new Rent();
            temp.setUserEmail(resultSet.getString(1));
            temp.setMovieId(resultSet.getInt(2));
            temp.setDueDate(resultSet.getString(3));
            temp.setState(resultSet.getString(4));
            PreparedStatement movieName = connection.prepareStatement("Select * from Movie Where MovieId = ?");
            movieName.setInt(1, temp.getMovieId());
            ResultSet set = movieName.executeQuery();
            while(set.next())
                temp.setMovieName(set.getString(2));
            
            PreparedStatement userName = connection.prepareStatement("Select * from User Where Email = ?");
            userName.setString(1, temp.getUserEmail());
            ResultSet nameSet = userName.executeQuery();
            while(nameSet.next())
                temp.setUserName(nameSet.getString(3));
            
            rents.add(temp);
        }
        response.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
        //response.setCharacterEncoding("UTF-8"); // You want world domination, huh?
        JSONArray jsonArray = new JSONArray() ;
        for (Rent x : rents){
            JSONObject object = new JSONObject() ; 
            object.put("Email", x.getUserEmail());
            object.put("DueDate", x.getDueDate());
            object.put("State", x.getState());
            object.put("Name", x.getUserName());
            object.put("MovieName", x.getMovieName());
            jsonArray.put(object);
            
        }
        
        response.getWriter().write(jsonArray.toString());      
        
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(GetMovies.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(GetMovies.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
