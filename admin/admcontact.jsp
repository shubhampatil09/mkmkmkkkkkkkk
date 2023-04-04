<%@page import="com.linus.dbconnection.DBConnection"%>
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

Connection connect = null;
Statement stmt = null;
ResultSet result = null;
%>    
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>ePaper | Contact</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/fontawesome-free/css/all.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/icheck-bootstrap.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/adminlte.min.css">
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">
	<jsp:include page="/admin/hnav.jsp">
		<jsp:param value="contact" name="form"/>
	</jsp:include>
  <div class="content-wrapper">
  	<br><br>
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <section class="col-lg-12">
          	<div class="container-fluid">
          		<div class="row">
          			<h2><%= request.getParameter("pg") %></h2>
          			<div class="col-sm-12 col-md-12 col-lg-12 col-xl-12">
          				<div class="card">
			              <div class="card-header">
			                <h3 class="card-title">Awaiting for contact</h3>
			              </div>
			              <div class="card-body">
			                <table id="member_table" class="table table-bordered table-hover">
			                  <thead>
			                  <tr>
			                  	<th>SNo</th>
			                  	<th>Name</th>
			                    <th>Email ID</th>
			                    <th>Mobile Number</th>
			                    <th>Message</th>
			                    <th>Created Date</th>
			                  </tr>
			                  </thead>
			                  <tbody>
			                <%
		                    	try{
		                    	connect = DBConnection.getConnection();
		                    	stmt = connect.createStatement();
		                    	result = stmt.executeQuery("SELECT `idcontact`,`name`,`email`,`mobile`,`message`,date_format(`created_date`,'%d-%m-%Y') as 'date' FROM `contact` where `active` = 'A';");
		                    	while(result.next()){
			                %>  
			                  <tr>
			                    <td><%= result.getString("idcontact") %></td>
			                    <td><%= result.getString("name") %></td>
			                    <td><%= result.getString("email") %></td>
			                    <td><%= result.getString("mobile") %></td>
			                    <td><%= result.getString("message") %></td>
			                    <td><%= result.getString("date") %></td>
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
			                  	<th>SNo</th>
			                  	<th>Name</th>
			                    <th>Email ID</th>
			                    <th>Mobile Number</th>
			                    <th>Message</th>
			                    <th>Created Date</th>
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
</body>
</html>
    