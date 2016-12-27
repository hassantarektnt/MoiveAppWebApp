<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initialscale=1">
    <title>Movie Night</title>
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
            <a href="welcome.html" class="navbar-brand">Movie Night</a>
        </div>
        <div class="collapse navbar-collapse">
            <form class="navbar-form navbar-right" action="SigninServlet" method="Post">
                <div class="form-group">
                    <input type="email" name="email" placeholder="E-Mail..." class="form-control" required autofocus/>
                </div>
                <div class="form-group">
                    <input type="password" name="password" placeholder="Password..." class="form-control" required/>
                </div>
                <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-log-in"></span>
                    Sign in</button>
            </form>
        </div>
    </div>
</div>
<div class="container center">
    <div class="row">
        <div class="col-md-6 col-md-offset-3 welcomeContainer">
            <h1 id="logo">Movie Night</h1>
            <p class="lead welcome-lead">
                With Movie Night, you can find your favorite movies among all categories, rent them in no time, end even more...
                <br><br>
                <strong>interested?</strong> Join us now..
            </p>
            <div class="form-group col-md-8 col-md-offset-2">
                <form action="SignupServlet"  method="post">
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
                        <select name="gender" class="form-control X" required >
                            <option>Male</option>
                            <option>Female</option>
                        </select>
                    </div>
                    <div class="input-group">
                        <span class="glyphicon input-group-addon glyphicon-envelope"></span>
                        <input type="email" name="email" class="form-control X" placeholder="Email..." required/>
                    </div>
                    <div class="input-group">
                        <span class="glyphicon input-group-addon glyphicon-ok"></span>
                        <input type="password" name="password" class="form-control X" placeholder="Password..." required/>
                    </div>
                    <button class="btn btn-default btn-lg margin-top" ><span class="glyphicon glyphicon-collapse-up"></span>
                        Sign up</button>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal" id="error">
    <div class="modal-dialog modal-sm black-border">
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" data-dismiss = "modal">
                    <span class="glyphicon glyphicon-remove-circle" ></span>
                </button>
                <h4 class="modal-title"><span class="glyphicon glyphicon-log-out"></span>
                    Error Massage</h4>
            </div>
            <div class="modal-body">
                <h3>Are you sure?</h3>
            </div>
            <div class="modal-footer">
                <button class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span>
                    OK</button>
            </div>
        </div>
    </div>
</div>
<!------------------------------------------------------------------------------>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->

<script type="text/javascript">

</script>
<!------------------------------------------------------------------------------>

<script type="text/javascript">
    $("mainContainer").css("height", $(window).height());
</script>
</body>
</html>