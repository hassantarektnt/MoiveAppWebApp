<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initialscale=1">
    <title>Profile</title>
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
                    <li><a id="home" href="home.html"><span class="glyphicon glyphicon-home"></span>
                        Home</a></li>
                    <li class="my-active"><a id="profile" href="profile.html"><span class="glyphicon glyphicon glyphicon-user"></span>
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
                        <span class="glyphicon glyphicon-user">&nbsp;</span>
                        <strong>Personal Information</strong>
                        <div class="pull-right">
                            <button class="btn btn-default" data-toggle="modal" data-target="#edit-profile">
                                <span class="glyphicon glyphicon-edit"></span>
                                Edit
                            </button>
                        </div>
                    </h3>
                    <div class="col-md-offset-1">
                        <table>
                            <tr>
                                <td><span class="glyphicon glyphicon-user"></span> </td>
                                <td>&nbsp;Name</td>
                                <td>Ahmad Khalifa</td>
                            </tr>
                            <tr>
                                <td><span class="glyphicon glyphicon-envelope"></span> </td>
                                <td>&nbsp;Email</td>
                                <td>ahmad.khalifa795@gmail.com</td>
                            </tr>
                            <tr>
                                <td><span class="glyphicon glyphicon-heart-empty"></span> </td>
                                <td>&nbsp;Gender</td>
                                <td>Male</td>
                            </tr>
                            <tr>
                                <td><span class="glyphicon glyphicon-ok"></span> </td>
                                <td>&nbsp;Age</td>
                                <td>21</td>
                            </tr>
                        </table>
                    </div>
                    <h3 class="some-margin">
                        <span class="glyphicon glyphicon-film">&nbsp;</span>
                        <strong>Rented Movies</strong>
                        <div class="pull-right">
                        </div>
                    </h3>
                    <div>
                        <div>
                            <a href="" data-toggle="modal" data-target="#rent-info"><img class="poster" src="http://image.tmdb.org/t/p/w320/\/nHXiMnWUAUba2LZ0dFkNDVdvJ1o.jpg"></a>
                            <a href="" data-toggle="modal" data-target="#rent-info"><img class="poster" src="http://image.tmdb.org/t/p/w320/\/e1mjopzAS2KNsvpbpahQ1a6SkSn.jpg"></a>
                            <a href="" data-toggle="modal" data-target="#rent-info"><img class="poster" src="http://image.tmdb.org/t/p/w320/\/h6O5OE3ueRVdCc7V7cwTiQocI7D.jpg"></a>
                            <a href="" data-toggle="modal" data-target="#rent-info"><img class="poster" src="http://image.tmdb.org/t/p/w320/\/kqjL17yufvn9OVLyXYpvtyrFfak.jpg"></a>
                            <a href="" data-toggle="modal" data-target="#rent-info"><img class="poster" src="http://image.tmdb.org/t/p/w320/\/5N20rQURev5CNDcMjHVUZhpoCNC.jpg"></a>
                            <a href="" data-toggle="modal" data-target="#rent-info"><img class="poster" src="http://image.tmdb.org/t/p/w320/\/jjBgi2r5cRt36xF6iNUEhzscEcb.jpg"></a>
                            <a href="" data-toggle="modal" data-target="#rent-info"><img class="poster" src="http://image.tmdb.org/t/p/w320/\/mLrQMqyZgLeP8FrT5LCobKAiqmK.jpg"></a>
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

<div class="modal" id="edit-profile">
    <div class="modal-dialog modal-md black-border">
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" data-dismiss = "modal">
                    <span class="glyphicon glyphicon-remove-circle" ></span>
                </button>
                <h4 class="modal-title">
                    <span class="glyphicon glyphicon-edit" ></span>
                    Edit profile
                </h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <form onsubmit="setTimeout(function () { window.location.reload(); }, 10)" id="create-task-form">
                        <div class="input-group">
                            <span class="glyphicon input-group-addon glyphicon-user" ></span>
                            <input type="text" name="name" class="form-control X" placeholder="Name..." required autofocus />
                        </div>
                        <div class="input-group">
                            <span class="glyphicon input-group-addon glyphicon glyphicon-ok" ></span>
                            <input type="number" name="age" class="form-control X" placeholder="Age..." required />
                        </div>
                        <div class="input-group">
                            <span class="glyphicon input-group-addon glyphicon glyphicon-heart-empty" ></span>
                            <select class="form-control X" required>
                                <option>Male</option>
                                <option>Female</option>
                            </select>
                        </div>
                        <div class="input-group">
                            <span class="glyphicon input-group-addon glyphicon-envelope"></span>
                            <input type="email" name="email" class="form-control X" placeholder="Email..." disabled/>
                        </div>
                        <div class="input-group">
                            <span class="glyphicon input-group-addon glyphicon-ok"></span>
                            <input type="password" name="password" class="form-control X" placeholder="Password..." required/>
                        </div>
                    </form>
                </div>
            </div>
            <div class = "modal-footer" >
                <button class="btn btn-default" type="submit" form="create-task-form">
                    <span class="glyphicon glyphicon-edit"></span>
                    Edit</button>
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

<div class="modal" id="extend">
    <div class="modal-dialog modal-md black-border">
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" data-dismiss = "modal">
                    <span class="glyphicon glyphicon-remove-circle" ></span>
                </button>
                <h4 class="modal-title">
                    <span class="glyphicon glyphicon-film" ></span>
                    Extend rent</h4>
            </div>
            <div class="modal-body">
                <table>
                    <tr>
                        <td><span class="glyphicon glyphicon-film"></span> </td>
                        <td>&nbsp;Name</td>
                        <td>Sully</td>
                    </tr>
                </table>
                <div class="form-group">
                    <form onsubmit="setTimeout(function () { window.location.reload(); }, 10)" id="extend-rent-form">
                        <div class="input-group">
                                    <span class="glyphicon input-group-addon glyphicon-envelope parent-label" >
                                         <span class="my-label">Return date</span>
                                    </span>
                            <input type="date" required class="form-control X"  autofocus/>
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-default" type="submit" form="extend-rent-form">
                    <span class="glyphicon glyphicon-ok"></span>
                    Extend</button>
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