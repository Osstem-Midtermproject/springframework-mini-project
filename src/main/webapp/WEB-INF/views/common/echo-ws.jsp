<%@ page session="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    <form id="chatForm">
        <div class="chat_start_main">
            상담 CHAT
        </div>
        <div class="chat_main" style="display:none;">
            <div class="modal-header" style="height:300px;">
                상담 CHAT 
            </div>
            <div class="modal-content" id="chat" style="height:300px;">
                
            </div>
            <div class="modal-footer">
                <input type="text" id="message" class="form-control" style="height:100px;" placeholder="메세지를 입력하세요"/>    
            </div>
        </div>
<!--         <button class="">send</button> -->
    </form>
    <script>
//전역변수 선언-모든 홈페이지에서 사용 할 수 있게 index에 저장
var socket = null;
$(document).ready(function(){
	console.log($("#sessionUserId").val());
	console.log($("#session_id").val());
    connectWS();
});
    $(".chat_start_main").click(function(){
        $(this).css("display","none");
        $(".chat_main").css("display","inline");
    })
    $(".chat_main .modal-header").click(function(){
        $(".chat_start_main").css("display","inline");
        $(".chat_main").css("display","none");
    });
 
    function connectWS(){
        var sock = new SockJS("${pageContext.request.contextPath}/echo");
        socket =sock;
        
        sock.onopen = function() {
               console.log('info: connection opened.');
        };
        sock.onerror = function(event){
        	  console.log(event);

        }
        sock.onmessage = function(e){
           /*  console.log(e);
             var strArray = e.data.split(":");
             if(e.data.indexof(":") > -1){
                 $(".chat_start_main").text(strArray[0]+"님이 메세지를 보냈습니다.");
             }
             else{
             } */
            console.log(e);
            $("#chat").append(e.data + "<br/>");
        }
        sock.onclose = function(){
            $("#chat").append("연결 종료");
             // setTimeout(function(){connectWS();} , 10000); 
        }
        sock.onerror = function (err) {console.log('Errors : ' , err);};
 
        $("#chatForm").submit(function(event){
            event.preventDefault();
            	console.log($("#message").val());
                sock.send($("#message").val());
                $("#message").val('').focus();    
        });
    }
</script>


