package Models;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Sherif
 */
public class Movie {
    public int id ;
    public String name ;
    public int year ;
    public String mainActor ;
    public String mainActress ;
    public String posterURL ;
    public String back ;
    public String overView ;
    public String rate ;
    public int price;
    public int numCopies ;
    
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
        
        this.id=id ;
        this.name = name ;
        this.year = year ;
        this.mainActor = mainActor ;
        this.mainActress = mainActress ;
        this.numCopies = numCopies ;
        this.posterURL = posterURL ;
        this.back = back ;
        this.overView = overView ;
        this.rate = rate ;
        this.price = price ;
        
    }
    
    
    
    
}
