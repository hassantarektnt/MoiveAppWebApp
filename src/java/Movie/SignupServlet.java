package Movie;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import Models.CurrentUser;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
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
@WebServlet(urlPatterns = {"/SignupServlet"})
public class SignupServlet extends HttpServlet {

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

        String name = request.getParameter("name");
        String age = request.getParameter("age");
        String gender;
        if (request.getParameter("gender").equals("Male")) {
            gender = "M";
        } else {
            gender = "F";
        }
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Connection connection = getConnection();
        if (connection == null) {
            processRequest(request, response);
            return;
        }

        ResultSet result = null;
        PreparedStatement preparedStatement = null;

        String selectStatment = "select email from user";
        try {
            preparedStatement = connection.prepareStatement(selectStatment, Statement.RETURN_GENERATED_KEYS);
        } catch (SQLException ex) {
            Logger.getLogger(SignupServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        result = preparedStatement.executeQuery();
        List<String> emailsList = new ArrayList<String>();
        while (result.next()) {
            emailsList.add(result.getString("email"));
        }
        if (emailsList.contains(email) == false) {
            //email doesn't exist

            CurrentUser currentUser = new CurrentUser();
            String sqlNewUser = "Insert into moviedb.User (`Email`,`Name`,`Age`,`Gender`,`Password`, `Type`) VALUES  (?,?,?,?,?,?) ";
            preparedStatement = connection.prepareStatement(sqlNewUser, Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, name);
            preparedStatement.setString(3, age);
            preparedStatement.setString(4, gender);
            preparedStatement.setString(5, password);
            preparedStatement.setString(6, "0");
            preparedStatement.executeUpdate();
            ////////////////////////////////////////////////////////////////////////          

            currentUser.name = name;
            currentUser.email = email;
            currentUser.type = "0";
            currentUser.age= age;
            currentUser.gender =gender;

            PreparedStatement statement = connection.prepareStatement("select userId from user where Email = ?");
            statement.setString(1, email);
            ResultSet resultSet = statement.executeQuery();
            resultSet.next();
            currentUser.userId = resultSet.getInt("userId");

            ////////////////////////////////////////////////////////////////////////          
            HttpSession session = request.getSession();
            session.setAttribute("currentUser", currentUser);

            response.sendRedirect("home.jsp");

        } else {
            String errorMessage = "Email Already Exists , Enter Another Email";
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
            Logger.getLogger(SignupServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(SignupServlet.class.getName()).log(Level.SEVERE, null, ex);
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
