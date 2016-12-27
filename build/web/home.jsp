<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initialscale=1">
    <title>Home</title>
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
                    <li class="my-active"><a id="home" href="home.html"><span class="glyphicon glyphicon-home"></span>
                        Home</a></li>
                    <li><a id="profile" href="profile.html"><span class="glyphicon glyphicon glyphicon-user"></span>
                        Profile</a></li>
                    <li><a id="admin" href="admin.html"><span class="glyphicon glyphicon glyphicon-cog"></span>
                        Admin</a></li>
                    <li><a id="logout" href="" data-toggle="modal" data-target="#signOut"><span class="glyphicon glyphicon-log-out"></span>
                        Logout</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>

<div class="container ">
    <div class="row">
        <div class="col-md-0"></div>
        <div class="col-md-12">
            <div class="parent homeContainer">
                <div class="child">
                    <h3 class="some-margin">
                        <span class="glyphicon glyphicon-film">&nbsp;</span>
                        <strong>All Movies&nbsp;&nbsp;</strong>
                        <button class="btn btn-default" data-toggle="modal" data-target="#filter">
                            <span class="glyphicon glyphicon glyphicon-filter"></span>
                            Filter
                        </button>
                        <form class="pull-right form-inline" id="search-form">
                            <input type="text" name="age" class="form-control X search-field" placeholder="Find a movie..." required />
                            <button class="btn btn-default" type="submit" form="search-form">
                                &nbsp;<span class="glyphicon glyphicon-search"></span>&nbsp;</button>
                        </form>
                    </h3>

                    <div>
                        <div>
                             <a href="movie.html"><img class="poster" src="http://image.tmdb.org/t/p/w320/\/nHXiMnWUAUba2LZ0dFkNDVdvJ1o.jpg"></a>
                             <a href="movie.html"><img class="poster" src="http://image.tmdb.org/t/p/w320/\/e1mjopzAS2KNsvpbpahQ1a6SkSn.jpg"></a>
                             <a href="movie.html"><img class="poster" src="http://image.tmdb.org/t/p/w320/\/z09QAf8WbZncbitewNk6lKYMZsh.jpg"></a>
                             <a href="movie.html"><img class="poster" src="http://image.tmdb.org/t/p/w320/\/h6O5OE3ueRVdCc7V7cwTiQocI7D.jpg"></a>
                             <a href="movie.html"><img class="poster" src="http://image.tmdb.org/t/p/w320/\/gri0DDxsERr6B2sOR1fGLxLpSLx.jpg"></a>
                             <a href="movie.html"><img class="poster" src="http://image.tmdb.org/t/p/w320/\/u7igWoek5Xckz7mkIorYE5pMusI.jpg"></a>
                             <a href="movie.html"><img class="poster" src="http://image.tmdb.org/t/p/w320/\/vR9YvUJCead23MOWwVzv9776eb1.jpg"></a>
                             <a href="movie.html"><img class="poster" src="http://image.tmdb.org/t/p/w320/\/lFSSLTlFozwpaGlO31OoUeirBgQ.jpg"></a>
                             <a href="movie.html"><img class="poster" src="http://image.tmdb.org/t/p/w320/\/kqjL17yufvn9OVLyXYpvtyrFfak.jpg"></a>
                             <a href="movie.html"><img class="poster" src="http://image.tmdb.org/t/p/w320/\/5N20rQURev5CNDcMjHVUZhpoCNC.jpg"></a>
                             <a href="movie.html"><img class="poster" src="http://image.tmdb.org/t/p/w320/\/nBNZadXqJSdt05SHLqgT0HuC5Gm.jpg"></a>
                             <a href="movie.html"><img class="poster" src="http://image.tmdb.org/t/p/w320/\/WLQN5aiQG8wc9SeKwixW7pAR8K.jpg"></a>
                             <a href="movie.html"><img class="poster" src="http://image.tmdb.org/t/p/w320/\/6w1VjTPTjTaA5oNvsAg0y4H6bou.jpg"></a>
                             <a href="movie.html"><img class="poster" src="http://image.tmdb.org/t/p/w320/\/z4x0Bp48ar3Mda8KiPD1vwSY3D8.jpg"></a>
                             <a href="movie.html"><img class="poster" src="http://image.tmdb.org/t/p/w320/\/jjBgi2r5cRt36xF6iNUEhzscEcb.jpg"></a>
                             <a href="movie.html"><img class="poster" src="http://image.tmdb.org/t/p/w320/\/mLrQMqyZgLeP8FrT5LCobKAiqmK.jpg"></a>
                             <a href="movie.html"><img class="poster" src="http://image.tmdb.org/t/p/w320/\/gj282Pniaa78ZJfbaixyLXnXEDI.jpg"></a>
                             <a href="movie.html"><img class="poster" src="http://image.tmdb.org/t/p/w320/\/rdkxl5iXdpVU188cL1LLG3sy6z4.jpg"></a>
                             <a href="movie.html"><img class="poster" src="http://image.tmdb.org/t/p/w320/\/9O7gLzmreU0nGkIB6K3BsJbzvNv.jpg"></a>
                             <a href="movie.html"><img class="poster" src="http://image.tmdb.org/t/p/w320/\/jLRllZsubY8UWpeMyDLVXdRyEWi.jpg"></a>
                        </div>
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
                <button class="btn btn-default" onclick="location.href='signoutServlet'"><span class="glyphicon glyphicon-ok"></span>
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

<div class="modal" id="filter">
    <div class="modal-dialog modal-md black-border">
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" data-dismiss = "modal">
                    <span class="glyphicon glyphicon-remove-circle" ></span>
                </button>
                <h4 class="modal-title">
                    <span class="glyphicon glyphicon-filter" ></span>
                    Filter</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <form onsubmit="setTimeout(function () { window.location.reload(); }, 10)" id="new-member-form">
                        <div class="input-group">
                            <span class="glyphicon input-group-addon glyphicon glyphicon-pencil" ></span>
                            <input type="text" name="age" class="form-control X" placeholder="Keyword..." required />
                        </div>
                        <div class="input-group">
                            <span class="glyphicon input-group-addon glyphicon-ok" ></span>
                            <select class="form-control X" required>
                                <option>Name</option>
                                <option>Year</option>
                                <option>Actor</option>
                                <option>Actress</option>
                            </select>
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-default" type="submit" form="new-member-form">
                    <span class="glyphicon glyphicon-filter"></span>
                    Filter</button>
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