/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

/**
 *
 * @author khaled
 */
public class Rent {
    //Statics 
    public static final String RENT_MOVIE_ID = "movie_id";
    public static final String RENT_USER_EMAIL = "user_email";
    public static final String RENT_DUE_DATE = "due_date";    
    public static final String STATUS_NOT_RENTED = "0";
    public static final String STATUS_RENTED = "1";
    
    
    public String userEmail;
    public String dueDate;
    public String state;
    public String movieName;
    public int movieId;
    public String userName;

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
    public String getDueDate() {
        return dueDate;
    }

    public void setDueDate(String dueDate) {
        this.dueDate = dueDate;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getMovieName() {
        return movieName;
    }

    public void setMovieName(String movieName) {
        this.movieName = movieName;
    }

    public int getMovieId() {
        return movieId;
    }

    public void setMovieId(int movieId) {
        this.movieId = movieId;
    }
}
