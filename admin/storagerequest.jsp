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

%>    
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>ePaper | StorageRequest</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/fontawesome-free/css/all.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/icheck-bootstrap.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/adminlte.min.css">
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">
	<jsp:include page="/admin/chnav.jsp">
		<jsp:param value="streq" name="form"/>
	</jsp:include>
  <div class="content-wrapper">
  	<br><br>
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <section class="col-lg-12">
    		 <div class="jumbotron">
    		 	<div style="text-align: center;">
    		 		<h1 class="display-4">Upgrade to our premium plans</h1>
    		 		<p>Make your payment through any platform and share us the screenshot and transaction id for proof.</p>
    		 		<input type="hidden" id="userid" value="<%= team[0] %>">
    		 	</div>
                <hr class="my-4">
                <div class="container">
				  <div class="row">
				    <div class="col-sm">
				      	<div class="card" style="width: 18rem;">
						  <div class="card-body" style="text-align: center;">
						    <h5 class="card-title">Community</h5>
						    <p class="card-text">Get free 1GB storage plan.</p>
						    <p class="card-text">Transfer Rate 1 Mbps</p>
						    <p class="card-text">FREE</p>
						    <a href="#" class="btn btn-primary btn-md">CURRENT PLAN</a>
						  </div>
						</div>
				    </div>
				    <div class="col-sm">
				      	<div class="card" style="width: 18rem;">
						  <div class="card-body" style="text-align: center;">
						    <h5 class="card-title">Economy</h5>
						    <p class="card-text">Upgrade to 5GB storage plan.</p>
						    <p class="card-text">Transfer Rate 5 Mbps</p>
						    <p class="card-text">INR 4, 000/-</p>
						    <button class="btn btn-info btn-md" id="2" onclick="request(this.id);">UPGRADE</button>
						  </div>
						</div>
				    </div>
				    <div class="col-sm">
				    	<div class="card" style="width: 18rem;">
						  <div class="card-body" style="text-align: center;">
						    <h5 class="card-title">Silver</h5>
						    <p class="card-text">Upgrade to 50GB storage plan.</p>
						    <p class="card-text">Transfer Rate 10 Mbps</p>
						    <p class="card-text">INR 6, 000/-</p>
						    <button class="btn btn-info btn-md" id="3" onclick="request(this.id);">UPGRADE</button>
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
						    <p class="card-text">Transfer Rate 25 Mbps</p>
						    <p class="card-text">INR 10, 000/-</p>
						    <button class="btn btn-info btn-md" id="4" onclick="request(this.id);">UPGRADE</button>
						  </div>
						</div>
				    </div>
				    <div class="col-sm">
				    	<div class="card" style="width: 18rem;">
						  <div class="card-body" style="text-align: center;">
						    <h5 class="card-title">Platinum</h5>
						    <p class="card-text">Upgrade to 500GB storage plan.</p>
						    <p class="card-text">Transfer Rate 50 Mbps</p>
						    <p class="card-text">INR 20, 000/-</p>
						    <button class="btn btn-info btn-md" id="5" onclick="request(this.id);">UPGRADE</button>
						  </div>
						</div>
				    </div>
				    <div class="col-sm">
				    	<div class="card" style="width: 18rem;">
						  <div class="card-body" style="text-align: center;">
						    <h5 class="card-title">Diamond</h5>
						    <p class="card-text">Upgrade to 1TB storage plan.</p>
						    <p class="card-text">Transfer Rate 100 Mbps</p>
						    <p class="card-text">INR 40, 000/-</p>
						    <button class="btn btn-info btn-md" id="6" onclick="request(this.id);">UPGRADE</button>
						  </div>
						</div>
				    </div>
				  </div>
				</div>
              </div>
    	</section>
        </div>
      </div>
    </section>
  </div>
  <jsp:include page="/admin/footer.jsp"></jsp:include>
</div>
	<script src="${pageContext.request.contextPath}/admin/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/admin/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/admin/js/adminlte.min.js"></script>
		<script type="text/javascript">
		function request(id){
			$.ajax({
                type : "POST",
              	contentType: "application/x-www-form-urlencoded",
                url : "/sh/newreq",
                data : {
                	"scheme": id,
                	"id": $('#userid').val()
                },
                success : function(data) {
                    var status = data.status;
                    if (status == 'success') {
                    	window.location = data.form + "/" +data.param;
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
	</script>
</body>
</html>
    