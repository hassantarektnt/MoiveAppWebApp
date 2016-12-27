/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Movie;

import Models.CurrentUser;
import static Movie.SignupServlet.getConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
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
@WebServlet(name = "editProfileInformation", urlPatterns = {"/editProfileInformation"})
public class editProfileInformation extends HttpServlet {

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
        //take data updated in session and update it in data base
        HttpSession session = request.getSession();
        CurrentUser currentUser;
        currentUser = (CurrentUser) session.getAttribute("currentUser");
        String name = request.getParameter("name");
        String age = request.getParameter("age");
        String gender;
        if (request.getParameter("gender").equals("Male")) {
            gender = "M";
        } else {
            gender = "F";
        }
        String password = request.getParameter("password");
        String email = currentUser.email;
        int id = currentUser.userId;

        currentUser.age = age;
        currentUser.name = name;
        currentUser.gender = gender;

        session.setAttribute("currentUser", currentUser);

        Connection connection = getConnection();
        String updateStatement = "UPDATE moviedb.User"
                + "        SET Name='" + name + "',Age='" + age + "', Gender='" + gender
                + "',Password='" + password + "'"
                + "        WHERE UserId=" + id + " ;";

        PreparedStatement preparedStatement = connection.prepareStatement(updateStatement, Statement.RETURN_GENERATED_KEYS);
        preparedStatement.execute();

        /*
        //sql statement to update profiel info  
        UPDATE moviedb.User
        SET Name='shit',Age='21', Gender='M',Password='12'
        WHERE UserId=1;
         */
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
            Logger.getLogger(editProfileInformation.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(editProfileInformation.class.getName()).log(Level.SEVERE, null, ex);
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
