<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String val = request.getParameter("foot");
%>       
<footer class="footer">
    <div class="main-footer">
      <ul class="nav">
        <li class="nav-item">
          <a class="nav-link active" href="../../adm/en/terms">Terms</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/adm/en/privacy">Privacy</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Press</a>
        </li>
        <% if(val.equals("career")){ %>
        <li class="nav-item">
          <a class="nav-link" href="#">Careers</a>
        </li>
        <% }else{ %>
        <li class="nav-item">
          <a class="nav-link" href="/lg/career">Careers</a>
        </li>
        <% } %>
      </ul>
    </div>
  </footer>