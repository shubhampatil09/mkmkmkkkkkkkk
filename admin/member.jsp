<%@page import="com.linus.dbconnection.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.linus.utility.Constants"%>
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
		if(team[1] == null){
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
  <title>ePaper | Members</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/fontawesome-free/css/all.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/icheck-bootstrap.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/adminlte.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/dataTables.bootstrap4.min.css">
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">
	<jsp:include page="/admin/chnav.jsp">
		<jsp:param value="member" name="form"/>
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
		                <h3 class="card-title">Add your team members</h3>
		              </div>
		              <form id="mem-form" autocomplete="off">
		                <input type="hidden" id="uid" value="<%= Constants.ID %>" />
		                <div class="card-body">
		                  <div class="row">
		                  	  <div class="form-group col-sm-12 col-md-6 col-lg-6 col-xl-6">
			                    <label for="iname">Name</label>
			                    <input type="text" name="name" class="form-control" id="iname" placeholder="Enter Name">
			                  </div>
			                  <div class="form-group col-sm-12 col-md-6 col-lg-6 col-xl-6">
			                    <label for="idesignation">Designation</label>
			                    <input type="text" name="mobile" class="form-control" id="idesignation" placeholder="Enter designation">
			                  </div>
		                  </div>
		                  <div class="row">
			                  <div class="form-group col-sm-12 col-md-6 col-lg-6 col-xl-6">
			                    <label for="iemail">Email address</label>
			                    <input type="email" name="email" class="form-control" id="iemail" placeholder="Enter email">
			                  </div>
			                  <div class="form-group col-sm-12 col-md-6 col-lg-6 col-xl-6">
			                    <label for="imobile">Mobile Number</label>
			                    <input type="text" name="mobile" class="form-control" id="imobile" placeholder="Enter mobile number">
			                  </div>
		                  </div>
		                  <div class="row">
		                  <div class="form-group col-sm-12 col-md-6 col-lg-6 col-xl-6">
		                    <label for="isection">Section</label>
		                    <input type="text" name="section" class="form-control" id="isection" placeholder="Section">
		                  </div>
		                  <div class="form-group col-sm-12 col-md-6 col-lg-6 col-xl-6">
		                    <label for="ipassword">Password</label>
		                    <input type="password" name="password" class="form-control" id="ipassword" placeholder="Password">
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
          
          <!-- Table containg information of various members -->
          <section class="table-content">
          	<div class="container-fluid">
          		<div class="row">
          			<div class="col-sm-12 col-md-12 col-lg-12 col-xl-12">
          				<div class="card">
			              <div class="card-header">
			                <h3 class="card-title">List of existing team members</h3>
			              </div>
			              <div class="card-body">
			                <table id="member_table" class="table table-bordered table-hover">
			                  <thead>
			                  <tr>
			                    <th>Name</th>
			                    <th>Designation</th>
			                    <th>Section</th>
			                    <th>Email ID</th>
			                    <th>Mobile Number</th>
			                    <th>Created Date</th>
			                    <th>Actions</th>
			                  </tr>
			                  </thead>
			                  <tbody>
			                <%
			                	Connection connect = null;
		                    	Statement stmt = null;
		                    	ResultSet result = null;
		                    	try{
		                    	connect = DBConnection.getConnection();
		                    	stmt = connect.createStatement();
		                    	result = stmt.executeQuery("SELECT idmembers, name, designation, section, emailid, mobilenumber, date_format(created_date,'%d-%m-%Y') as 'date' FROM epaper.members where `active` = 'A' and teamid='"+ team[0] +"' order by name asc;");
		                    	while(result.next()){
			                %>  
			                  <tr>
			                    <td><%= result.getString("name") %></td>
			                    <td><%= result.getString("designation") %></td>
			                    <td><%= result.getString("section") %></td>
			                    <td><%= result.getString("emailid") %></td>
			                    <td><%= result.getString("mobilenumber") %></td>
			                    <td><%= result.getString("date") %></td>
			                    <td><button type="button" class="btn btn-danger" id="<%= result.getInt("idmembers") %>" onclick="deleteMember(this.id);">Delete</button></td>
			                  </tr>
			                  <% } 
		                    	}catch(Exception e){
		                    		e.printStackTrace();
		                    	}finally{
		                    		try{
		                    			if(connect != null){
		                    				connect.close();
		                    			}
		                    			
		                    			if(stmt != null){
		                    				stmt.close();
		                    			}
		                    			
		                    			if(result != null){
		                    				result.close();
		                    			}
		                    			
		                    		}catch(Exception e){
		                    			e.printStackTrace();
		                    		}
		                    	}
			                  %>
			                  </tbody>
			                  <tfoot>
			                  <tr>
			                    <th>Name</th>
			                    <th>Designation</th>
			                    <th>Section</th>
			                    <th>Email ID(s)</th>
			                    <th>Mobile Number</th>
			                    <th>Created Date</th>
			                    <th>Actions</th>
			                  </tr>
			                  </tfoot>
			                </table>
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
	<script src="${pageContext.request.contextPath}/admin/js/jquery.dataTables.min.js"></script>
	<script src="${pageContext.request.contextPath}/admin/js/dataTables.bootstrap4.min.js"></script>
	<script>
	  $(function () {
		  $('#member_table').DataTable({
		      "paging": true,
		      "lengthChange": false,
		      "searching": true,
		      "ordering": true,
		      "info": true,
		      "autoWidth": false,
		      "responsive": true,
		    });
	  });
	</script>
	
<script src="${pageContext.request.contextPath}/admin/js/validate.js" ></script>

<script type="text/javascript">
	$(document).ready(function(){
		$('#mem-form').submit(function(event){
			event.preventDefault();
			
			if(!$('#iname').val()){
				alert('Name cannot be left blank.');
			}else if(!$('#idesignation').val()){
				alert('Designation cannot be left blank.');
			}else if(!$('#iemail').val()){
				alert('Email ID cannot be left blank.');
			}else if(!$('#imobile').val()){
				alert('Mobile number cannot be left blank.');
			}else if(!$('#isection').val()){
				alert('Section cannot be left blank.');
			}else if(!$('#ipassword').val()){
				alert('Password cannot be left blank.');
			}else if(!validateInput($('#iname').val(),3)){
				alert('Name contains invalid symbols');
			}else if(!validateInput($('#idesignation').val(),5)){
				alert('Designation contains invalid symbols');
			}else if(!validateInput($('#imobile').val(),6)){
				alert('Mobile Number contains invalid symbols');
			}else if(!validateInput($('#iemail').val(),1)){
				alert('Email ID contains invalid symbols');
			}else if(!validateInput($('#isection').val(),5)){
				alert('Section contains invalid symbols');
			}else if(!validateInput($('#ipassword').val(),2)){
				alert('Password should be as per the format. It should have atleast [1 Uppercase, 1 lowercase, 1 numeric and 1 symbol and minium length should be 8]');
			}else{
				$.ajax({
	                type : "POST",
	              	contentType: "application/x-www-form-urlencoded",
	                url : "/sh/member",
	                data : {
	                	"name": $('#iname').val(),
	                	"designation": $('#idesignation').val(),
	                	"mobile": $('#imobile').val(),
	                	"section": $('#isection').val(),
	                	"email": $('#iemail').val(),
	                	"id": $('#uid').val(),
	                	"action": 'add',
	                	"password": $('#ipassword').val()
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

<script type="text/javascript">
	function deleteMember(memberID){
		$.ajax({
            type : "POST",
          	contentType: "application/x-www-form-urlencoded",
            url : "/sh/member",
            data : {
            	"id": memberID,
            	"action": 'del'
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
</script>
	
	
</body>
</html>
    