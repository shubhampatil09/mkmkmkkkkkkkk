<%@page import="com.linus.utility.Constants"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.linus.utility.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);

if(request.getSession().getAttribute("param") == null){ 
	response.sendRedirect("/adm/en/login");
}

String url = request.getRequestURL().toString();
String[] team = Utility.decode(url.substring(url.lastIndexOf("/")+1)).split("_");
try{
	if(!team[1].equals(request.getSession().getId())){
    	team[0] = "' or 1=1; -- ";
    }	
}catch(ArrayIndexOutOfBoundsException e){
	team[0] = "' or 1=1; -- ";
}

Connection connect = null;
Statement stmt = null;
ResultSet result = null;
%>    
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>ePaper | Change Password</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/fontawesome-free/css/all.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/icheck-bootstrap.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/adminlte.min.css">
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">
	<% if(Constants.TYPE.equals("O")){ %>
	<jsp:include page="/admin/chnav.jsp">
		<jsp:param value="password" name="form"/>
	</jsp:include>
	<% }else{ %>
	<jsp:include page="/admin/hnav.jsp">
		<jsp:param value="password" name="form"/>
	</jsp:include>
	<% } %>
  <div class="content-wrapper">
  	<br><br>
    <section class="content">
      <div class="container-fluid">
      	<div class="row">
      	<div class="col-lg-3"></div>
      		<div class="login-box col-lg-5">
		  <div class="card card-outline card-primary">
		    <div class="card-header text-center">
		      <a href="#" class="h1"><b>ePaper</b></a>
		    </div>
		    <div class="card-body">
		      <p class="login-box-msg">You are only one step a way from your new password.</p>
		      <form id="pwd-form">
		      	<input type="hidden" id="userid" value="<%= team[0] %>">
		        <div class="input-group mb-3">
		          <input type="password" id="opassword" class="form-control" placeholder="Old Password">
		        </div>
		        <div class="input-group mb-3">
		          <input type="password" id="npassword" class="form-control" placeholder="New Password">
		        </div>
		        <div class="input-group mb-3">
		          <input type="password" id="cpassword" class="form-control" placeholder="Confirm Password">
		        </div>
		        <div class="row">
		          <div class="col-12">
		            <button type="submit" class="btn btn-primary btn-block">Change password</button>
		          </div>
		        </div>
		      </form>
		    </div>
		  </div>
		</div>
      	</div>
      </div>      
    </section>
  </div>
  <jsp:include page="/admin/footer.jsp"></jsp:include>
</div>
	<script src="${pageContext.request.contextPath}/admin/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/admin/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/admin/js/adminlte.min.js"></script>
	<script src="${pageContext.request.contextPath}/admin/js/validate.js" ></script>

<script type="text/javascript">
	$(document).ready(function(){
		$('#pwd-form').submit(function(event){
			event.preventDefault();
			
			if(!$('#opassword').val()){
				alert('Old Password cannot be left blank.');
			}else if(!$('#npassword').val()){
				alert('New Password cannot be left blank.');
			}else if(!$('#cpassword').val()){
				alert('Confirm Password cannot be left blank.');
			}else if(!validateInput($('#npassword').val(),2)){
				alert('Password should be as per the format. It should have atleast [1 Uppercase, 1 lowercase, 1 numeric and 1 symbol and minium length should be 8]');
			}else if(!$('#npassword').val() == $('#cpassword').val()){
				alert('New Password and Confirm password do not match.');
			}else{
				$.ajax({
	                type : "POST",
	              	contentType: "application/x-www-form-urlencoded",
	                url : "/sh/change-pwd",
	                data : {
	                	"opassword": $('#opassword').val(),
	                	"npassword": $('#npassword').val(),
	                	"cpassword": $('#cpassword').val(),
	                	"userid":$('#userid').val()
	                },
	                success : function(data) {
	                    var status = data.status;
	                    alert(data.message);
	                    location.reload();
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
    