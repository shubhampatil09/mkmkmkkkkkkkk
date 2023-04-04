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
	if(!team[2].equals(request.getSession().getId())){
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
  <title>ePaper | Upgrade</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/fontawesome-free/css/all.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/icheck-bootstrap.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/adminlte.min.css">
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">
	<jsp:include page="/admin/chnav.jsp">
		<jsp:param value="process" name="form"/>
	</jsp:include>
  <div class="content-wrapper">
  	<br><br>
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <section class="col-lg-12">
          	<div class="container-fluid">
		        <div class="row">
		         <div class="col-md-12 col-lg-12 col-xl-12">
		            <div class="card card-primary">
		              <div class="card-header">
		                <h3 class="card-title">Payment Information</h3>
		              </div>
		              <form id="payment-form" autocomplete="off">
		                <div class="card-body">
		               	<input type="hidden" name="user" value="<%= team[0] %>">
		               	<input type="hidden" name="scheme" value="<%= team[1] %>">
		                  <div class="row">
		                  	  <div class="form-group col-sm-12 col-md-6 col-lg-6 col-xl-6">
			                    <label for="itransaction">Transaction ID</label>
			                    <input type="text" name="transaction" class="form-control" id="itransaction" placeholder="Enter Transaction ID">
			                  </div>
			                  <div class="form-group col-sm-12 col-md-6 col-lg-6 col-xl-6">
			                    <label for="ifile">Password</label>
			                    <input type="file" name="file" class="form-control" id="ifile" placeholder="Upload file">
			                  	<span>Support only PDF,JPEG,JPG and PNG file formats.</span>
			                  </div>
		                  </div>
		                </div>
		                <div class="card-footer">
		                  <button type="submit" class="btn btn-primary">Submit</button>
		                </div>
		              </form>
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
	<script src="${pageContext.request.contextPath}/admin/js/validate.js" ></script>
	
	<script type="text/javascript">
	$(document).ready(function(){
		$('#payment-form').submit(function(event){
			event.preventDefault(); 
				if(!$('#itransaction').val()){
					alert("Transaction cannot be empty!");
				}else if($('#ifile')[0].files.length === 0){
					alert("File cannot be left empty.");
				}else if(!validateInput($('#itransaction').val(),5)){
					alert('Transaction ID contains invalid characters.');
				}else{
					var form = $("#payment-form")[0];
		            var data = new FormData(form);
		            $.ajax({
		                type : "POST",
		                encType : "multipart/form-data",
		                url : "/sh/payment",
		                cache : false,
		                processData : false,
		                contentType : false,
		                data : data,
		                success : function(msg) {
		                    var status = msg.status;
		                    if (status == 'success') {
		                        alert(msg.message);
		                        window.location = msg.form;
		                    } else {
		                        alert("Couldn't upload file");
		                    }
		                },
		                error : function(msg) {
		                    alert("Couldn't upload file");
		                }
		            });	
				}
				
			});
	});
	</script>
</body>
</html>
    