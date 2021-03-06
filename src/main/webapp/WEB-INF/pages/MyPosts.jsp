<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>My Posts</title>
  
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
  
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <script src="js/ckeditor/ckeditor.js"></script>

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>  
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.2.27/angular.min.js"></script>
  
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
         <li><a href="#">My Profile</a></li>
         <li><a href="#">My Posts</a></li>
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

<h1>My Posts</h1>
<hr>
<div class="container">
<div class="jumbotron">
   
  <div class="row">
  	<div class="col-md-9">
    <form action="" method="POST" role="form" name="formUpdate" novalidate>
      <legend>Create new post</legend>  
      <div class="form-group">
        <input type="text" class="form-control" name="postTitle" placeholder="Post title">
       
      </div>  

      <div class="form-group">
        <textarea name="editor1" id="editor1" rows="10" col="50">   
        </textarea>    
        <script>
          CKEDITOR.replace('editor1');
        </script>
      </div>
      <button type="submit" class="btn btn-primary btn-block">Create Post</button>
    </form>
    <br/>
    <h3 id="lop">List of Posts</h3>
    <div class="table-responsive">
      <table class="table table-hover">
        <thead>
          <tr>
            <th>#</th>
            <th>Post Title</th>
            <th>Edit</th>
            <th>Delete</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>1</td>
            <td>Spring Framework</td>
            <td><a href="#lop"><i class="glyphicon glyphicon-pencil"></i></a></td>
            <td><a href="#lop"><i class="glyphicon glyphicon-trash"></i></a></td>
          </tr>
          <tr>
            <td>2</td>
            <td>Hibernate Framework</td>
            <td><a href="#"><i class="glyphicon glyphicon-pencil"></i></a></td>
            <td><a href="#"><i class="glyphicon glyphicon-trash"></i></a></td>
          </tr>
          <tr>
            <td>3</td>
            <td>Strut2 Framework</td>
            <td><a href="#"><i class="glyphicon glyphicon-pencil"></i></a></td>
            <td><a href="#"><i class="glyphicon glyphicon-trash"></i></a></td>
          </tr>
          <tr>
            <td>4</td>
            <td>MVC Framework</td>
            <td><a href="#"><i class="glyphicon glyphicon-pencil"></i></a></td>
            <td><a href="#"><i class="glyphicon glyphicon-trash"></i></a></td>
          </tr>
          <tr>
            <td>5</td>
            <td>RESTEasy Framework</td>
            <td><a href="#"><i class="glyphicon glyphicon-pencil"></i></a></td>
            <td><a href="#"><i class="glyphicon glyphicon-trash"></i></a></td>
          </tr>
        </tbody>
      </table>
      <div style="text-align:center; margin-top:0px; margin-bottom:0px"><nav>
            <ul class="pagination">
              <li>
                <a href="#" aria-label="Previous">
                  <span aria-hidden="true">&laquo;</span>
                    </a>
                  </li>
                  <li><a href="#">1</a></li>
                  <li><a href="#">2</a></li>
                  <li><a href="#">3</a></li>
                  <li><a href="#">4</a></li>
                  <li><a href="#">5</a></li>
                  <li>
                    <a href="#" aria-label="Next">
                      <span aria-hidden="true">&raquo;</span>
                </a>
              </li>
            </ul>
          </nav>
          </div>
    </div>
  	</div>   
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