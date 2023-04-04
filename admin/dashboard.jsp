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
	response.addCookie(new Cookie("tm", String.valueOf(obj.getInt("id"))));
	Constants.TEAM = String.valueOf(obj.getInt("id"));
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
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/Chart.min.css">
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">
  <jsp:include page="/admin/hnav.jsp">
  	<jsp:param value="dashboard" name="form"/>
  </jsp:include>

  <div class="content-wrapper">
  	<br><br>
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-lg-3 col-6">
            <div class="small-box bg-info">
              <div class="inner">
                <h3>150</h3>
                <p>New Orders</p>
              </div>
              <div class="icon">
                <i class="ion ion-bag"></i>
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-6">
            <div class="small-box bg-success">
              <div class="inner">
                <h3>562<sup style="font-size: 20px">%</sup></h3>
                <p>Total Orders</p>
              </div>
              <div class="icon">
                <i class="ion ion-stats-bars"></i>
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-6">
            <div class="small-box bg-warning">
              <div class="inner">
                <h3>44</h3>
                <p>User Registrations</p>
              </div>
              <div class="icon">
                <i class="ion ion-person-add"></i>
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-6">
            <div class="small-box bg-danger">
              <div class="inner">
                <h3>625</h3>
                <p>Unique Visitors</p>
              </div>
              <div class="icon">
                <i class="ion ion-pie-graph"></i>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <section class="col-lg-12">
            <div class="card">
	              <div class="card-header">
	                <h3 class="card-title">Users Data</h3>
	              </div>
	              <div class="card-body">
	                <canvas id="donutChart" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
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
		          'Community',
		          'Economy',
		          'Platinum',
		          'Silver',
		          'Gold',
		          'Diamond'
		      ],
		      datasets: [
		        {
		          data: [1290,890,567,356,342,134],
		          backgroundColor : ['#f56954','#00a65a', '#3c8dbc', '#d2d6de', '#f39c12', '#00c0ef']  
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