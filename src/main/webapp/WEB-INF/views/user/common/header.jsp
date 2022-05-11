<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>오스템인테리어</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/userInfromation.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

<style>
	* {
	   font-family: 'Noto Sans KR', sans-serif !important;
	}

	input[type="checkbox"] {
		-webkit-appearance: none;
		-moz-appearance: none;
		appearance: none;
		border: 2px solid #bcbcbc;
		border-radius: 4px;
		cursor: pointer;
		height: 16px;
		outline: 0;
		width: 16px;
	}
	
	input[type="checkbox"]:checked {
		background: #bcbcbc;
	}
	
	.bi-person-circle {
	    font-size: 2rem;
	    line-height: 2rem;
	    color: black;
	}
	
	.bi-person-circle:hover {
	    color: rgb(198, 171, 124);
	}
	
	.bg-custom .nav-link {
    	color: black;
	}
	
	.bg-custom .nav-item.active .nav-link,
	.bg-custom .nav-item:focus .nav-link,
	.bg-custom .nav-item:hover .nav-link {
    	color: rgb(198, 171, 124);
	}
	
	
</style>
</head>

<!-- 

219, 239, 250
178, 204, 241
185, 210, 251
156, 193, 245
59, 71, 121

 -->
<body>


	<!-- ======= Header ======= -->
	<header id="header" class="fixed-top shadow d-flex align-items-center bg-white" style="background-color: rgb(32, 54, 68);">
		<div class="container-fluid d-flex align-items-center mx-5">
			<div class="logo me-auto my-2">
				<a href="${pageContext.request.contextPath}/user/userHome"><img src="${pageContext.request.contextPath}/resources/images/insstemLogo.png" width="110rem"></a>
			</div>
			<nav id="navbar" class="navbar navbar-expand-sm navbar-white row flex-grow-1 bg-custom">
				<div class="collapse navbar-collapse vw-80 justify-content-end" id="collapsibleNavbar">
					<ul class="navbar-nav" style="font-size: large;">
						<li class="nav-item dropdown pr-4 pt-4"><a class="nav-link dropdown-toggle font-weight-bolder display-" href="#" data-toggle="dropdown">오스템인테리어</a>
							<div class="dropdown-menu">
								<a class="dropdown-item " href="#">연구소 소개</a> <a class="dropdown-item" href="#">연혁</a> <a class="dropdown-item" href="#">Special Benefit</a> <a class="dropdown-item" href="#">오스템 특º장점</a>
							</div></li>
						<li class="nav-item dropdown pr-4 pt-4"><a class="nav-link dropdown-toggle font-weight-bolder" href="#" data-toggle="dropdown">인테리어목록</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="#">테마</a> <a class="dropdown-item" href="#">예산</a> <a class="dropdown-item" href="#">평수</a>
							</div></li>
						<li class="nav-item font-weight-bolder pr-4 pt-4"><a class="nav-link" href="#">상담요청</a></li>

						<!-- security에서 사용자 권한에 따라 보여주는 것을 달리한다.  -->
						<sec:authorize access="isAnonymous()">
							<li class="nav-item font-weight-bolder pr-4 pt-4"><a class="nav-link" href="${pageContext.request.contextPath}/user/login">로그인</a></li>
						</sec:authorize>
						<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_USER')">
							<li class="nav-item font-weight-bolder pr-4 pt-4"><a class="nav-link" href="${pageContext.request.contextPath}/logout">로그아웃</a></li>
						</sec:authorize>
						<sec:authorize access="isAuthenticated()">
							<li class="nav-item font-weight-bolder pr-2 pt-4"><a href="${pageContext.request.contextPath}/user/userInformation"><i class="bi bi-person-circle"></i></a></li>
						</sec:authorize>
					</ul>
				</div>
			</nav>
		</div>
	</header>