<%@ page contentType ="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>오스템인테리어</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
        integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/userInfromation.css">
    
    
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    
    <style>
        input[type="checkbox"] { -webkit-appearance: none; -moz-appearance: none; appearance: none; border: 2px solid #bcbcbc; border-radius: 4px; cursor: pointer; height: 16px; outline: 0; width: 16px; } 
        input[type="checkbox"]:checked { background: #bcbcbc; } 

        img.ui-datepicker-trigger {
                margin-left:0.5rem; vertical-align:middle; cursor:pointer;
                padding-bottom: 0.2rem;
                width: 1rem;
        }
    </style>
</head>

<body>
    <!-- ======= Header ======= -->
    <header id="header" class="fixed-top bg-white px-4">
        <div class="container-fluid d-flex align-items-center">
            <!-- navbar -->
            <nav id="navbar" class="navbar navbar-expand-sm navbar-light row flex-grow-1" >
                <a class="row" href="${pageContext.request.contextPath}/user/userHome"><img src="${pageContext.request.contextPath}/resources/images/osstem_ci.png" width="160rem"></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse vw-80 justify-content-end" id="collapsibleNavbar">
                    <ul class="navbar-nav" style="font-size: larger;">
                        <li class="nav-item dropdown pr-4 pt-4">
                            <a class="nav-link dropdown-toggle font-weight-bolder display-" href="#"
                                data-toggle="dropdown">오스템인테리어</a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item " href="#">연구소 소개</a>
                                <a class="dropdown-item" href="#">연혁</a>
                                <a class="dropdown-item" href="#">Special Benefit</a>
                                <a class="dropdown-item" href="#">오스템 특º장점</a>
                            </div>
                        </li>
                        <li class="nav-item dropdown pr-4 pt-4">
                            <a class="nav-link dropdown-toggle font-weight-bolder" href="#"
                                data-toggle="dropdown">인테리어목록</a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="#">테마</a>
                                <a class="dropdown-item" href="#">예산</a>
                                <a class="dropdown-item" href="#">평수</a>
                            </div>
                        </li>
                        <li class="nav-item font-weight-bolder pr-4 pt-4"><a class="nav-link" href="#">상담요청</a></li>
                        <li class="nav-item font-weight-bolder pr-4 pt-4"><a class="nav-link" href="${pageContext.request.contextPath}/user/login">로그인</a></li>
                    </ul>
                </div>
                <a href="${pageContext.request.contextPath}/user/userInformation" class="row pl-5 pt-4"><i class="bi bi-person-circle"></i></a>
            </nav>
        </div>
    </header>