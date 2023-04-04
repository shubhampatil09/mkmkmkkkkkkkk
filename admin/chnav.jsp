<%@page import="com.linus.utility.Constants"%>
<%@page import="com.linus.utility.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	 <% String val = request.getParameter("form"); %> 
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <ul class="navbar-nav ml-auto">
      <li class="nav-item dropdown">
      	<a class="nav-link" data-toggle="dropdown" href="#"><%= Constants.NAME %></a>
        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
          <div class="dropdown-divider"></div>
          <a <% if(val.equals("password")){ %> href="#" <% }else{ %> href="/adm/cl/cngpwd/<%= Utility.encodeString(Constants.ID+"_"+Constants.SESSION_ID) %>" <%} %> class="dropdown-item dropdown-footer">Change Password</a>          
          <div class="dropdown-divider"></div>
          	<a class="btn btn-primary dropdown-item dropdown-footer" onclick="logout();">LOG OUT</a>
        </div>
      </li>
    </ul>
  </nav>
	<aside class="main-sidebar sidebar-dark-primary elevation-4">
	    <a href="/adm/cl/dashboard" class="brand-link">
	      <img src="${pageContext.request.contextPath}/admin/img/AdminLTELogo.png" alt="ePaper Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
	      <span class="brand-text font-weight-light">ePaper Admin</span>
	    </a>
	    
	    <div class="sidebar">
			<nav class="mt-2">
		        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
		          <li class="nav-item ">
		            <a <% if(val.equals("clientdash")){ %> href="#" <% }else{ %> href="/adm/cl/dashboard" <%} %> class="nav-link <% if(val.equals("clientdash")){ %> active <% } %>">
		              Dashboard
		            </a>
		          </li>
		          <% if(Constants.TYPE.equals("O")){ %>
		          <li class="nav-item ">
		            <a <% if(val.equals("member")){ %> href="#" <% }else{ %> href="/adm/cl/member/<%= Utility.encodeString(Constants.TEAM+"_"+Constants.SESSION_ID) %>" <%} %> class="nav-link <% if(val.equals("member")){ %> active <% } %>">
		              Members
		            </a>
		          </li>
		          <% } %>
		          <li class="nav-item ">
		            <a <% if(val.equals("storage")){ %> href="#" <% }else{ %> href="/adm/cl/storage/<%= Utility.encodeString(Constants.TEAM+"_"+Constants.SESSION_ID) %>" <%} %> class="nav-link <% if(val.equals("storage")){ %> active <% } %>">
		              Space Available
		            </a>
		          </li>
		          <li class="nav-item ">
		            <a <% if(val.equals("upload")){ %> href="#" <% }else{ %> href="/adm/cl/upload/<%= Utility.encodeString(Constants.TEAM+"_"+Constants.SESSION_ID) %>" <%} %> class="nav-link <% if(val.equals("upload")){ %> active <% } %>">
		              Upload File
		            </a>
		          </li>
		          <% if(Constants.TYPE.equals("O")){ %>
		          <li class="nav-item ">
		            <a <% if(val.equals("streq")){ %> href="#" <% }else{ %> href="/adm/cl/storagerequest/<%= Utility.encodeString(Constants.TEAM+"_"+Constants.SESSION_ID) %>" <%} %> class="nav-link <% if(val.equals("streq")){ %> active <% } %>">
		              Upgrade
		            </a>
		          </li>
		          <% } %>
		        </ul>
		      </nav>
	    </div>
  </aside>