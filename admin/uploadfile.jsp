<%@page import="com.linus.utility.Constants"%>
<%@page import="com.linus.utility.Utility"%>
<%@page import="com.linus.dbconnection.DBConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
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
%>    
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>ePaper | Upload</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/fontawesome-free/css/all.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/icheck-bootstrap.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/adminlte.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/select2.min.css">
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">
	<jsp:include page="/admin/chnav.jsp">
		<jsp:param value="upload" name="form"/>
	</jsp:include>
  <div class="content-wrapper">
  	<br><br>
    <section class="content">
      <div class="row">
          <section class="col-lg-12">
          <form id="upload-form" autocomplete="off" >
          	<div class="container-fluid">
		        <div class="row">
		         <div class="col-md-12 col-lg-12 col-xl-12">
		            <div class="card card-primary">
		              <div class="card-header">
		                <h3 class="card-title">Upload your file</h3>
		              </div>
		              <input type="hidden" name="id" value="<%= Constants.ID %>"/>
		                <div class="card-body">
		                  	<div class="form-group">
			                    <label for="ititle">Title</label>
			                    <input type="text" name="title" class="form-control" id="ititle" placeholder="Enter Title">
			                </div>
			                <div class="form-group">
			                	<label for="ifile">Attachment</label>
			                    <input type="file" name="file" class="form-control" id="ifile" placeholder="Choose file">
			            	</div>
		                	<div class="form-group">
			                	<label for="iRemark">Remarks</label>
			                    <textarea class="form-control" name="remark" id="iremark" rows="3" placeholder="Remarks"></textarea>
			            	</div>
		                </div>
		            </div>
		          </div>
		        </div>
		        
		        <div class="row">
			      	<div class="col-lg-12">
			      		<div class="form-group">
			                  <label>Share Files</label>
			              <% 
			              	Connection connect = null;
			                Statement stmt = null;
			                ResultSet result = null;
			                String url = request.getRequestURL().toString();
			                String[] team = Utility.decode(url.substring(url.lastIndexOf("/")+1)).split("_");
			                try{
			                	if(team[1] == null){
				                	team[0] = "' or 1=1; -- ";
				                }	
			                }catch(ArrayIndexOutOfBoundsException e){
			                	team[0] = "' or 1=1; -- ";
			                }
			                
			                try{
			                	connect = DBConnection.getConnection();
			                	stmt = connect.createStatement();
			                	result = stmt.executeQuery("select idmembers,name from members where active = 'A' and teamid='"+ team[0] +"';");
			                			
			              %>    
			                  <select class="form-control mselect" name="sharemembers"id="members" multiple="multiple" data-placeholder="Select members" style="width: 100%;">
			                  <% while(result.next()){ %> 
			                  	<option value="<%= result.getString("idmembers") %>"><%= result.getString("name") %></option>
			                  <% } %>  
			                  </select>
			              <% 
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
		        
				<div class="card-footer" style="width: 100%;text-align: center;">
		        	<button type="submit" class="btn btn-primary">Submit</button>
		        </div>        
				        
		      </div>

		     </form>
          </section>
        </div>
    </section>
  </div>
  <jsp:include page="/admin/footer.jsp"></jsp:include>
</div>
	<script src="${pageContext.request.contextPath}/admin/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/admin/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/admin/js/adminlte.min.js"></script>
	<script src="${pageContext.request.contextPath}/admin/js/select2.full.min.js"></script>
	<script src="${pageContext.request.contextPath}/admin/js/validate.js" ></script>
	
	<script type="text/javascript">
	$(document).ready(function(){
		$('.mselect').select2();
		
		$('#upload-form').submit(function(event){
			//console.log($('.mselect').val());
			//var selected = $('.mselect').select2("data");
			//for (var i = 0; i <= selected.length-1; i++) {
			//    console.log(selected[i].text);
			//}
			event.preventDefault(); 
				if(!$('#ititle').val()){
					alert("Title cannot be empty!");
				}else if(!$('#iremark').val()){
					alert("Remarks cannot be left empty.");
				}else if($('#ifile')[0].files.length === 0){
					alert("File cannot be left empty.");
				}else if(!validateInput($('#ititle').val(),3)){
					alert('Title contains invalid characters.');
				}else if(!validateInput($('#iremark').val(),3)){
					alert('Remarks contains invalid characters.');
				}else{
					var form = $("#upload-form")[0];
		            var data = new FormData(form);
		            $.ajax({
		                type : "POST",
		                encType : "multipart/form-data",
		                url : "/sh/upload",
		                cache : false,
		                processData : false,
		                contentType : false,
		                data : data,
		                success : function(msg) {
		                    var status = msg.status;
		                    if (status == 'success') {
		                        alert(msg.message);
		                      	location.reload();
		                    } else {
		                        alert(msg.message);
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
    