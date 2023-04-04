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
   			<jsp:param value="aboutus" name="form"/>
   		</jsp:include>  
    </div>
  </header>
  <main>
    <div class="container-fluid">
    	<div class="title">
    		<p class="title-content">Who are we?</p>
    	</div>
    	<hr>
    	<section>
    		<p class="about-intro">
    		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ePaper is a sharing service to transfer large files from point A to point B. 
    		With it you can send all types of large documents of up to 5 GB (photos, videos, audio, documents...) 
    		to your friends, co-workers, or family, so you can all easily have access to them on all your devices. 
    		<br><br>
    		We offer two different ways to share your files: send your files to one or several e-mail addresses or 
    		get a sharing link that you can easily use to share your content on your favorite forum or social media!
			ePaper also offers a Premium service to address your suggestions and different personal and professional
			needs. With our Premium offering, you push the limits of ePaper and get additional features and 
			extended transfer limits as well as other significant benefits.
    	</p>
    	</section>
    	
    	<section>
    		 <div class="jumbotron">
                <h1 class="display-4">Easy as pie</h1>
                <hr class="my-4">
                <p class="lead">Once you try ePaper you won't be able to live without it.</p>
                <p>It will help you in your day to day activities. It can be managed and a can be accessed at any point of time.</p>
                <p class="lead">
                  <a class="btn btn-primary btn-lg" href="/adm/en/login" role="button">TRY NOW</a>
                </p>
              </div>
    	</section>
    </div>
  </main>

	<jsp:include page="/footer.jsp">
	  	<jsp:param value="about" name="foot"/>
	</jsp:include>
  
  <script src="../js/jquery-3.5.1.min.js"></script>
  <script src="../js/bootstrap.min.js"></script>
</body>

</html>