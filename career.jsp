<%@page import="com.linus.utility.Utility"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.linus.dbconnection.DBConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <link rel="stylesheet" href="../css/bootstrap.min.css">
  <link rel="stylesheet" href="../css/style.css" />
  <link rel="stylesheet" href="../css/responsive.css" />
  <title>ePaper | Career</title>
</head>

<body>
  <header>
    <div class="container-fluid">
    	<jsp:include page="/headermenu.jsp">
   			<jsp:param value="contact" name="form"/>
   		</jsp:include>  
    </div>
  </header>
  <main>
    <div class="container-fluid">
    	<div class="title">
    		<p class="title-content">CAREERS</p>
    	</div>
    	<hr>

    	<section>
    		 <div class="jumbotron">
                <div class="container">
				 <div class="row">
				    <div class="col-md-2 col-lg-2 col-xl-2"></div>
				    <div class="col-sm-12 col-md-8 col-lg-8 col-xl-8">
				    	<ul>
				    	<% 
				    		Connection connect = null;
				    		Statement stmt = null;
				    		ResultSet result = null;
				    		try{
				    			connect = DBConnection.getConnection();
				    			stmt = connect.createStatement();
				    			result = stmt.executeQuery("select * from careers where `active` = 'A';");
				    			while(result.next()){
				    		%>	
				    		<li><a class="nav-link" href="javascript://" id="<%= Utility.encodeString(result.getString("path")) %>" onclick="viewDoc(this)"><%= result.getString("title") %></a></li>          		
				    		<% 	}
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
				    			}catch(Exception e){e.printStackTrace();}
				    		}
				    	%>	
				    	</ul>
				    </div>
				  </div>
				</div>
              </div>
    	</section>
    </div>
  </main>

	  <jsp:include page="/footer.jsp">
	  	<jsp:param value="career" name="foot"/>
	  </jsp:include>
  
  <script src="../js/jquery-3.5.1.min.js"></script>
  <script src="../js/bootstrap.min.js"></script>

	<script type="text/javascript">
    	function viewDoc(element) {
	        window.location = getBaseURL()+"sh/doc?vacancy="+element.id;
	  	}
    	
    	function getBaseURL(){
	    	var arr = window.location.href.split("/");
	    	var result = arr[0] + "//" + arr[2]+"/";
	    	
	    	return result;
	    }
    </script>  
  
</body>

</html>