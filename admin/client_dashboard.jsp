<%@page import="com.linus.dbconnection.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.linus.utility.Constants"%>
<%@page import="com.linus.utility.Utility"%>
<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
	if(request.getSession().getAttribute("param") == null){ 
		response.sendRedirect("/adm/en/login");
	}else if(!((request.getRequestURL().toString()).substring((request.getRequestURL().toString()).lastIndexOf("/")+1)).equals("dashboard")){
		String url = request.getRequestURL().toString();
		JSONObject obj = new JSONObject(Utility.decode(url.substring(url.lastIndexOf("/")+1)));
		
		response.addCookie(new Cookie("gl", request.getSession().getId()));
		Constants.SESSION_ID = request.getSession().getId();
		if(obj.getString("type").equals("C")){
			response.addCookie(new Cookie("tm", obj.getString("team")));
			Constants.TEAM = obj.getString("team");
		}else{
			response.addCookie(new Cookie("tm", String.valueOf(obj.getInt("id"))));
			Constants.TEAM = String.valueOf(obj.getInt("id"));
		}
		response.addCookie(new Cookie("tp", obj.getString("type")));
		Constants.TYPE = obj.getString("type");
		response.addCookie(new Cookie("id", String.valueOf(obj.getInt("id"))));
		Constants.ID = String.valueOf(obj.getInt("id"));
		Constants.NAME = obj.getString("name");
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
  <title>ePaper | Dashboard</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/fontawesome-free/css/all.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/icheck-bootstrap.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/adminlte.min.css">
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">
	<jsp:include page="/admin/chnav.jsp">
		<jsp:param value="clientdash" name="form"/>
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
          		result = stmt.executeQuery("SELECT idmedia, title,`path`, remarks FROM epaper.media "+ 
					          					" where media.`active` = 'A' and (media.created_by = "+ Constants.ID+
					          					"  or media.idmedia in (select media_mapping.media_id from media_mapping"+
					          					" where media_mapping.member_id = "+ Constants.ID+" and media_mapping.`active` = 'A'));");
          		
          		String path,filename = null;
          		while(result.next()){ 
          			path = result.getString("path");
          			filename = path.substring(path.lastIndexOf("/")+1);
          %>
          <div class="col-sm-3 col-md-4 col-lg-3 col-xl-3">
          	<div class="card card-primary card-outline" style="width: 15rem;">
          		<div class="card-body">
          	  		<h3 class="card-title" style="font-size: xx-large;;font-weight: bolder;">EF00<%= result.getString("idmedia") %></h3>
          	  		<p class="card-text"><%= result.getString("title") %></p>
    				
    				 <nav class="navbar navbar-expand ">
					    <ul class="navbar-nav ">
					      <li class="nav-item">
					        <a href="/adm/cl/info/<%= Utility.encodeString(result.getInt("idmedia") + "_"+Constants.SESSION_ID) %>"><img title="View" class="btn btn-primary" alt="View Details" src="${pageContext.request.contextPath}/admin/img/preview.svg"></a>
					      	<span>&nbsp;</span>
					      </li>
					      <%-- <li class="nav-item">
					        <img title="Share"  class="btn btn-primary" alt="Share" src="${pageContext.request.contextPath}/admin/img/share.svg">
					      </li> --%>
					      <li class="nav-item">
					        <img title="Delete"  class="btn btn-primary" id="<%= result.getInt("idmedia") %>" alt="delete" src="${pageContext.request.contextPath}/admin/img/delete.svg" onclick="rmFile(this.id);">
					      	<span>&nbsp;</span>
					      </li>
					      <li class="nav-item">
					        <a href="/sh/download?file=<%= filename %>"><img title="Download"  class="btn btn-primary" alt="download" src="${pageContext.request.contextPath}/admin/img/download.svg"></a>
					      	<span>&nbsp;</span>
					      </li>
					    </ul>
					 </nav>
          	  	</div>
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
		function rmFile(transferID){
			$.ajax({
		        type : "POST",
		      	contentType: "application/x-www-form-urlencoded",
		        url : "/sh/dashboard",
		        data : {
		        	"id": transferID
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
	</script>
</body>
</html>
    