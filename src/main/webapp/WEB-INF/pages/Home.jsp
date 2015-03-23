<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Home Page</title>
  
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
  
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>  
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.2.26/angular.min.js"></script>
  

</head>
<body>


<!-- navbar -->
<nav class="navbar navbar-inverse "> <!-- "navbar-fixed-top" -->
  <div class="container">
  <div class="row">     
     <div class="col-md-3">
     <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" 
          data-target="#navbar" aria-expanded="false" aria-controls="navbar">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <h1><a href="#" style="font-size:35px;padding:25px;margin-bottom:0px">Mini Blog</a></h1>
    </div>
    </div>
    <div id="navbar" class="navbar-collapse collapse">
    <div class="col-md-6">          
           <div class="nav navbar-nav navbar-left form-group has-feedback" style="margin-top:20px; width:100%; margin-left:10px; margin-bottom:0px">            
            <input type="text" placeholder="Search user..." class="form-control"> 
            <i class="glyphicon glyphicon-search form-control-feedback "></i>            
        </div>       
    </div>
       <div class="col-md-3">
         <ul class="nav navbar-nav navbar-right">           
       <li class="dropdown">
       <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" style="padding:25px;">Hi, Duy Tran <span class="caret"></span></a>
       <ul class="dropdown-menu" role="menu">
         <li><a href="myProfile.html">My Profile</a></li>
         <li><a href="myPosts.html">My Posts</a></li>
         <li class="divider"></li>
         <li><a href="#">Log Out</a></li>         
       </ul>
       </li>
     </ul>
        </div>
        </div>
    </div>
  </div>
</nav>

<h1>Home</h1>
<hr>
<div class="container">
<div class="jumbotron">
   
  <div class="row">
    <div class="col-md-9">
    <table class="table">
    <tr>
    <td>
    <h2><a href="PostDetail.html">Post Title 1</a></h2>
    <h4>Author Duy Tran</h4>
    <p>HLV Miura đã giảm các bài tập thể lực để dành thời gian khớp bộ khung đội hình Olympic Việt Nam chuẩn bị cho các trận đấu giao hữu sắp tới.</p>
    <a href="PostDetail.html">Read more....</a>
    </td>
    </tr>
    <tr>
    <td>
    <h2><a href="#">Post Title 2</a></h2>
    <h4>Author Duy Tran</h4>
    <p>HLV Miura đã giảm các bài tập thể lực để dành thời gian khớp bộ khung đội hình Olympic Việt Nam chuẩn bị cho các trận đấu giao hữu sắp tới.</p>
    <a href="#">Read more....</a>
    </td>
    </tr>
    <tr>
    <td>
    <h2><a href="#">Post Title 3</a></h2>
    <h4>Author Duy Tran</h4>
    <p>HLV Miura đã giảm các bài tập thể lực để dành thời gian khớp bộ khung đội hình Olympic Việt Nam chuẩn bị cho các trận đấu giao hữu sắp tới.</p>
    <a href="#">Read more....</a>
    </td>
    </tr>
    <tr>
    <td>
    <h2><a href="#">Post Title 4</a></h2>
    <h4>Author Duy Tran</h4>
    <p>HLV Miura đã giảm các bài tập thể lực để dành thời gian khớp bộ khung đội hình Olympic Việt Nam chuẩn bị cho các trận đấu giao hữu sắp tới.</p>
    <a href="#">Read more....</a>
    </td>
    </tr>
    <tr>
    <td>
    <h2><a href="#">Post Title 5</a></h2>
    <h4>Author Duy Tran</h4>
    <p>HLV Miura đã giảm các bài tập thể lực để dành thời gian khớp bộ khung đội hình Olympic Việt Nam chuẩn bị cho các trận đấu giao hữu sắp tới.</p>
    <a href="#">Read more....</a>
    </td>
    </tr>
    </table>
    </div>
    <br/>
    <div class="col-md-3">
     <div class="form-group has-feedback">            
            <input type="text" placeholder="Search posts..." class="form-control"> 
            <i class="glyphicon glyphicon-search form-control-feedback "></i>
     </div>
    <table class="table">
    <tr><td>
    <h4><a href="PostDetail.html">Post Title 1</a></h4>
    <p>HLV Miura đã giảm các bài tập thể lực</p>
    </td></tr>
    <tr><td>
    <h4><a href="#">Post Title 2</a></h4>
    <p>HLV Miura đã giảm các bài tập thể lực</p>
    </td></tr>
    <tr><td>
    <h4><a href="#">Post Title 3</a></h4>
    <p>HLV Miura đã giảm các bài tập thể lực</p>
    </td></tr>
    <tr><td>
    <h4><a href="#">Post Title 4</a></h4>
    <p>HLV Miura đã giảm các bài tập thể lực</p>
    </td></tr>
    <tr><td>
    <h4><a href="#">Post Title 5</a></h4>
    <p>HLV Miura đã giảm các bài tập thể lực</p>
    </td></tr>
    </table>
    </div>
  </div>
</div>
</div>

<br/>
<footer style="background-color: black; color: white; padding: 2em; margin-top: 2px;">Keep Moving Forward</footer>
</body>
</html>