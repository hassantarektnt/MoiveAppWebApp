/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

/**
 *
 * @author ACali
 */
public class Value {
    public static final String DATABASE_URL = "jdbc:mysql://localhost:3306/moviedb";
    public static final String DATABASE_USERNAME = "root";
    public static final String DATABASE_PASSWORD = "371995";
    public static final String SERVLET_EDIT_MOVIE = "/EditMovieServlet";
    public static final String SERVLET_MOVIE_DETAILS = "/clickMovie";
    public static final String JSP_MOVIE = "movie.jsp";
    public static final String ATTRIBUTE_CURRENT_MOVIE = "attr_current_movie";
    public static final String ATTRIBUTE_USER_EMAIL = "attr_user_email";
    public static final String ATTRIBUTE_CURRENT_RENT = "attr_current_rent";
    public static final String ATTRIBUTE_CURRENT_USER = "currentUser";
    
    public static final String TABLE_MOVIE_ID = "MovieId";
    public static final String TABLE_MOVIE_NAME = "Name";
    public static final String TABLE_MOVIE_YEAR = "Year";
    public static final String TABLE_MOVIE_MAIN_ACTOR = "MainActor";
    public static final String TABLE_MOVIE_MAIN_ACTRESS = "MainActress";
    public static final String TABLE_MOVIE_POSTER_URL = "PosterUrl";
    public static final String TABLE_MOVIE_BACKDROP_PATH = "BackdropPath";
    public static final String TABLE_MOVIE_OVERVIEW = "Overview";
    public static final String TABLE_MOVIE_RATE = "Rate";
    public static final String TABLE_MOVIE_PRICE = "Price";
    public static final String TABLE_MOVIE_NUM_OF_COPIES = "NumOfCopies";
    
    public static final String TABLE_RENT_USER_EMAIL = "UserEmail";
    public static final String TABLE_RENT_MOVIE_ID = "MovieMovieId";
    public static final String TABLE_RENT_DUE_DATE = "DueDate";
    public static final String TABLE_RENT_STATE = "State";
    
    public static Movie currentMovie;
}
