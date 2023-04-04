<%@page import="com.linus.utility.Utility"%>
<%@page import="com.linus.utility.Constants"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% String val = request.getParameter("form"); %>
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <ul class="navbar-nav ml-auto">
      <li class="nav-item dropdown">
      	<a class="nav-link" data-toggle="dropdown" href="#"><%= Constants.NAME %></a>
        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
          <!-- <a href="#" class="dropdown-item dropdown-footer">Profile</a>
          <div class="dropdown-divider"></div> -->
          <a <% if(val.equals("password")){ %> href="#" <% }else{ %> href="/adm/en/cngpwd/<%= Utility.encodeString(Constants.ID+"_"+Constants.SESSION_ID) %>" <%} %> class="dropdown-item dropdown-footer">Change Password</a>          
          <div class="dropdown-divider"></div>
          <a class="btn btn-primary dropdown-item dropdown-footer" onclick="logout();">LOG OUT</a>
        </div>
      </li>
    </ul>
  </nav>
	<aside class="main-sidebar sidebar-dark-primary elevation-4">
	    <a href="/adm/en/dashboard" class="brand-link">
	      <img src="${pageContext.request.contextPath}/admin/img/AdminLTELogo.png" alt="ePaper Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
	      <span class="brand-text font-weight-light">ePaper Admin</span>
	    </a>
	    <div class="sidebar">
			<nav class="mt-2">
		        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
		          <li class="nav-item">
		            <a <% if(val.equals("dashboard")){ %> href="#" <% }else{ %> href="/adm/en/dashboard" <%} %> class="nav-link <% if(val.equals("dashboard")){ %> active <% } %>">
		              Dashboard
		            </a>
		          </li>
		          <li class="nav-item">
		            <a <% if(val.equals("news")){ %> href="#" <% }else{ %> href="/adm/en/newsletter?pg=Subscribers" <%} %> class="nav-link <% if(val.equals("news")){ %> active <% } %>">
		              Subscribers
		            </a>
		          </li>
		          <li class="nav-item">
		            <a <% if(val.equals("contact")){ %> href="#" <% }else{ %> href="/adm/en/contact?pg=Contact" <%} %> class="nav-link <% if(val.equals("contact")){ %> active <% } %>">
		              Contacts
		            </a>
		          </li>
		          <li class="nav-item">
		            <a <% if(val.equals("request")){ %> href="#" <% }else{ %> href="/adm/en/request" <%} %> class="nav-link <% if(val.equals("request")){ %> active <% } %>">
		              Requests
		            </a>
		          </li>
		        </ul>
		      </nav>
	    </div>
  </aside>