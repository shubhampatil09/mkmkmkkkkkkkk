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
   			<jsp:param value="pricing" name="form"/>
   		</jsp:include>  
    </div>
  </header>
  <main>
    <div class="container-fluid">
    	<div class="title">
    		<p class="title-content">Pricing</p>
    	</div>
    	<hr>
    	<section>
    		<p class="about-intro" style="text-align: center;">
    		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ePaper is trusted by more than 30,000 organizations worldwide as one of the most widely
    		 deployed data sharing technologies on the planet - and the gold standard for file managment.
    	</p>
    	</section>
    	
    	<section>
    		 <div class="jumbotron">
    		 	<div style="text-align: center;">
    		 		<h1 class="display-4">Upgrade to our premium plans</h1>
                	<h3 class="display-4">Never stay out of Memory!</h3>
    		 	</div>
                <hr class="my-4">
                <div class="container">
				  <div class="row">
				    <div class="col-sm">
				      	<div class="card" style="width: 18rem;">
						  <div class="card-body" style="text-align: center;">
						    <h5 class="card-title">Community</h5>
						    <p class="card-text">Get free 1GB storage plan.</p>
						    <a href="/adm/en/login" class="btn btn-warning btn-md">UPGRADE</a>
						  </div>
						</div>
				    </div>
				    <div class="col-sm">
				      	<div class="card" style="width: 18rem;">
						  <div class="card-body" style="text-align: center;">
						    <h5 class="card-title">Economy</h5>
						    <p class="card-text">Upgrade to 5GB storage plan.</p>
						    <a href="/adm/en/login" class="btn btn-warning btn-md">UPGRADE</a>
						  </div>
						</div>
				    </div>
				    <div class="col-sm">
				    	<div class="card" style="width: 18rem;">
						  <div class="card-body" style="text-align: center;">
						    <h5 class="card-title">Silver</h5>
						    <p class="card-text">Upgrade to 50GB storage plan.</p>
						    <a href="/adm/en/login" class="btn btn-warning btn-md">UPGRADE</a>
						  </div>
						</div>
				    </div>
				 </div>
				 <br>
				 <div class="row">
				    <div class="col-sm">
				    	<div class="card" style="width: 18rem;">
						  <div class="card-body" style="text-align: center;">
						    <h5 class="card-title">Gold</h5>
						    <p class="card-text">Upgrade to 100GB storage plan.</p>
						    <a href="/adm/en/login" class="btn btn-warning btn-md">UPGRADE</a>
						  </div>
						</div>
				    </div>
				    <div class="col-sm">
				    	<div class="card" style="width: 18rem;">
						  <div class="card-body" style="text-align: center;">
						    <h5 class="card-title">Platinum</h5>
						    <p class="card-text">Upgrade to 500GB storage plan.</p>
						    <a href="/adm/en/login" class="btn btn-warning btn-md">UPGRADE</a>
						  </div>
						</div>
				    </div>
				    <div class="col-sm">
				    	<div class="card" style="width: 18rem;">
						  <div class="card-body" style="text-align: center;">
						    <h5 class="card-title">Diamond</h5>
						    <p class="card-text">Upgrade to 1TB storage plan.</p>
						    <a href="/adm/en/login" class="btn btn-warning btn-md">UPGRADE</a>
						  </div>
						</div>
				    </div>
				  </div>
				</div>
              </div>
    	</section>
    </div>
  </main>

	  <jsp:include page="/footer.jsp">
	  	<jsp:param value="pricing" name="foot"/>
	  </jsp:include>
  
  <script src="../js/jquery-3.5.1.min.js"></script>
  <script src="../js/bootstrap.min.js"></script>
</body>

</html>