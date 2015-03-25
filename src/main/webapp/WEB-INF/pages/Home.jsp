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
    <script src="js/ckeditor/ckeditor.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.15/angular.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.15/angular-animate.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.15/angular-route.js"></script>
<script type="text/javascript" src="js/user/angularUserApp.js"></script>
  

</head>
<body data-ng-app="blogUserApp" ng-controller="homeCtrl">


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
         <li><a href="" ng-click="myProfile()">My Profile</a></li>
         <li><a href="" ng-click="myPosts()">My Posts</a></li>
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
<div class="container-fluid">
<div class="row">
		<div class="col-md-4">
			<h4>
				<a href="" ng-click="welcome()">Home</a> 
				<a href="" ng-show="showPostDetail">/ {{detailPost.title}}</a> 
				<a href="" ng-show="showPostsOfAuthor">/ {{AuthorName}}</a> 
			</h4>
		</div>
		<div class="col-md-4">
			{{error}}
		</div>
		<div class="col-md-4">	
				<h4 style="float:right;">
					<a href="#">Logout</a> | 
					<a href="" ng-click="myPosts()">My Posts</a> | 
					<a href="" ng-click="myProfile()">My Profile</a>
				</h4>	
		</div>
	</div>
</div>
<hr>
	<div class="container">
		<div class="jumbotron">
			<div class="row">
			
				<!-- All Posts: Start -->
				<div id="listAllPost" ng-show="showAllPosts">
				<div class="col-md-9" data-ng-controller="allPostsCtrl">
					<table class="table">						
							<tr data-ng-repeat="lst in listPosts">
								<td>
									<div class="row">
											<div class="col-md-2">
												<img style="width: 100px; height: 100px" src="images/{{lst.avatar}}" alt="Avatar">
											</div>
											<div class="col-md-10">										
												<h2>
													<a href="" ng-click="postDetail(lst.id)">{{lst.title}}</a>
												</h2>
											<div>
												<h4 style="float: left; padding: 5px;">Author: <a href="" ng-click="getPostsByAuthor(lst.user_id)">{{lst.firstName + ' ' + lst.lastName}}</a></h4>
												<h4 style="float: right; padding: 5px;">Updated: {{lst.updated_at}}</h4>
											</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-9">
											  	{{lst.description}}
										 	 <a href="" ng-click="postDetail(lst.id)">Read More...</a>
									  	</div>
										</div>	
								</td>
							</tr>				
					</table>
				</div>
				</div>
				<!-- All Posts: End -->
				
				<!-- Detail Post: Start -->
				<div id="postDetail" ng-show="showPostDetail">
				  	<div class="col-md-9">
          <table class="table">   
              
              <tr >
                <td>
                  <div class="row">
                      <div class="col-md-2">
                        <img style="width: 100px; height: 100px" src="images/{{detailPost.avatar}}" alt="Avatar">
                      </div>
                      <div class="col-md-10">                   
                        <h2>
                          <a href="#"> {{detaiPost.title}} </a>
                        </h2>
                      <div>
                        <h4 style="float: left; padding: 5px;">Author: <a href="" ng-click="getPostsByAuthor(detailPost.user_id)">{{detailPost.firstName}} {{detailPost.lastName}}</a></h4>
                        <h4 style="float: right; padding: 5px;">Updated: {{detailPost.updated_at}}</h4>
                      </div>
                      </div>
                    </div>
                    <div class="row" style="font-size:20px;">
                      <div class="col-md-12">
                          {{detailPost.description}}
                      </div>
                    </div>  
                </td>
              </tr>       
          </table>
    <h2>Comments</h2>
      <div>
      <form action="" method="POST" role="form">     
        <div class="form-group">
          <textarea name="cmContent" placeholder="Add comment here" style="font-size:20px; width:100%"></textarea>
        </div>      
        <button type="submit" class="btn btn-primary">Add Comment</button>
      </form>
      </div>
      <hr/>
      <h4>{{nocomment}}</h4>
      <div ng-repeat="comment in comments" class="media">
        <a class="pull-left" href="#">
          <img style="width: 100px; height: 100px" class="media-object" src="images/{{comment.avatar}}" alt="Avatar">
        </a>
        <div class="media-body">
          <h3 class="media-heading"><a href="" ng-click="getPostsByAuthor(comment.user_id)">{{comment.firstName}} {{comment.lastName}}</a><span style="float:right">Date: {{comment.updated_at}}</span></h3>
          <p>{{comment.description}}</p>
        </div>
      </div>
      </div>
      </div>
	<!-- Detail Post: End -->
	
	
	<!-- Posts of Author: Start -->
	<div id="postsOfAuthor" ng-show="showPostsOfAuthor">
				<div class="col-md-9" data-ng-controller="allPostsCtrl">
					<h4>{{nopost}}</h4>
					<table class="table">						
							<tr data-ng-repeat="lst in postsOfAuthor">
								<td>
									<div class="row">
											<div class="col-md-2">
												<img style="width: 100px; height: 100px" src="images/{{lst.avatar}}" alt="Avatar">
											</div>
											<div class="col-md-10">										
												<h2>
													<a href="" ng-click="postDetail(lst.id)">{{lst.title}}</a>
												</h2>
											<div>
												<h4 style="float: left; padding: 5px;">Author: <a href="#">{{lst.firstName + ' ' + lst.lastName}}</a></h4>
												<h4 style="float: right; padding: 5px;">Updated: {{lst.updated_at}}</h4>
											</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-9">
											  	{{lst.description}}
										 	 <a href="" ng-click="postDetail(lst.id)">Read More...</a>
									  	</div>
										</div>	
								</td>
							</tr>				
					</table>
				</div>
				</div>
	<!-- Posts of Author: End -->
	
	
	<!-- My Profile: Start -->
	<div id="myProfile" ng-show="showMyProfile">
 <div class="col-md-5">
    <br>
      <form action="" method="POST" role="form" name="formUpdate" novalidate ng-controller="myProfileCtrl">
        <legend>Update Information</legend>
        <!-- FIRST NAME -->
        <div class="form-group has-feedback" ng-class="{'has-error': formUpdate.firstname.$invalid, 'has-success': formUpdate.firstname.$valid && formUpdate.firstname.$dirty}">
          <input type="text" class="form-control" name="firstname" placeholder="First name" ng-model="firstname" ng-minlength="6" ng-maxlength="15">
          <p ng-show="formUpdate.firstname.$error.minlength" class="help-block">First name must be more than 6 characters long.</p>
          <p ng-show="formUpdate.firstname.$error.maxlength" class="help-block">First name must be more than 15 characters long.</p>
          <i ng-show="formUpdate.firstname.$invalid" class="glyphicon glyphicon-alert form-control-feedback"></i>
          <i ng-show="formUpdate.firstname.$valid && formUpdate.firstname.$dirty" class="glyphicon glyphicon-ok form-control-feedback"></i>
        </div>
        <!-- LAST NAME -->
        <div class="form-group has-feedback" ng-class="{'has-error': formUpdate.lastname.$invalid, 'has-success': formUpdate.lastname.$valid && formUpdate.lastname.$dirty}">
          <input type="text" class="form-control" name="lastname" placeholder="Last name" ng-model="lastname" ng-minlength="6" ng-maxlength="15">
          <p ng-show="formUpdate.lastname.$error.minlength" class="help-block">Last name must be more than 6 characters long.</p>
          <p ng-show="formUpdate.lastname.$error.maxlength" class="help-block">Last name must be more than 15 characters long.</p>
          <i ng-show="formUpdate.lastname.$invalid" class="glyphicon glyphicon-alert form-control-feedback"></i>
          <i ng-show="formUpdate.lastname.$valid && formUpdate.lastname.$dirty" class="glyphicon glyphicon-ok form-control-feedback"></i>
        </div>        
        <!-- AVATAR -->
        <div class="form-group has-feedback" ng-class="{'has-success': formUpdate.avatar.$dirty}">
          <input type="text" class="form-control" name="avatar" placeholder="Avatar" ng-model="avatar">
          <i ng-show="formUpdate.avatar.$dirty" class="glyphicon glyphicon-ok form-control-feedback"></i>
        </div>
        <!-- EMAIL -->
         <div class="form-group has-feedback" ng-class="{'has-error': formUpdate.email.$invalid && formUpdate.email.$dirty, 'has-success': formUpdate.email.$valid && formUpdate.email.$dirty}">
          <input type="email" class="form-control" name="email" placeholder="Email" ng-model="email" required>
          <p ng-show="formUpdate.email.$invalid && !formUpdate.email.$pristine" class="help-block">Email is required.</p>
          <p ng-show="formUpdate.email.$invalid && !formUpdate.email.$pristine" class="help-block">Please enter a valid email.</p>
          <i ng-show="formUpdate.email.$invalid && formUpdate.email.$dirty" class="glyphicon glyphicon-alert form-control-feedback"></i>
          <i ng-show="formUpdate.email.$valid && formUpdate.email.$dirty" class="glyphicon glyphicon-ok form-control-feedback"></i>  
        </div>     
        <button type="submit" class="btn btn-primary btn-block" ng-disabled="!formUpdate.$valid" ng-class="{'btn-success': formUpdate.$valid}">Update</button>
      </form>
    </div>
    <br>
    <div class="col-md-4">
      <form action="" method="POST" role="form" name="chgPass" ng-controller="chgPassCtrl">
        <legend>Change Password</legend>
        <!-- CURRENT PASSWORD -->
        <div class="form-group has-feedback" ng-class="{'has-error':chgPass.oldpassword.$invalid && chgPass.oldpassword.$dirty,'has-success': chgPass.oldpassword.$dirty}">
          <input type="password" class="form-control" name="oldpassword" placeholder="Current password" ng-model="oldpassword" required>
          <p ng-show="chgPass.oldpassword.$error.required && chgPass.oldpassword.$dirty" class="help-block">Password is required.</p>
          <i ng-show="chgPass.oldpassword.$error.required && chgPass.oldpassword.$dirty" class="glyphicon glyphicon-alert form-control-feedback"></i>
          <i ng-show="chgPass.oldpassword.$dirty && chgPass.oldpassword.$valid" class="glyphicon glyphicon-ok form-control-feedback"></i>
        </div>
        <!-- NEW PASSWORD -->
        <div class="form-group has-feedback" ng-class="{'has-error':chgPass.newpassword.$invalid && chgPass.newpassword.$dirty,'has-success': chgPass.newpassword.$dirty}">
          <input type="password" class="form-control" name="newpassword" placeholder="New password" ng-model="newpassword" required>
          <p ng-show="chgPass.newpassword.$error.required && chgPass.newpassword.$dirty" class="help-block">Password is required.</p>
          <i ng-show="chgPass.newpassword.$error.required && chgPass.newpassword.$dirty" class="glyphicon glyphicon-alert form-control-feedback"></i>
          <i ng-show="chgPass.newpassword.$dirty && chgPass.newpassword.$valid" class="glyphicon glyphicon-ok form-control-feedback"></i>
        </div>
        <!-- CONFIRM PASSWORD -->
        <div class="form-group has-feedback" ng-class="{'has-error': chgPass.confirmpassword.$error.nomatch, 'has-success': chgPass.confirmpassword.$valid && chgPass.confirmpassword.$dirty}">
          <input type="password" class="form-control" name="confirmpassword" placeholder="Confirm password" ng-model="confirmpassword" match="newpassword">
          <p ng-show="chgPass.confirmpassword.$error.nomatch" class="help-block">Confirm password doesn't match!</p>          
          <i ng-show="chgPass.confirmpassword.$error.required && chgPass.confirmpassword.$dirty" class="glyphicon glyphicon-alert form-control-feedback"></i>
          <i ng-show="chgPass.confirmpassword.$error.nomatch" class="glyphicon glyphicon-alert form-control-feedback"></i>
          <i ng-show="chgPass.confirmpassword.$valid && chgPass.confirmpassword.$dirty" class="glyphicon glyphicon-ok form-control-feedback"></i>
        </div>    
        <button type="submit" class="btn btn-primary btn-block" ng-disabled="!chgPass.$valid" ng-class="{'btn-success': chgPass.$valid && !chgPass.$pristine}">Change Password</button>
      </form>
    </div>
				</div>
	<!-- My Profile: End -->
	
	
	<!-- My Posts: Start -->
	<div id="myPosts" ng-show="showMyPosts">
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
  	</div> 				</div>
	<!-- My Posts: End -->
	
	
	
	
				<br />
				
				<!-- Search Posts: Start -->
				<div class="col-md-3" data-ng-controller="allPostsCtrl">
					<div class="form-group has-feedback">
						<input ng-model="searchPost.title" type="text" placeholder="Search posts by title..."
							class="form-control" name="searchInput"> <i
							class="glyphicon glyphicon-search form-control-feedback "></i>
					</div>					
					<table class="table" ng-show="searchPost.title.length">		
							<tr data-ng-repeat="lst in listPosts | filter : searchPost as results">
								<td>									
									<h4>
										<a href="" ng-click="postDetail(lst.id)">{{lst.title}}</a>
									</h4>
									<p>{{lst.description}}</p>
								</td>
							</tr>	
							<tr ng-if="results.length == 0"><td><h3>No results found...</h3></td></tr>	
					</table>
					<table class="table" ng-show="!searchPost.title.length">			
							<tr data-ng-repeat="lst in listPosts | limitTo : 5">
								<td>									
									<h4>
										<a href="" ng-click="postDetail(lst.id)">{{lst.title}}</a>
									</h4>
									<p>{{lst.description}}</p>
								</td>
							</tr>	
					</table>
				</div>
				<!-- Search Posts: End -->
			</div>
		</div>
	</div>

	<br />
	<footer
		style="background-color: black; color: white; padding: 2em; margin-top: 2px;">Keep
		Moving Forward</footer>
</body>
</html>