<%@page import="Models.CurrentUser"%>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initialscale=1">
        <title>Admin</title>
        <script type="text/javascript" src="js/jquery.js"></script>
        <!-- Bootstrap -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files
        as needed -->
        <script src="js/bootstrap.min.js"></script>
        <!-- get Movies Data -->
        <script type="text/javascript">
            function alertErrorAdmin() {
                alert("You Are not Authorized to view This Page !");
                window.location="home.jsp";
            }
            $(document).ready(function () {
                $.get("GetMovies", function (response) {
                    var jsonArray = JSON.parse(response);
                    loadTable("rent-table-id", ['MovieName', 'Name', 'Email', 'DueDate', 'State'], jsonArray);
                    //alert(jsonArray);
                });
            });
            function loadTable(tableId, fields, data) {
                var rows = '';
                $.each(data, function (index, item) {
                    var row = '<tr>';
                    $.each(fields, function (index, field) {


                        if (field === "State") {
                            var status = parseInt(item[field], 2);
                            if (status === 0) {
                                row += '<td>' + 'Late' + '</td>';
                                row += '<td>' + '<button' + 'id=\"send-email-button\" class=\"btn btn-default btn-sm\" data-toggle=\"modal\" data-target=\"#send-mail\"' + '>'
                                        + '<' + 'span class=\"glyphicon glyphicon-send\" style=\"visibility: visible\"' + '>' + '<' + '/span' + '>' +
                                        'Send Email'
                                        + '</button>' + '</td>' + '"';
                            } else {
                                row += '<td>' + 'Rented' + '</td>';
                            }
                        } else {
                            row += '<td>' + item[field] + '</td>';
                        }
                    });
                    rows += row + '<tr>';
                });

                $('#' + tableId).html(rows);
            }


        </script>
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
        <%

            CurrentUser user = (CurrentUser) session.getAttribute("currentUser");
            if (!user.type.equals("1")) {
        %>
        <script type="text/javascript">
            alertErrorAdmin();
        </script>
        <%
            //response.sendRedirect("home.jsp");
            }

        %>
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
                            <li class="my-active"><a id="admin" href="admin.jsp"><span class="glyphicon glyphicon glyphicon-cog"></span>
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
                <div class="col-md-12">
                    <div class="parent homeContainer">
                        <div class="child">
                            <h3 class="some-margin">
                                <span class="glyphicon glyphicon-film">&nbsp;</span>
                                <strong>Rents</strong>
                                <div class="pull-right">
                                    <button class="btn btn-default" data-toggle="modal" data-target="#new-movie">
                                        <span class="glyphicon glyphicon-plus"></span>
                                        Add Movie
                                    </button>
                                </div>
                            </h3>
                            <table class="table" >
                                <thead>
                                    <tr class="btn-default">
                                        <th>Movie</th>
                                        <th>Renter</th>
                                        <th>Renter Email</th>
                                        <th>Return date</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody id="rent-table-id">
                                    <tr>
                                        <td>Finding Dory</td>
                                        <td>Ahmad Khalifa</td>
                                        <td>ahmad.khalifa795@gmail.com</td>
                                        <td>Jan 21st, 2017</td>
                                        <td>Rented</td>
                                        <td><button id="send-email-button" class="btn btn-default btn-sm" data-toggle="modal" data-target="#send-mail">
                                                <span class="glyphicon glyphicon-send" style="visibility: visible"></span>
                                                Send Email
                                            </button></td>
                                    </tr>
                                </tbody>
                            </table>
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
                        <button class="btn btn-default" onclick="location.href = 'signoutServlet'"><span class="glyphicon glyphicon-ok"></span>
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

        <div class="modal" id="new-movie">
            <div class="modal-dialog modal-md black-border">
                <div class="modal-content">
                    <div class="modal-header">
                        <button class="close" data-dismiss = "modal">
                            <span class="glyphicon glyphicon-remove-circle" ></span>
                        </button>
                        <h4 class="modal-title">
                            <span class="glyphicon glyphicon-plus" ></span>
                            Add Movie
                        </h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <form onsubmit="setTimeout(function () {
                                        window.location.reload();
                                    }, 10)" id="create-task-form" action="AddMovie">
                                <div class="input-group">
                                    <span class="glyphicon input-group-addon glyphicon-film" ></span>
                                    <input type="text" class="form-control X" placeholder="Name..." required name="MName"/>
                                </div>
                                <div class="input-group">
                                    <span class="glyphicon input-group-addon glyphicon-calendar" ></span>
                                    <input type="number" class="form-control X" placeholder="Year..." required name="MYear"/>
                                </div>
                                <div class="input-group">
                                    <span class="glyphicon input-group-addon glyphicon-user" ></span>
                                    <input type="text" class="form-control X" placeholder="Main actor..." required name="MMainActor"/>
                                </div>
                                <div class="input-group">
                                    <span class="glyphicon input-group-addon glyphicon-user" ></span>
                                    <input type="text" class="form-control X" placeholder="Main actress..." required name="MMainActress"/>
                                </div>
                                <div class="input-group">
                                    <span class="glyphicon input-group-addon glyphicon-star-empty" ></span>
                                    <input type="number" class="form-control X" placeholder="Rate..." required name="MRate"/>
                                </div>
                                <div class="input-group">
                                    <span class="glyphicon input-group-addon glyphicon-usd" ></span>
                                    <input type="number" class="form-control X" placeholder="Price..." required name="MPrice"/>
                                </div>
                                <div class="input-group">
                                    <span class="glyphicon input-group-addon glyphicon-cd" ></span>
                                    <input type="number" class="form-control X" placeholder="Num of copies..." name="MCopy" required/>
                                </div>
                                <div class="input-group">
                                    <span class="glyphicon input-group-addon glyphicon-link" ></span>
                                    <input type="url" class="form-control X" placeholder="Poster URL..." name="MPoster" required/>
                                </div>
                                <div class="input-group">
                                    <span class="glyphicon input-group-addon glyphicon-link" ></span>
                                    <input type="url" class="form-control X" placeholder="Backdrop URL..."  name="MBackdrop" required/>
                                </div>
                                <div class="input-group">
                                    <span class="glyphicon input-group-addon glyphicon-pencil" ></span>
                                    <textarea class="high" required placeholder="Overview..." name="MOverview"></textarea>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class = "modal-footer" >
                        <button class="btn btn-default" type="submit" form="create-task-form">
                            <span class="glyphicon glyphicon-plus"></span>
                            Add</button>
                    </div>
                </div>
            </div>
        </div>


        <div class="modal" id="send-mail">
            <div class="modal-dialog modal-md black-border">
                <div class="modal-content">
                    <div class="modal-header">
                        <button class="close" data-dismiss = "modal">
                            <span class="glyphicon glyphicon-remove-circle" ></span>
                        </button>
                        <h4 class="modal-title">
                            <span class="glyphicon glyphicon-send" ></span>
                            Send late email
                        </h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <form onsubmit="setTimeout(function () {
                                        window.location.reload();
                                    }, 10)" id="send-mail-form" action="SendMail">
                                <div class="input-group">
                                    <span class="glyphicon input-group-addon glyphicon-envelope" ></span>
                                    <input type="email" class="form-control X" placeholder="Email..." name="email"required/>
                                </div>
                                <div class="input-group">
                                    <span class="glyphicon input-group-addon glyphicon-info-sign" ></span>
                                    <input type="text" class="form-control X" placeholder="Subject..." required/>
                                </div>
                                <div class="input-group">
                                    <span class="glyphicon input-group-addon glyphicon-pencil" ></span>
                                    <textarea class="high" required placeholder="Message..." name="content"></textarea>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class = "modal-footer" >
                        <button class="btn btn-default" type="submit" form="send-mail-form">
                            <span class="glyphicon glyphicon-send"></span>
                            Send</button>
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