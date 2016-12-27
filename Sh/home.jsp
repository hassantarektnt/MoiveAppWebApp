<%@page import="java.util.HashMap"%>
<%@page import="Models.Movie"%>
<%@page import="Models.Movie"%>
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
    
       <script type="text/javascript">
            function process () {
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.open("GET", "loadData?", true);
                xmlhttp.send();
                xmlhttp.onreadystatechange = function ()
                {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                    {
                        var x = xmlhttp.responseText;
                        var arr = [] ;
                        arr =x.split(".jpg");
                        var a = "" ;
                        for (var i = 0 ; i < arr.length-1 ; i++){
                            var post = arr[i] ;
                            arr[i]=arr[i].replace("img/", "") ;
                            a+="<a href='movie.jsp' onclick = 'imageClick(\" "+(arr[i])+"\")'> <img class='poster' src='"+post+".jpg"+"'></a>"  ;	
                            }
                            //alert(a) ;
                        document.getElementById("link").innerHTML = a
                    }
                }
                
             }
             
        function imageClick(name) {
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.open("GET", "clickMovie?moviename="+name, false);
                xmlhttp.send();
        }
        
        function search() {

            var name = document.getElementById("moviename").value;
            var xmlhttp = new XMLHttpRequest();
            xmlhttp.open("GET", "searchMovie?name=" + name, false);
            xmlhttp.send();
            var name = xmlhttp.responseText ;
            name=name.replace(".jpg", "") ;
            name=name.replace("img/", "") ;
            //alert(name) ;
            var img = "<a href='movie.jsp' onclick = 'imageClick(\" "+name+"\")'> <img class='poster' src='"+xmlhttp.responseText+"'></a>"  ;
            if (name == "" ) img = "" ;
            document.getElementById("link").innerHTML = img;             
        }
        
        function filter () {
            var keyword = document.getElementById("keyword").value;
            var selector = document.getElementById("selector").value;
            if (keyword == "" )
                alert("Please enter keyword") ;
            var xmlhttp = new XMLHttpRequest();
            xmlhttp.open("GET", "filterMovie?keyword=" + keyword+"&selector="+selector, false) ;
            xmlhttp.send();
            var x = xmlhttp.responseText;
            var arr = [] ;
	    arr =x.split(".jpg");
	    var a = "" ;
		for (var i = 0 ; i < arr.length-1 ; i++){
                    var post = arr[i] ;
                    arr[i]=arr[i].replace("img/", "") ;
                    
		a+="<a href='movie.jsp' onclick = 'imageClick(\" "+(arr[i])+"\")'> <img class='poster' src='"+post+".jpg"+"'></a>"  ;	
		}
                //alert(a) ;
            document.getElementById("link").innerHTML = a
            
        } 
        
       </script>

</head>
<body onload="process()">
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
                    <li class="my-active"><a id="home" href="home.jsp"><span class="glyphicon glyphicon-home"></span>
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
                            <input type="text" id="moviename" class="form-control X search-field" placeholder="Find a movie..." required />
                           <!-- <button class="btn btn-default"  onclick="search()"type="submit" >
                                &nbsp;<span class="glyphicon glyphicon-search"></span>&nbsp;</button>-->
                           <input type="button" class="btn btn-default" onclick="search()" >
                        </form>
                    </h3>

                    <div>
                        
                     
                        <div id = "link">
                              

                           
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
                            <input type="text" name="age" id ="keyword" class="form-control X" placeholder="Keyword..." required />
                        </div>
                        <div class="input-group">
                            <span class="glyphicon input-group-addon glyphicon-ok" ></span>
                            <select id = "selector"class="form-control X" required>
                                <option>Year</option>
                                <option>Actor</option>
                                <option>Actress</option>
                            </select>
                        </div>
                    </form>
                </div>
            </div>
            
            
            <div class="modal-footer">
                <button onclick="filter()" class="btn btn-default" type="submit" >
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