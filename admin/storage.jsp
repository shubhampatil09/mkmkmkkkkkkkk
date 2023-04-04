<%@page import="org.json.JSONObject"%>
<%@page import="com.linus.utility.Utility"%>
<%@page import="java.sql.Types"%>
<%@page import="com.linus.dbconnection.DBConnection"%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="java.sql.Connection"%>
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
	boolean isValid = false;
	double used = 0.0,available = 0.0;
	
	try{
		if(team[1].length() > 5){
	    	isValid = true;
	    }	
	}catch(ArrayIndexOutOfBoundsException e){
		response.sendRedirect("/adm/en/error");
	}

	if(isValid){
		Connection connect = null;
		CallableStatement stmt = null;
		try{
			connect = DBConnection.getConnection();
			stmt = connect.prepareCall("{call sp_storage(?,?)}");
			stmt.setString(1, team[0]);
			stmt.registerOutParameter(2, Types.JAVA_OBJECT);
			stmt.execute();
			JSONObject obj = new JSONObject(stmt.getString(2));
			used = Double.parseDouble(obj.get("used").toString());	
			available = Double.parseDouble(obj.get("available").toString());		
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
	}
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>ePaper | Storage</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/fontawesome-free/css/all.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/icheck-bootstrap.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/adminlte.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/Chart.min.css">
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">
	<jsp:include page="/admin/chnav.jsp">
		<jsp:param value="storage" name="form"/>
	</jsp:include>
  <div class="content-wrapper">
  	<br><br>
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <section class="col-lg-12">
          		<div class="card">
	              <div class="card-header">
	                <h3 class="card-title">Storage Information</h3>
	              </div>
	              <div class="card-body">
	                <canvas id="donutChart" style="min-height: 350px; height: 350px; max-height: 350px; max-width: 100%;"></canvas>
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
	<script src="${pageContext.request.contextPath}/admin/js/Chart.min.js"></script>
	
	<script type="text/javascript">
		$(function(){
		    var donutChartCanvas = $('#donutChart').get(0).getContext('2d')
		    var donutData        = {
		      labels: [
		          'Available Space',
		          'Used Space'
		      ],
		      datasets: [
		        {
		          data: [<%= available %>,<%= used %>],
		          backgroundColor : ['#00a65a', '#f39c12'], // '#f56954', , '#00c0ef', '#3c8dbc', '#d2d6de'
		        }
		      ]
		    }
		    var donutOptions     = {
		      maintainAspectRatio : false,
		      responsive : true,
		    }
		    
		    var donutChart = new Chart(donutChartCanvas, {
		      type: 'doughnut',
		      data: donutData,
		      options: donutOptions
		    })
		})
	</script>
</body>
</html>
    
 