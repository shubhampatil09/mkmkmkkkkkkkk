<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>ePaper | Registration</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <link rel="stylesheet" href="../../admin/css/fontawesome-free/css/all.min.css">
  <link rel="stylesheet" href="../../admin/css/icheck-bootstrap.min.css">
  <link rel="stylesheet" href="../../admin/css/adminlte.min.css">
</head>
<body class="hold-transition register-page">
<div class="register-box">
  <div class="register-logo">
    <a href="#"><b>ePaper</b></a>
  </div>

  <div class="card">
    <div class="card-body register-card-body">
      <p class="login-box-msg">Register a new member</p>

      <form id="register-form" autocomplete="off">
        <div class="input mb-3">
          <input type="text" id="name" class="form-control" placeholder="Full name">
        </div>
        <div class="input mb-3">
          <input type="email" id="email" class="form-control" placeholder="Email">
        </div>
        <div class="input mb-3">
          <input type="text" id="mobile" class="form-control" placeholder="Mobile" >
        </div>
        <div class="input mb-3">
          <input type="text" id="org_name" class="form-control" placeholder="Organisation Name">
        </div>
        <div class="input mb-3">
          <input type="password" id="password" class="form-control" placeholder="Password">
        </div>
        <div class="input mb-3">
          <input type="password" id="cpassword" class="form-control" placeholder="Retype password">
        </div>
        <div class="input-group mb-2">
			<img alt="Captcha" src="/captcha.jpg" style="width: 8rem;">
			<input placeholder="Enter Captcha" class="form-control" id="captcha">
		</div>
		
        <div class="row">
          <div class="col-8">
            <div class="icheck-primary">
              <input type="checkbox" id="terms" value="agree">
              <label for="terms">
               I agree to the <a href="/adm/en/terms">terms</a>
              </label>
            </div>
          </div>
        </div>
        <div class="row">
        	<div class="col-12">
				<button type="submit" class="btn btn-primary btn-block">Register</button>
        	</div>
        </div>
      </form>
      <div class="social-auth-links text-center">
        <a href="/adm/en/login" class="btn btn-block btn-outline-danger">
          Return to Login
        </a>
      </div>
    </div>
  </div>
</div>
<script src="../../admin/js/jquery.min.js"></script>
<script src="../../admin/js/bootstrap.bundle.min.js"></script>
<script src="../../admin/js/adminlte.min.js"></script>
<script src="../../admin/js/validate.js" ></script>

<script type="text/javascript">
	$(document).ready(function(){
		$('#register-form').submit(function(event){
			event.preventDefault();
			
			if(!$('#name').val()){
				alert("Name cannot be empty!");
			}else if(!$('#email').val()){
				alert('Email ID cannot be left blank.');
			}else if(!$('#mobile').val()){
				alert("Mobile number cannot be empty!");
			}else if(!$('#org_name').val()){
				alert("Organisation Name cannot be left blank.");
			}else if(!$('#password').val()){
				alert('Password cannot be left blank.');
			}else if(!$('#cpassword').val()){
				alert('Confirm Password cannot be left blank.');
			}else if(!validateInput($('#name').val(),3)){
				alert('Name contains invalid symbols');
			}else if(!validateInput($('#email').val(),1)){
				alert('Email ID contains invalid symbols');
			}else if(!validateInput($('#mobile').val(),6)){
				alert('Mobile number is either invalid or contains invalid symbols.');
			}else if(!validateInput($('#org_name').val(),3)){
				alert('Organisation Name contains invalid symbols');
			}else if(!validateInput($('#password').val(),2)){
				alert('Password should be as per the format. It should have atleast [1 Uppercase, 1 lowercase, 1 numeric and 1 symbol and minium length should be 8]');
			}else if($('#password').val() != $('#cpassword').val()){
				alert('Password do not match with the confirm password.');
			}else if(!$('#captcha').val()){
				alert('Please provide the captcha.');
			}else if(!$('#terms').is(":checked")){
				alert("Please agree the terms and conditions to proceed.");
			}else{
				$.ajax({
	                type : "POST",
	              	contentType: "application/x-www-form-urlencoded",
	                url : "/sh/register",
	                data : {
	                	"captcha": $('#captcha').val(),
	                	"name": $('#name').val(),
	                	"email": $('#email').val(),
	                	"mobile": $('#mobile').val(),
	                	"org": $('#org_name').val(),
	                	"password": $('#password').val(),
	                	"cpassword": $('#cpassword').val()
	                },
	                success : function(msg) {
	                	console.log(msg);
	                    //var data = JSON.parse(msg);
	                    alert(msg.message);
	                    var status = msg.status;
	                    if (status == 'success') {
	                    	window.location = msg.form;
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
    