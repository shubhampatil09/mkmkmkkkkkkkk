<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="description" content="Cyber Security project.">
  <meta name="author" content="linus">
  <title>ePaper | Login</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <link rel="stylesheet" href="../../admin/css/fontawesome-free/css/all.min.css">
  <link rel="stylesheet" href="../../admin/css/icheck-bootstrap.min.css">
  <link rel="stylesheet" href="../../admin/css/adminlte.min.css">
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="card card-outline card-primary">
    <div class="card-header text-center">
      <a href="#" class="h1"><b>ePaper</b></a>
    </div>
    <div class="card-body">
      <p class="login-box-msg">Sign in to start your session</p>
      <form  id="login-form" autocomplete="off">
        <div class="input-group mb-3">
          <input type="email" id="email" class="form-control" placeholder="Email" required="required">
        </div>
        <div class="input-group mb-3">
          <input type="password" id="password" class="form-control" placeholder="Password">
        </div>
        <div class="input-group">
			<img alt="Captcha" src="/captcha.jpg">
			<input placeholder="Enter Captcha" class="form-control" id="captcha">
		</div>
		<br>
        <div class="row">
          <div class="col-4"></div>
          <div class="col-4">
            <button type="submit" class="btn btn-primary btn-block">Sign In</button>
          </div>
        </div>
        <div class="row">
        	<div class="col-5">
        		<p class="mb-1">
		        	<a href="/adm/en/forgot-password">Forgot Password</a>
		      	</p>
        	</div>
        	<div class="col-2"></div>
        	<div class="col-5" style="text-align: right;">
        		<p class="mb-0">
			    	<a href="/adm/en/register" class="text-center">Register</a>
			    </p>
        	</div>
        	<div style="text-align: center;width: 100%;">
        		<a href="../../"><button type="button" class="btn btn-block btn-outline-danger">BACK</button></a>
        	</div>
        </div>
      </form>
    </div>
  </div>
</div>

<script src="../../admin/js/jquery.min.js"></script>
<script src="../../admin/js/bootstrap.bundle.min.js"></script>
<script src="../../admin/js/adminlte.min.js"></script>
<script src="../../admin/js/validate.js" ></script>

<script type="text/javascript">
	$(document).ready(function(){
		$('#login-form').submit(function(event){
			event.preventDefault();
			
			if(!$('#email').val()){
				alert('Email ID cannot be left blank.');
			}else if(!$('#password').val()){
				alert('Password cannot be left blank.');
			}else if(!validateInput($('#email').val(),1)){
				alert('Email ID contains invalid symbols');
			}else if(!validateInput($('#password').val(),2)){
				alert('Password should be as per the format. It should have atleast [1 Uppercase, 1 lowercase, 1 numeric and 1 symbol and minium length should be 8]');
			}else if(!$('#captcha').val()){
				alert('Please provide the captcha.');
			}else{
				$.ajax({
	                type : "POST",
	              	contentType: "application/x-www-form-urlencoded",
	                url : "/sh/login",
	                data : {
	                	"captcha": $('#captcha').val(),
	                	"email": $('#email').val(),
	                	"password": $('#password').val()
	                },
	                success : function(data) {
	                	console.log(data);
	                    var status = data.status;
	                    if (status == 'success') {
	                    	window.location = "http://" + data.form + "/" +data.param;
	                    }else{
	                    	alert(data.message);
	                    	location.reload();
	                    }
	                },
	                error : function(msg) {
	                    alert("Something went wrong! Please try again.");
	                    location.reload();
	                }
	            });
			}
			
		});
	});
</script>
</body>
</html>
    