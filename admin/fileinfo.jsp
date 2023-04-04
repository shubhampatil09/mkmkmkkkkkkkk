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
  <title>ePaper Dashboard</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/fontawesome-free/css/all.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/icheck-bootstrap.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/adminlte.min.css">
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">
	<jsp:include page="/admin/chnav.jsp">
		<jsp:param value="fileInfo" name="form"/>
	</jsp:include>
  <div class="content-wrapper">
  	<br><br>
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <% 
          	try{
          		connect = DBConnection.getConnection();
          		stmt = connect.createStatement();
          		result = stmt.executeQuery("select *,if(created_by > 8000,(SELECT `name` FROM members where idmembers = media.created_by),(select `name` from registration where idregistration = media.created_by)) as 'name' from epaper.media where idmedia = "+ team[0] +";");
          		while(result.next()){
          		String path = result.getString("path");
          		String fileName = Utility.encodeString(path.substring(path.lastIndexOf("/")+1)+"_A120_");
          		String[] url_split =  (request.getRequestURL().toString()).split("/");
          		String host = url_split[0]+"//"+url_split[2];
          		
          %>
          
          <div class="col-lg-7">
          	<div class="card" style="padding: 20px;">
          		<div class="card-body">
          			<h3>File Information</h3>
          		</div>
          		<hr>
          		<h4><%= result.getString("title") %></h4>
          		<h5>Owner: <%= result.getString("name") %>, Date: <%= result.getString("created_date") %></h5>
          		<%= result.getString("remarks") %>
          	</div> 
          	
          	<div class="card" style="padding: 20px;">
	        	<div class="card-body">
	        		<h5>Shareable Link:</h5>
	        	</div>
	        	<p><%= host %>/fg/uvv/ws/share?pt=<%= fileName %></p>
	        </div>
 	
          </div>
          
          <% 	
          		}
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
          			
          		}catch(Exception e){
          			e.printStackTrace();
          		}
          	}
          %>
          <div class="col-lg-5">
          	<div class="card">
          		<div class="card-body">
          			<h3>Shared Among</h3>
          		</div>
          		<hr>
          		<div style="padding: 20px;">
          			<% 
          				try{
          					connect = DBConnection.getConnection();
          					stmt = connect.createStatement();
          					result = stmt.executeQuery("select `name` from members where idmembers in (SELECT member_id FROM epaper.media_mapping where media_id = "+team[0]+" and `active` = 'A') order by name asc;");
          				
          					while(result.next()){ 
          			%>
	          			<h6><%= result.getString("name") %></h6>
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
</body>
</html>
    