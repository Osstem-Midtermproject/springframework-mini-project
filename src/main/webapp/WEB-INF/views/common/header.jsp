<%@ page contentType ="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Osstem Interior Admin</title>
 	<%@ include file="/WEB-INF/views/common/src.jsp"%>
</head>

<body>
	<!-- ======= Header ======= -->
	<header id="header" class="header fixed-top d-flex align-items-center">
	
		<div class="d-flex align-items-center justify-content-between">
	      <i class="bi bi-list toggle-sidebar-btn"></i>
	      <a href="index.html" class="logo d-flex align-items-center p-2">
	        <img src="${pageContext.request.contextPath}/resources/images/osstem_ci.png">
	      </a>
	    </div><!-- End Logo -->
	
	    <nav class="header-nav ms-auto">
	      <ul class="d-flex align-items-center">
	        <li class="nav-item dropdown pe-3">
	          <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
	            <span class="">전병천</span>
	            <i class="bi-person-circle p-3"></i>
	          </a><!-- End Profile Iamge Icon -->
	        </li><!-- End Profile Nav -->
	      </ul>
	    </nav><!-- End Icons Navigation -->
	  </header><!-- End Header -->