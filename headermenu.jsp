<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	String val = request.getParameter("form");
%>    
<nav class="navbar navbar-expand-lg navbar-light">
        <h2 class="card-title"><a class="navbar-brand" href="#">ePaper</a></h2>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
          aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav ml-auto">
            <% if(val.equals("home")){ %>
	            <li class="nav-item active px-2">
	              <a class="nav-link" href="#">Home  <span class="sr-only">(current)</span></a>
	            </li>
            <% }else {%>
	            <li class="nav-item px-2">
	              <a class="nav-link" href="/lg/home">Home</a>
	            </li>
            <% } %>
            
            <% if(val.equals("aboutus")){ %>
	            <li class="nav-item active px-2">
              		<a class="nav-link" href="#">About <span class="sr-only">(current)</span></a>
            	</li>
            <% }else {%>
	            <li class="nav-item px-2">
              		<a class="nav-link" href="/lg/about">About</a>
            	</li>
            <% } %>
            
            <% if(val.equals("pricing")){ %>
	            <li class="nav-item active px-2">
              		<a class="nav-link" href="#">Pricing <span class="sr-only">(current)</span></a>
            	</li>
            <% }else {%>
	            <li class="nav-item px-2">
              		<a class="nav-link" href="/lg/price">Pricing</a>
            	</li>
            <% } %>
            
            <% if(val.equals("contact")){ %>
	            <li class="nav-item active px-2">
              		<a class="nav-link" href="#">Contact <span class="sr-only">(current)</span></a>
            	</li>
            <% }else {%>
	            <li class="nav-item px-2">
              		<a class="nav-link" href="/lg/contact">Contact</a>
            	</li>
            <% } %>

	            <li class="nav-item px-2">
              		<a class="nav-link" href="/adm/en/login"><button type="button" class="btn btn-primary" style="height: auto;">Sign In</button></a>
            	</li>
          </ul>
        </div>
      </nav>