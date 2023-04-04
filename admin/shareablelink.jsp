<%@page import="com.linus.utility.Utility"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ePaper</title>
</head>
<body>
<%
String fileName = request.getParameter("pt");
String fname = Utility.decode(fileName);
fileName = fname.substring(0,fname.indexOf("_A120_"));
File path = new File(getServletContext().getRealPath("/") + "/uploads/"+fileName);
response.setContentType("application/octet-stream");   
response.setHeader("Content-Disposition","attachment; filename=\"" + fileName + "\"");   
FileInputStream fileInputStream = new FileInputStream(path);  
int i;   
while ((i=fileInputStream.read()) != -1) {  
  out.write(i);   
}   
fileInputStream.close(); 
%>

</body>
</html>