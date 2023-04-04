<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="../css/bootstrap.min.css">
  <link rel="stylesheet" href="../css/style.css" />
  <link rel="stylesheet" href="../css/responsive.css" />

  <title>ePaper</title>

</head>

<body>
  <header>
    <div class="container-fluid">
    	<jsp:include page="/headermenu.jsp">
   			<jsp:param value="contact" name="form"/>
   		</jsp:include>  
    </div>
  </header>
  <main>
    <div class="container-fluid">
    	<div class="title">
    		<p class="title-content">REACH TO US</p>
    	</div>
    	<hr>

    	
    	<section>
    		 <div class="jumbotron">
                <div class="container">
				 <div class="row">
				    <div class="col-sm-4 col-md-4 col-lg-4 col-xl-4">
				    	<h4>Contact Us</h4>
				    	<p>Address: K77, D-Block, Ramanajan Street,
				    	Lajpath Nagar, New Delhi, Pin: 110056
				    	<br>
				    	Email ID: info@epaper.com<br>
				    	Phone: +91 00000-00000, +91 880 00 00000</p>
				    </div>
				    <div class="col-sm-8 col-md-8 col-lg-8 col-xl-8">
				    	<form id="contact-form" autocomplete="off">
						  <div class="form-group">
						    <label for="iName">Enter Name</label>
						    <input type="text" class="form-control" id="iName" placeholder="Enter Name">
						  </div>
						  <div class="form-group">
						    <label for="iEmail">Enter Email-ID </label>
						    <input type="email" class="form-control" id="iEmail" aria-describedby="emailHelp" placeholder="Enter email" required>
						    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
						  </div>
						  <div class="form-group">
						    <label for="iMobile">Enter Mobile Number</label>
						    <input type="text" class="form-control" id="iMobile" placeholder="Enter Mobile Number">
						  </div>
						  <div class="form-group">
						    <label for="iMessage">Enter Message</label>
						    <textarea class="form-control" id="iMessage" rows="3"></textarea>
						  </div>
						  <div class="form-group">
			            	<img alt="Captcha" src="/captcha.jpg">
			            	<input placeholder="Enter Captcha" class="form-control" id="captcha">
			              </div>
						  
						  <button type="submit" class="btn btn-primary">Submit</button>
						</form>
				    </div>
				  </div>
				</div>
              </div>
    	</section>
    </div>
  </main>

	  <jsp:include page="/footer.jsp">
	  	<jsp:param value="contact" name="foot"/>
	  </jsp:include>
  
  <script src="../js/jquery-3.5.1.min.js"></script>
  <script src="../js/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/admin/js/validate.js" ></script>

<script type="text/javascript">
	$(document).ready(function(){
		$('#contact-form').submit(function(event){
			event.preventDefault();
			
			if(!$('#iName').val()){
				alert('Name cannot be left blank.');
			}else if(!$('#iEmail').val()){
				alert('Email ID cannot be left blank.');
			}else if(!$('#iMobile').val()){
				alert('Mobile number cannot be left blank.');
			}else if(!$('#iMessage').val()){
				alert('Message cannot be left blank.');
			}else if(!validateInput($('#iName').val(),5)){
				alert('Name contains invalid symbols');
			}else if(!validateInput($('#iMobile').val(),6)){
				alert('Mobile Number contains invalid symbols');
			}else if(!validateInput($('#iEmail').val(),1)){
				alert('Email ID contains invalid symbols');
			}else if(!validateInput($('#iMessage').val(),5)){
				alert('Message contains invalid symbols');
			}else if(!$('#captcha').val()){
				alert('Captcha cannot be left blank.');
			}else{
				$.ajax({
	                type : "POST",
	              	contentType: "application/x-www-form-urlencoded",
	                url : "/sh/contact",
	                data : {
	                	"name": $('#iName').val(),
	                	"mobile": $('#iMobile').val(),
	                	"message": $('#iMessage').val(),
	                	"email": $('#iEmail').val(),
	                	"captcha": $('#captcha').val()
	                },
	                success : function(data) {
	                    var status = data.status;
	                    alert(data.message);
	                    if (status == 'success') {
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