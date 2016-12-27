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
public class Movie {
    //Statics 
    public static final String MOVIE_ID = "movie_id";
    public static final String MOVIE_NAME = "movie_name";
    public static final String MOVIE_YEAR = "movie_year";
    public static final String MOVIE_MAIN_ACTOR = "movie_main_actor";
    public static final String MOVIE_MAIN_ACTRESS = "movie_main_actress";
    public static final String MOVIE_RATE = "movie_rate";
    public static final String MOVIE_PRICE = "movie_price";
    public static final String MOVIE_COPIES = "movie_copies";
    public static final String MOVIE_POSTER = "movie_poster";
    public static final String MOVIE_BACKDROP = "movie_backdrop";
    public static final String MOVIE_OVERVIEW = "movie_overview";
    
    public int Id;
    public String name ;
    public int year; 
    public String mainActor;
    public String mainActress;
    public String posterUrl  ;
    public String backdropPath;
    public String overview ;
    public String rate;
    public int price;
    public int numOfCopies;
public Movie(){
    
}
public Movie (int id ,
        String name ,
        int year ,
        String mainActor ,
        String mainActress ,
        String posterURL ,
        String back ,
        String overView ,
        String rate ,
        int price,
        int numCopies ) {
        
        this.Id=id ;
        this.name = name ;
        this.year = year ;
        this.mainActor = mainActor ;
        this.mainActress = mainActress ;
        this.numOfCopies = numCopies ;
        this.posterUrl = posterURL ;
        this.backdropPath = back ;
        this.overview = overView ;
        this.rate = rate ;
        this.price = price ;
        
    }
    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public String getMainActor() {
        return mainActor;
    }

    public void setMainActor(String mainActor) {
        this.mainActor = mainActor;
    }

    public String getMainActress() {
        return mainActress;
    }

    public void setMainActress(String mainActress) {
        this.mainActress = mainActress;
    }

    public String getPosterUrl() {
        return posterUrl;
    }

    public void setPosterUrl(String posterUrl) {
        this.posterUrl = posterUrl;
    }

    public String getBackdropPath() {
        return backdropPath;
    }

    public void setBackdropPath(String backdropPath) {
        this.backdropPath = backdropPath;
    }

    public String getOverview() {
        return overview;
    }

    public void setOverview(String overview) {
        this.overview = overview;
    }

    public String getRate() {
        return rate;
    }

    public void setRate(String rate) {
        this.rate = rate;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getNumOfCopies() {
        return numOfCopies;
    }

    public void setNumOfCopies(int numOfCopies) {
        this.numOfCopies = numOfCopies;
    }
    
    
}
