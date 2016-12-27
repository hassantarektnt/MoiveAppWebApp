<%-- 
    Document   : RentedMovieInformation
    Created on : Dec 26, 2016, 1:16:21 PM
    Author     : hassan
--%>

<%@page import="Models.rentedMovie"%>
<%@page import="java.util.ArrayList"%>
<%
    int x = Integer.valueOf(request.getParameter("id"));
    session.setAttribute("index", x);
%> 


<table>
    <tr>
        <td><span class="glyphicon glyphicon-film"></span> </td>
        <td>&nbsp;Name</td>
        <td>
            <%
                ArrayList<rentedMovie> myMovies = (ArrayList<rentedMovie>) session.getAttribute("myMovies");
                out.print(myMovies.get(x).name);
            %>
        </td>
    </tr>
    <tr>
        <td><span class="glyphicon glyphicon-ok"></span> </td>
        <td>&nbsp;Status</td>
        <td>
            <%
                out.print(myMovies.get(x).status);
            %>
        </td>
    </tr>
    <tr>
        <td><span class="glyphicon glyphicon-calendar"></span> </td>
        <td>&nbsp;Return date</td>
        <td>
            <%
                out.print(myMovies.get(x).dueDate);
            %>
        </td>
    </tr>
</table>