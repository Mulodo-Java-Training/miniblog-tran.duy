<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Welcome Page</title>
  
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
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" 
          data-target="#navbar" aria-expanded="false" aria-controls="navbar">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <h1><a href="#" style="font-size:45px;padding:10px;">Mini Blog</a></h1>
    </div>
    <div id="navbar" class="navbar-collapse collapse">
      <form class="navbar-form navbar-right" action="apis/v1/login" method="post" enctype="application/x-www-form-urlencoded">
        <table>
        <tr>
        
        <td style="padding:5px">
          <div class="form-group has-feedback">
            
            <input type="text" placeholder="User name" class="form-control" name="username"> 
            <i class="glyphicon glyphicon-user form-control-feedback "></i>
          </div>
          </td>
          <td style="padding:5px">
          <div class="form-group has-feedback">
            <input type="password" placeholder="Password" class="form-control" name="password">
            <i class="glyphicon glyphicon-lock form-control-feedback"></i>
          </div>
          </td>
         <td style="padding:5px;">
         <!-- <h3><a href="Home.html">Sign In</a></h3>  -->
          <button type="submit" class="btn btn-success">Sign in</button>
          </td>
          </tr>
          <tr>
          <td></td>
         <td style="padding:5px;text-align:center">
         <div>
          <label>
            <a href="#">Forget your password!</a>
          </label>
         </div>
         </td>
         <td style="padding:5px; text-align:center">
          <label>
            <a href="register.html">Register</a>
          </label>
         </td>
         </tr>   
         </table>
      </form>
    </div>
  </div>
</nav>
<h1>Welcome</h1>
<a href="test.html">test</a> | <a href="test2.html">test 2</a>
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