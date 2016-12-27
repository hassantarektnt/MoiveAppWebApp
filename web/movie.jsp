<%@page import="Models.CurrentUser"%>
<%@page import="Models.Movie"%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initialscale=1">
    <title>Movie Details</title>
    <script type="text/javascript" src="js/jquery.js"></script>
    <!-- Bootstrap -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files
    as needed -->
    <script src="js/bootstrap.min.js"></script>
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/styles.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5
    elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the
    page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/
    3.7.0/html5shiv.js"></script>

    <script src="https://oss.maxcdn.com/libs/respond.js/
    1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>
<div class="navbar navbar-default navbar-top-fixed" id="myNav">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a href="home.html" class="navbar-brand">Movie Night</a>
            <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li><a id="home" href="home.jsp"><span class="glyphicon glyphicon-home"></span>
                        Home</a></li>
                    <li><a id="profile" href="profile.jsp"><span class="glyphicon glyphicon glyphicon-user"></span>
                        Profile</a></li>
                    <li><a id="admin" href="admin.jsp"><span class="glyphicon glyphicon glyphicon-cog"></span>
                        Admin</a></li>
                    <li><a id="logout" href="" data-toggle="modal" data-target="#signOut"><span class="glyphicon glyphicon-log-out"></span>
                        Logout</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<%!Movie movie ;%>
<%!CurrentUser user; %>
        <% movie = (Movie) request.getSession().getAttribute("clickedmovie") ; %>
        <% user = (CurrentUser) request.getSession().getAttribute("currentUser"); ;%>
        <% session.setAttribute("rentEmail", user.email);
        session.setAttribute("rentMId", movie.Id);%>
<div class="container">
    <div class="row">
        <div class="col-md-0"></div>
        <div class="col-md-12">
            <div class="parent homeContainer">
                <div class="child">
                    <div class="left-div">
                        <h3 class="some-margin">
                            <span class="glyphicon glyphicon-film">&nbsp;</span>
                            <strong><%=movie.getName()%></strong>
                            <div class="pull-right">
                                <button class="btn btn-success" data-toggle="modal" data-target="#rent">
                                    <span class="glyphicon glyphicon-film"></span>
                                    Rent
                                </button>
                                <button class="btn btn-default" data-toggle="modal" data-target="#edit-movie">
                                    <span class="glyphicon glyphicon-edit"></span>
                                    Edit
                                </button>
                            </div>
                        </h3>
                        <div class="col-md-offset-1">
                            <table>
                                <tr>
                                    <td><span class="glyphicon glyphicon-film"></span> </td>
                                    <td>&nbsp;</td>
                                    <td><%=movie.getName()%></td>
                                </tr>
                                <tr>
                                    <td><span class="glyphicon glyphicon-calendar"></span> </td>
                                    <td>&nbsp;Year</td>
                                    <td><%=movie.getYear()%></td>
                                </tr>
                                <tr>
                                    <td><span class="glyphicon glyphicon-user"></span> </td>
                                    <td>&nbsp;Main actor</td>
                                    <td><%=movie.getMainActor()%></td>
                                </tr>
                                <tr>
                                    <td><span class="glyphicon glyphicon-user"></span> </td>
                                    <td>&nbsp;Main actress</td>
                                    <td><%=movie.getMainActress()%></td>
                                </tr>
                                <tr>
                                    <td><span class="glyphicon glyphicon-star-empty"></span> </td>
                                    <td>&nbsp;Rate</td>
                                    <td><%=movie.getRate()%>/5.0</td>
                                </tr>
                                <tr>
                                    <td><span class="glyphicon glyphicon-usd"></span> </td>
                                    <td>&nbsp;Price</td>
                                    <td><%=movie.getPrice()%></td>
                                </tr>
                                <tr>
                                    <td><span class="glyphicon glyphicon-cd"></span> </td>
                                    <td>&nbsp;No. of copies</td>
                                    <td><%=movie.getNumOfCopies()%></td>
                                </tr>
                                <tr>
                                    <td><span class="glyphicon glyphicon-pencil"></span> </td>
                                    <td>&nbsp;Overview</td>
                                    <td><%=movie.getOverview()%></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="right-div">
                        <img class="pull-right details-poster" src="<%=movie.getPosterUrl()%>">
                    </div>

                </div>
            </div>
        </div>
    </div>
    <div class="col-md-2"></div>
</div>


<!------------------------------------------------------------------------------>

<div class="modal" id="signOut">
    <div class="modal-dialog modal-sm black-border">
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" data-dismiss = "modal">
                    <span class="glyphicon glyphicon-remove-circle" ></span>
                </button>
                <h4 class="modal-title"><span class="glyphicon glyphicon-log-out"></span>
                    Sign out</h4>
            </div>
            <div class="modal-body">
                <h3>Are you sure?</h3>
            </div>
            <div class="modal-footer">
                <button class="btn btn-default" onclick="location.href='welcome.html'"><span class="glyphicon glyphicon-ok"></span>
                    Yes</button>
                <button class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span>
                    No</button>
            </div>
        </div>
    </div>
</div>

<div class="modal" id="done">
    <div class="modal-dialog modal-sm black-border">
        <div class="modal-content">
            <div class="modal-body">
                <h3>
                    <span class="glyphicon glyphicon-thumbs-up"></span>
                    Done...</h3>
            </div>
            <div class="modal-footer">
                <button class="btn btn-default" data-dismiss="modal">
                    <span class="glyphicon glyphicon-ok"></span>
                    Ok</button>
            </div>
        </div>
    </div>
</div>

<div class="modal" id="rent-info">
    <div class="modal-dialog modal-sm black-border">
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" data-dismiss = "modal">
                    <span class="glyphicon glyphicon-remove-circle" ></span>
                </button>
                <h4 class="modal-title">
                    <span class="glyphicon glyphicon-film" ></span>
                    Rent details
                </h4>
            </div>
            <div class="modal-body">
                <div class="col-md-offset-1">
                    <table>
                        <tr>
                            <td><span class="glyphicon glyphicon-film"></span> </td>
                            <td>&nbsp;Name</td>
                            <td>Sully</td>
                        </tr>
                        <tr>
                            <td><span class="glyphicon glyphicon-ok"></span> </td>
                            <td>&nbsp;Status</td>
                            <td>rented</td>
                        </tr>
                        <tr>
                            <td><span class="glyphicon glyphicon-calendar"></span> </td>
                            <td>&nbsp;Return date</td>
                            <td>December 31th, 2016</td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-danger" data-dismiss="modal" data-toggle="modal" data-target="#done">
                    <span class="glyphicon glyphicon-remove"></span>
                    Return</button>
                <button class="btn btn-success" data-dismiss="modal" data-toggle="modal" data-target="#extend">
                    <span class="glyphicon glyphicon-retweet"></span>
                    Extend</button>
                <button class="btn btn-default" data-dismiss="modal">
                    <span class="glyphicon glyphicon-ok"></span>
                    Ok</button>
            </div>
        </div>
    </div>
</div>

<div class="modal" id="rent">
    <div class="modal-dialog modal-md black-border">
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" data-dismiss = "modal">
                    <span class="glyphicon glyphicon-remove-circle" ></span>
                </button>
                <h4 class="modal-title">
                    <span class="glyphicon glyphicon-film" ></span>
                    Rent</h4>
            </div>
            <div class="modal-body">
                <table>
                    <tr>
                        <td><span class="glyphicon glyphicon-film"></span> </td>
                        <td>&nbsp;Name</td>
                        <td><%= movie.name%></td>
                        
                    </tr>
                </table>
                <div class="form-group">
                    <form onsubmit="setTimeout(function () { window.location.reload(); }, 10)" id="extend-rent-form" action="RentServlet">   
                        <div class="input-group">
                                    <span class="glyphicon input-group-addon glyphicon-envelope parent-label" >
                                         <span class="my-label">Return date</span>
                                    </span>
                            <input type="date" required class="form-control X" name="due_date"  autofocus/>
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-default" type="submit" form="extend-rent-form">
                    <span class="glyphicon glyphicon-ok"></span>
                    Rent</button>
            </div>
        </div>
    </div>
</div>

<div class="modal" id="edit-movie">
    <div class="modal-dialog modal-md black-border">
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" data-dismiss = "modal">
                    <span class="glyphicon glyphicon-remove-circle" ></span>
                </button>
                <h4 class="modal-title">
                    <span class="glyphicon glyphicon-edit" ></span>
                    Edit Movie
                </h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <form method='post' action="EditMovieServlet" id="edit-movie-form">
                        <div class="input-group">
                            <span class="glyphicon input-group-addon glyphicon-film" ></span>
                            <input type="text" class="form-control X" name="movie_name" placeholder="Name..." value="<%=movie.name%>" required/>
                        </div>
                        <div class="input-group">
                            <span class="glyphicon input-group-addon glyphicon-calendar" ></span>
                            <input type="number" class="form-control X" name="movie_year" placeholder="Year..." value="<%=movie.year%>" required/>
                        </div>
                        <div class="input-group">
                            <span class="glyphicon input-group-addon glyphicon-user" ></span>
                            <input type="text" class="form-control X" name="movie_main_actor" placeholder="Main actor..." value="<%=movie.mainActor%>" required/>
                        </div>
                        <div class="input-group">
                            <span class="glyphicon input-group-addon glyphicon-user" ></span>
                            <input type="text" class="form-control X" name="movie_main_actress" placeholder="Main actress..." value="<%=movie.mainActress%>" required/>
                        </div>
                        <div class="input-group">
                            <span class="glyphicon input-group-addon glyphicon-star-empty" ></span>
                            <input type="number" class="form-control X" name="movie_rate" placeholder="Rate..." value="<%=movie.rate%>" required/>
                        </div>
                        <div class="input-group">
                            <span class="glyphicon input-group-addon glyphicon-usd" ></span>
                            <input type="number" class="form-control X" name="movie_price" placeholder="Price..." value="<%=movie.price%>" required/>
                        </div>
                        <div class="input-group">
                            <span class="glyphicon input-group-addon glyphicon-cd" ></span>
                            <input type="number" class="form-control X" name="movie_copies" placeholder="Num of copies..." value="<%=movie.getNumOfCopies()%>" required/>
                        </div>
                        <div class="input-group">
                            <span class="glyphicon input-group-addon glyphicon-link" ></span>
                            <input type="text" class="form-control X" name="movie_poster" placeholder="Poster URL..." value="<%=movie.getPosterUrl()%>" required/>
                        </div>
                        <d
                        <div class="input-group">
                            <span class="glyphicon input-group-addon glyphicon-pencil" ></span>
                            <textarea class="high" name="movie_overview" required placeholder="Overview..."><%=movie.overview%></textarea>
                        </div>
                        <input type='hidden' name="movie_id" value="<%=movie.getId()%>">
                    </form>
                </div>
            </div>
            <div class = "modal-footer" >
                <button class="btn btn-default" type="submit" form="edit-movie-form">
                    <span class="glyphicon glyphicon-edit"></span>
                    Edit</button>
            </div>
        </div>
    </div>
</div>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->


<!------------------------------------------------------------------------------>

<script type="text/javascript">
    $("mainContainer").css("height", $(window).height());
</script>
</body>
</html>