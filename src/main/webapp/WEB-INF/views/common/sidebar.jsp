<%@ page contentType="text/html; charset=UTF-8"%>
<!-- ======= Sidebar ======= -->
<aside id="sidebar" class="sidebar">

   <ul class="sidebar-nav" id="sidebar-nav">

      <li class="nav-item"><a class="nav-link collapsed" href="${pageContext.request.contextPath}/dashboard"> <i class="bi bi-grid"></i><span>Dashboard</span>
      </a></li>
      <!-- End Dashboard Nav -->

      <li class="nav-item"><a class="nav-link collapsed" data-bs-target="#components-nav" data-bs-toggle="collapse" href="#"> <i class="bi bi-bar-chart-line-fill"></i><span>Analysis</span><i class="bi bi-chevron-down ms-auto"></i>
      </a>
         <ul id="components-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
            <li><a href="${pageContext.request.contextPath}/analysis/analysis"> <i class="bi bi bi-cash-coin"></i><span>Sales</span>
            </a></li>
            <li><a href="${pageContext.request.contextPath}/analysis/design"> <i class="bi bi-palette"></i><span>Design</span>
            </a></li>
            <li><a href="${pageContext.request.contextPath}/analysis/teamAnalysis"> <i class="bi bi bi-cash-coin"></i><span>TeamAnalysis</span>
            </a></li>
         </ul></li>
      <!-- End Analysis Nav -->

      <li class="nav-item"><a class="nav-link collapsed" data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#"> <i class="bi bi-calendar-check"></i><span>Schedule</span><i class="bi bi-chevron-down ms-auto"></i>
      </a>
         <ul id="forms-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
            <li class="nav-item"><a href="#" data-bs-target="#forms-schedule" data-bs-toggle="collapse"> <i class="bi bi-calendar-week"></i><span>Calendar</span><i class="bi bi-chevron-down ms-auto"></i>
            </a>
               <ul id="forms-schedule" class="nav-content collapse">
                  <li><a href="${pageContext.request.contextPath}/schedule/consultcalendar"> <span>-상담/AS</span>
                  </a></li>
                  <li><a href="${pageContext.request.contextPath}/schedule/calendar"> <span>-시공</span>
                  </a></li>
               </ul></li>

            <li><a href="${pageContext.request.contextPath}/schedule/scheduler"> <i class="bi bi-calendar-week-fill"></i><span>Scheduler</span>
            </a></li>

            <li class="nav-item"><a href="#" data-bs-target="#forms-list" data-bs-toggle="collapse"> <i class="bi bi-calendar-week"></i><span>List</span><i class="bi bi-chevron-down ms-auto"></i>
            </a>
               <ul id="forms-list" class="nav-content collapse">
                  <li><a href="${pageContext.request.contextPath}/schedule/counselingAndAsList"> <span>-상담/AS</span>
                  </a></li>
                  <li><a href="${pageContext.request.contextPath}/schedule/constructionList"> <span>-시공</span>
                  </a></li>
               </ul></li>


            <li><a href="${pageContext.request.contextPath}/schedule/team"> <i class="bi bi-collection"></i><span>Team</span>
            </a></li>
         </ul></li>
      <!-- End Schedule Nav -->

      <li class="nav-item"><a class="nav-link collapsed" data-bs-target="#charts-nav" data-bs-toggle="collapse" href="#"> <i class="bi bi-plus-circle"></i><span>Hospital</span><i class="bi bi-chevron-down ms-auto"></i>
      </a>
         <ul id="charts-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
            <li><a href="${pageContext.request.contextPath}/hospital/processing"> <i class="bi bi-clock-history"></i><span>시공 내역 Processing</span>
            </a></li>
            <li><a href="${pageContext.request.contextPath}/hospital/history"> <i class="bi bi-skip-backward"></i><span>History</span>
            </a></li>
            <li><a href="${pageContext.request.contextPath}/hospital/location"> <i class="bi bi-geo-alt"></i><span>Location</span>
            </a></li>
            <li><a href="${pageContext.request.contextPath}/hospital/contractHistory"> <i class="bi bi-envelope-paper"></i><span>Contract</span>
            </a></li>
         </ul></li>
      <!-- End Dentist Nav -->


      <li class="nav-item"><a class="nav-link collapsed" href="${pageContext.request.contextPath}/management"> <i class="bi bi-person-rolodex"></i><span>Management</span>
      </a></li>
      <!-- End Management Nav -->
   </ul>
<div id="chatcon" class="container">
   <div class="col-6">
      <label><b>채팅방</b></label>
   </div>
   <div>
      <div id="msgArea" class="col">
      
      </div>
      <div class="col-6">
      <div class="input-group mb-3"  style="width:250px;">
         <input type="text" id="msg" class="form-control" aria-label="Recipient's username" aria-describedby="button-addon2" >
         <div class="input-group-append">
            <button class="btn btn-outline-secondary" type="button" id="button-send">전송</button>
         </div>
      </div>
      
      </div>
   </div>
   <div class="col-6">
   </div>
</div>

 
<script type="text/javascript">
function scrolldown(){

   const msgArea = $('#msgArea'); 
   msgArea.scrollTop(msgArea[0].scrollHeight);
}
$(function(){

    const username = "${userid}";

    $("#disconn").on("click", (e) => {
        disconnect();
    })
    
    $("#button-send").on("click", (e) => {
        send();
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
        if(sessionId == cur_session){
            var str = "<div class='col-6'>";
            str += "<div class='alert alert-secondary' style='width:230px;'>";
            str += "<b>" + sessionId + " : " + message + "</b>";
            str += "</div></div>";
            $("#msgArea").append(str);
            scrolldown();
        }
        else{
            var str = "<div class='col-6'>";
            str += "<div class='alert alert-warning' style='width:230px;'>";
            str += "<b>" + sessionId + " : " + message + "</b>";
            str += "</div></div>";
            $("#msgArea").append(str);
            scrolldown();
        }
    }
    })
</script>
</aside>
<!-- End Sidebar-->