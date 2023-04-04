<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<footer class="main-footer">
	<strong>Copyright &copy; 2020 ePaper Pvt ltd.</strong>All rights reserved.
</footer>
<script>
	function logout() {
		$.ajax({
            type : "POST",
          	contentType: "application/x-www-form-urlencoded",
            url : "/sh/logout",
            success : function(data) {
                var status = data.status;
                if (status == 'success') {
                	window.location = data.form;
                }else{
                	alert(data.message);
                }
            },
            error : function(msg) {
                alert("Something went wrong! Please try again.");
            }
        });
	}
</script>