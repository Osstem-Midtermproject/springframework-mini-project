<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Osstem Interior Admin</title>
<style>
#chatcon {
	width: 18rem;
}

#msgArea {
	height: 25rem;
	overflow: auto;
}

.ui-dialog {
	padding: 0px!important;
}

.ui-widget.ui-widget-content {
	border: none!important;
	border-radius: 10px!important;
}

.ui-dialog-buttonset button {
	border: none !important;
	border-radius: 5px!important;
	background-color: #9ec9f1!important;
	color:white;
}

.ui-dialog-titlebar-close {
	display: none !important;
}

.ui-corner-all {
	border-radius: 3px!important;
}

.ui-dialog-titlebar {
	background-color: #9ec9f1!important;
	color: white !important;
}
.fc-col-header{
	color:black !important;
}
.fc-h-event {
	 border: 0px !important;
}
</style>

<%@ include file="/WEB-INF/views/common/src.jsp"%>
</head>

<body>
	<!-- ======= Header ======= -->
	<header id="header" class="header fixed-top d-flex align-items-center">

		<div class="d-flex align-items-center justify-content-between">
			<i class="bi bi-list toggle-sidebar-btn"></i> <a href="${pageContext.request.contextPath}/user/" class="logo d-flex align-items-center p-2"> <img src="${pageContext.request.contextPath}/resources/images/logo1.png">
			</a>

		</div>
		<!-- End Logo -->

		<nav class="header-nav ms-auto">
<<<<<<< HEAD
			<ul class="d-flex" style="width: 100%;">
				<li class="nav-item dropdown pe-3 d-flex align-items-center">
				<span style="color:white; margin-right: 0.75rem;">${user.uname}님</span>
=======
			<ul class="d-flex align-items-center">
<<<<<<< HEAD
				<li class="nav-item dropdown pe-3 d-flex align-items-center" style="width: 10%;">
				<span style="color:white;">${user.uname}김혜현님</span>
>>>>>>> branch 'master' of https://github.com/Osstem-Midtermproject/springframework-mini-project.git
				<a class="text-center icon position-relative " href="#"data-bs-toggle="dropdown" onclick="messageClick()">
								
								<i class="bi bi-bell-fill bi-person-circle"></i> 
								
								<span class="position-absolute top-0 start-100 translate-middle badge bg-danger badge-number" id="messageNo" ></span>
							</a>
					<div id="chatcon" class="dropdown-menu dropdown-menu-arrow-custom pb-0 pt-0">
						<div class="d-flex align-items-center justify-content-center" style="background-color: rgb(106, 178, 236); height: 4rem;">
							<label><b>채팅방</b></label>
						</div>
						<div>
							<div id="msgArea" class="col p-2" style="background-color: rgb(129, 189, 238);"></div>
							<div class="col-6"></div>
							<div class="input-group">
								<input type="text" id="msg" class="form-control" aria-label="Recipient's username" aria-describedby="button-addon2" />
								<button class="btn btn-outline-secondary" type="button" id="button-send">전송</button>
=======
				<li class="nav-item dropdown pe-3"><a class="nav-link nav-profile d-flex align-items-center pe-0" data-bs-toggle="dropdown"> 
					<span class="">${user.uname}님</span> 
					<i class="bi-person-circle p-3"></i>
					</a>
						<div id="chatcon" class="dropdown-menu dropdown-menu-arrow-custom pb-0 pt-0">
							<div class="d-flex align-items-center justify-content-center" style="background-color: rgb(106, 178, 236); height: 4rem;">
								<label><b>채팅방</b></label>
>>>>>>> refs/remotes/origin/JY
							</div>
							<div>
								<div id="msgArea" class="col p-2" style="background-color: rgb(129, 189, 238);"></div>
								<div class="col-6"></div>
								<div class="input-group">
									<input type="text" id="msg" class="form-control" aria-label="Recipient's username" aria-describedby="button-addon2" />
									<button class="btn btn-outline-secondary" type="button" id="button-send">전송</button>
								</div>
	
								<div class="col-6"></div>
							</div>
							<!-- End Profile Iamge Icon -->
						</div>
					</li>
				<!-- End Profile Nav -->
			</ul>
		</nav>
		<!-- End Icons Navigation -->
	</header>
	<!-- End Header -->
	<script>
var cnt=0;
function scrolldown(){

   const msgArea = $('#msgArea'); 
   msgArea.scrollTop(msgArea[0].scrollHeight);
}
$(function(){

    const username = "${user.uname}";

    $("#disconn").on("click", (e) => {
        disconnect();
    })
    
    $("#button-send").on("click", (e) => {
    	
        send();
      
        //css show
    });

    const websocket = new SockJS("${pageContext.request.contextPath}/echo");

    websocket.onmessage = onMessage;
    websocket.onopen = onOpen;
    websocket.onclose = onClose;

    function send(){
		
        let msg = document.getElementById("msg");

        console.log(username + ":" + msg.value);
        websocket.send(username + ":" + msg.value);
        msg.value = '';
    }
    
    //채팅창에서 나갔을 때
    function onClose(evt) {
        var str = username + ": 님이 방을 나가셨습니다.";
        websocket.send(str);
    }
    
    //채팅창에 들어왔을 때
    function onOpen(evt) {
        var str = username + ": 님이 입장하셨습니다.";
        websocket.send(str);
    }

    function onMessage(msg) {
        var data = msg.data;
        var sessionId = null;
        //데이터를 보낸 사람
        var message = null;
        var arr = data.split(":");

        for(var i=0; i<arr.length; i++){
            console.log('arr[' + i + ']: ' + arr[i]);
        }
       
        var cur_session = username;

        //현재 세션에 로그인 한 사람
        console.log("cur_session : " + cur_session);
        sessionId = arr[0];
        message = arr[1];

        console.log("sessionID : " + sessionId);
        console.log("cur_session : " + cur_session);

        //로그인 한 클라이언트와 타 클라이언트를 분류하기 위함
        if(!sessionId){
        	return;
        }
        else if(sessionId == cur_session){
            var str = "<div class='col-6'>";
            str += "<div class='alert alert-warning' style='width:230px;'>";
            str += "<b>" + sessionId + " : " + message + "</b>";
            str += "</div></div>";
            $("#msgArea").append(str);
            scrolldown();
        }
        else{
        	$("#messageNo").css("display","block");
        	cnt++;
            $("#messageNo").text(cnt);
            var str = "<div class='col-6'>";
            str += "<div class='alert ' style='width:230px; margin-left: 40px;background-color:#fff;'>";
            str += "<b>" + sessionId + " : " + message + "</b>";
            str += "</div></div>";
            $("#msgArea").append(str);
            scrolldown();
        }
    }
    })
    $('.dropdown-menu').click(function(e) {

         e.stopPropagation();
   });
   function messageClick(){
	   cnt=0;
	   $("#messageNo").css("display","none");
	   //css,hide
   }	

</script>