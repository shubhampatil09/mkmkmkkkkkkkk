<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>ePaper | Forgot Password</title>

  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <link rel="stylesheet" href="../../admin/css/fontawesome-free/css/all.min.css">
  <link rel="stylesheet" href="../../admin/css/icheck-bootstrap.min.css">
  <link rel="stylesheet" href="../../admin/css/adminlte.min.css">
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    <a href="#"><b>ePaper</b></a>
  </div>
  <div class="card">
    <div class="card-body login-card-body">
      <p class="login-box-msg">You forgot your password? Here you can easily retrieve a new password.</p>

      <form action="recover-password.html" method="post">
        <div class="input mb-3">
          <input type="email" class="form-control" placeholder="Email">
        </div>
        <div class="input-group mb-2">
			<img alt="Captcha" src="/captcha.jpg">
			<input placeholder="Enter Captcha" class="form-control" id="captcha">
		</div>
        <div class="row">
          <div class="col-12">
            <button type="submit" class="btn btn-primary btn-block" onclick="fprequest();">Request new password</button>
          </div>
        </div>
      </form>

      <p class="mt-3 mb-1">
        <a href="/adm/en/login" class="btn btn-block btn-outline-danger">Login</a>
      </p>
      <p class="mb-0">
        <a href="/adm/en/register" class="btn btn-block btn-outline-danger">Register</a>
      </p>
    </div>
  </div>
</div>
<script src="../../admin/js/jquery.min.js"></script>
<script src="../../admin/js/bootstrap.bundle.min.js"></script>
<script src="../../admin/js/adminlte.min.js"></script>
<script type="text/javascript">
	function fprequest(){
		alert("A link has been shared on your registered email id!");
	}
</script>
</body>
</html>
    