<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>
<div id="dialog" title="일정 관리" style="display: none">
	<div id="form-div">
		<form>
			<div class="form-group mt-2 mb-4">
				<label for="utitle">병원명</label> <input type="utitle" class="form-control" id="datetitle" />
				 <label for="utitle">주소</label> <input type="utitle" class="form-control" id="addresstitle" />
			</div>
			<div id="timebox" style="display: none">
				<label for="fromDate">시간 : </label> <input type="text" value="" placeholder="시작시간" id="time1" required size="8" maxlength="5" /> <input type="text" value="" placeholder="종료시간" id="time2" required size="8" maxlength="5" />
			</div>
			<div>
				<label for="utitle">시공종류</label> 
				<select class="form-select border-1" id="category" style="font-weight: 100; margin-bottom: 1.5rem;">			
					<option value="1">전기</option>
					<option value="2">설비</option>
					<option value="3">도배</option>
					<option value="4">가구</option>
				</select>
				<label for="utitle">팀</label> 
				<select class="form-select border-1"   id="team1"  style="font-weight: 100; margin-bottom: 1.5rem; display:none">
					<option selected>팀</option>
					<option value="1">A팀</option>
					<option value="2">B팀</option>
					<option value="3">C팀</option>
				</select>
				<select class="form-select border-1"   id="team2"  style="font-weight: 100; margin-bottom: 1.5rem; display:none">
					<option selected>팀</option>
					<option value="4">A팀</option>
					<option value="5">B팀</option>
					<option value="6">C팀</option>
				</select>
				<select class="form-select border-1"   id="team3"  style="font-weight: 100; margin-bottom: 1.5rem; display:none">
					<option selected>팀</option>
					<option value="7">A팀</option>
					<option value="8">B팀</option>
					<option value="9">C팀</option>
				</select>
				<select class="form-select border-1"   id="team4"  style="font-weight: 100; margin-bottom: 1.5rem; display:none">
					<option selected>팀</option>
					<option value="10">A팀</option>
					<option value="11">B팀</option>
					<option value="12">C팀</option>
				</select>
			</div>
			 <div class="mb-3">
            <label for="utitle" class="col-form-label">Message:</label>
            <textarea type="utitle" class="form-control" id="datecontent"></textarea>
          </div>
		</form>
	</div>
</div>
<main id="main" class="main">
	<div class="d-flex">
		<div class="pagetitle d-flex align-items-end">
			<h1>스케줄</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item">홈</li>
					<li class="breadcrumb-item">캘린더</li>
					<li class="breadcrumb-item active">시공</li>
				</ol>
			</nav>
		</div>
	</div>

	<div class="d-flex flex-column">
		<div class="mt-4 d-flex flex-row align-items-center justify-content-center" id="calendar-container">
	       <div id="sidecontainer" class="d-flex btn-group flex-column" role="group" style="margin-bottom: auto; margin-top:64px;"aria-label="Basic checkbox toggle button group">
		         <input type="checkbox" class="btn-check" id="btncheck1" autocomplete="off" />
		         <label id="select1" class="btn" for="btncheck1" onclick="showelec()">전기</label>
		
		         <input type="checkbox" class="btn-check" id="btncheck2" autocomplete="off" />
		         <label id="select2" class="btn" for="btncheck2" onclick="showequip()">설비</label>
		
		         <input type="checkbox" class="btn-check" id="btncheck3" autocomplete="off" />
		         <label id="select3" class="btn" for="btncheck3" onclick="showpaper()">도배</label>
		
		         <input type="checkbox" class="btn-check" id="btncheck4" autocomplete="off" />
		         <label id="select4" class="btn" for="btncheck4" onclick="showfurniture()">가구</label>
	       </div>
	       <div id="calendar" style="width: 80%"></div>
       </div>
	</div>
</main>
<script>
	
    function save(){
    	$(function(){
    		
    		if ($("#btncheck1")[0].checked === false) {
            	console.log(1);
            }else{
            	console.log(2);
            }	
    	})
    
    }
    
    var scheduleEvent=[];
    <c:forEach var="schedule" items="${cs}">
   		scheduleEvent.push({
   			id: "${schedule.consScheId}",
        	title:"${schedule.consScheHospitalName}",
        	start:  moment("${schedule.consScheStartdate}").format("YYYY-MM-DD"),
        	end:  moment("${schedule.consScheEnddate}").format("YYYY-MM-DD"),
        	extendedProps: {
        		teamid: "${schedule.consScheTeamId}",
        		content: "${schedule.consScheContent}",
        		category:"${schedule.constructionCategory.consCateType}",
        		address:"${schedule.consScheAddress}",
        		estart:moment("${schedule.consScheStartdate}").format("YYYY-MM-DD")
          	},
  		});	
   		
	</c:forEach>
    
      var id = 0;
      var calendar;
      var diaLogOpt = {
        title: "일정관리",
        modal: true, //모달대화상자
        resizable: true, //크기 조절 못하게
        width: "500",
        height: "500",
        show: { effect: "slideDown", duration: 100, /* SPECIF ARGUMENT */ times: 2 },
      };

      $(function () {
        $("#time1").timepicker({
          timeFormat: "HH:mm",
          interval: 30,
          dynamic: false,
          dropdown: true,
          scrollbar: true,
        });
        $("#time2").timepicker({
          timeFormat: "HH:mm",
          interval: 30,
          dynamic: false,
          dropdown: true,
          scrollbar: true,
        });
      });

      (function () {
        $(function () {
          // calendar element 취득
          var calendarEl = $("#calendar")[0];
          // full-calendar 생성하기
          calendar = new FullCalendar.Calendar(calendarEl, {
        	schedulerLicenseKey: "CC-Attribution-NonCommercial-NoDerivatives",
            height: "700px", // calendar 높이 설정
            expandRows: true, // 화면에 맞게 높이 재설정
            slotMinTime: "08:00", // Day 캘린더에서 시작 시간
            slotMaxTime: "20:00", // Day 캘린더에서 종료 시간
            // 해더에 표시할 툴바
            headerToolbar: {
              left: "prev,next",
              center: "title",
              right: "dayGridMonth,timeGridWeek,timeGridDay,listMonth",
            },
            eventTextColor: 'black',

            initialView: "dayGridMonth", // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
           
            navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
            editable: true, // 수정 가능?
            selectable: true, // 달력 일자 드래그 설정가능
            nowIndicator: true, // 현재 시간 마크
            dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
            locale: "ko", // 한국어 설정
            eventDidMount: function (info) {
              let title = info.event.title;
              let startday = moment(info.event.start).format("YYYY/MM/DD");
              let endday =
              moment(info.event.end).format("YYYY/MM/DD") != "Invalid date" ? moment(info.event.end).format("YYYY/MM/") + (Number(moment(info.event.end).format("DD"))-1).toString() : "";
              let content = info.event.extendedProps.content == true ? info.event.extendedProps.content : "";

              $(info.el).qtip({
                content: {
                  title: "<span id=qtitle"+id+">" + title + `</span>`,
                  text:
                    `<label>StartDay : </label><span id="qstart${id}">` +
                    startday +
                    `</span>` +
                    `<br><label>EndDay : </label><span id="qend${id}">` +
                    endday +
                    `</span>` +
                    `<br><label>Description : </label><span id="qcontent${id}">` +
                    content +
                    `</span>`,
                },
                style: "qtip-youtube",
                hide: {
                  delay: 200,
                  fixed: true,
                },
                position: {
                  target: "mouse", // Use the mouse position as the position origin
                  adjust: {
                    // Don't continuously  the mouse, just use initial position
                    mouse: false,
                  },
                },
              });
              id++;
           	  setcolor(info);
            },
            eventDrop: function (info) {
               let id=info.event.id;
               let start=moment(info.event.start).format("YYYY-MM-DD");
               let end=moment(info.event.end).format("YYYY-MM-")+(Number(moment(info.event.end).format("DD")));
               let content=info.event.extendedProps.content;
               let address=info.event.extendedProps.address;
               let estart=info.event.extendedProps.estart;
               scheduleUpdate(id,start,end,content,estart,address);
               info.event.setExtendedProp("estart",moment(info.event.start).format("YYYY-MM-DD"))
             },
            eventResize: function(info){
            	 let id=info.event.id;
                 let start=moment(info.event.start).format("YYYY-MM-DD");
               
                 let end=moment(info.event.end).format("YYYY-MM-")+(Number(moment(info.event.end).format("DD")));
               
                 let content=info.event.extendedProps.content;
                 let address=info.event.extendedProps.address;
                 let estart=info.event.extendedProps.estart;
                 scheduleUpdate(id,start,end,content,estart,address);
                 info.event.setExtendedProp("estart",moment(info.event.start).format("YYYY-MM-DD"))
            },
            eventAdd: function (info) {},
            eventChange: function (info) {},
            eventRemove: function (obj) {},
            eventClick: function (info) {
              console.log(info.event);
              if (!info.event.end) {
                $("#timebox").css("display", "block");
           
                var btnOpt = {
                  저장: function () {
                	disappear();
                    $(`#qtitle${info.event.id}`).text($("#datetitle").val());
                    $(`#qcontent${info.event.id}`).text($("#datecontent").val());
                    info.event.setProp("title", $("#datetitle").val());
                    info.event.setExtendedProp("content", $("#datecontent").val());
                    info.event.setExtendedProp("startTime", $("time1").val());
                    info.event.setExtendedProp("endTime", $("#time2").val());
                    $(this).dialog("close");
                  },
                  취소: function () {
                	  disappear();
                    $(this).dialog("close");
                  },
                };
              } else {
            	
                $("#timebox").css("display", "none");
                var btnOpt = {
                  저장: function () {
                	disappear();
                    $(`#qtitle${info.event.id}`).text($("#datetitle").val());
                    $(`#qcontent${info.event.id}`).text($("#datecontent").val());
                    info.event.setProp("title", $("#datetitle").val());
                    info.event.setExtendedProp("content", $("#datecontent").val());
                    $(this).dialog("close");
                  },
                  취소: function () {
                	disappear();
                    $(this).dialog("close");
                  },
                };
              }

              $("#datetitle").val(info.event.title);
              $("#addresstitle").val(info.event.extendedProps.address);
              $("#datecontent").val(info.event.extendedProps.content);
              $("#time1").val(info.event.extendedProps.startTime);
              $("#time2").val(info.event.extendedProps.endTime);   
              $("#category").val(Math.ceil(Number(info.event.extendedProps.teamid)/3)).prop("selected", true);
              var tid="team"+Math.ceil(Number(info.event.extendedProps.teamid)/3);
              $("#"+tid).val(info.event.extendedProps.teamid).prop("selected", true);
              $("#"+tid).css('display', 'block');
              var dOpt = diaLogOpt;
              dOpt.buttons = btnOpt;
              $("#dialog").dialog(dOpt);
              calendar.unselect();
            },
            select: function (arg) {
              // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
              
              let check = Number(moment(arg.end).format("DD")) - Number(moment(arg.start).format("DD"));
              if (check === 1) {
                $("#timebox").css("display", "block");
                var btnOpt = {
                  저장: function () {
                    id++;
                    console.log($("#category option:selected").text());
                 
                    calendar.addEvent({
                      id: id,
                      title: $("#datetitle").val(),
                      start: moment(arg.start).format("YYYY-MM-DD") + "T" + $("#time1").val(),
                      extendedProps: {
                        startTime: $("#time1").val(),
                        endtTime: $("#time2").val(),
                        content: $("#datecontent").val(),
                      },
                    });
                    $(this).dialog("close");
                  },
                  취소: function () {
                    $(this).dialog("close");
                  },
                };
              } else {
                $("#timebox").css("display", "none");
                var btnOpt = {
                  저장: function () {
                    id++;                   
                    disappear();
                    var tid="team"+$("#category option:selected").val(); 
                   
                    scheduleInsert($("#"+tid+" option:selected").val(),moment(arg.start).format("YYYY-MM-DD"),moment(arg.end).format("YYYY-MM-DD"),$("#datecontent").val(),$("#category option:selected").val(),$("#datetitle").val(),$("#addresstitle").val());
                    calendar.addEvent({
                      id: id,
                      title: $("#datetitle").val(),
                      start: moment(arg.start).format("YYYY-MM-DD"),
                      end: moment(arg.end).format("YYYY-MM-DD"),
                      allDay: arg.allDay,
                      extendedProps: {
                        content: $("#datecontent").val(),
                        address:$("#addresstitle").val(),
                        category:$("#category option:selected").val(),
                        teamId:$("#team option:selected").val(),
                        estart:moment(arg.start).format("YYYY-MM-DD")
                      },
                    });
                    
                    $(this).dialog("close");
                  },
                  취소: function () {
                	disappear();
                    $(this).dialog("close");
                  },
                };
              }
              $("#time1").val("");
              $("#time2").val("");
              $("#datetitle").val("");
              $("#addresstitle").val("");
              $("#datecontent").val("");
              $("#category").val("");
              $("#team1").val("");
              $("#team2").val("");
              $("#team3").val("");
              $("#team4").val("");
              var dOpt = diaLogOpt;
              dOpt.buttons = btnOpt;
              $("#dialog").dialog(dOpt);
              calendar.unselect();
            },
            // 이벤트
           
          });

          // 캘린더 랜더링
          calendar.render();
        });
      })();
      function showelec() {
    	  $(function () {
              let calEvents = calendar.getEvents();
              if ($("#btncheck1")[0].checked ===true) {
                for (e of calEvents) {
                  if (e.extendedProps.category === "전기") {
                    console.log(1);
                    e.setProp("display", "none");
                  }
                }
              } else {
                for (e of calEvents) {
                  console.log(e);
                  if (e.extendedProps.category === "전기") {
                    e.setProp("display", "block");
                  }
                }
              }
    	  });
        
      }
     function showequip(){
    	 $(function () {
    	let calEvents = calendar.getEvents();
    	 if ($("#btncheck2")[0].checked === true) {
             for (e of calEvents) {
               if (e.extendedProps.category === "설비") {
                 console.log(1);
                 e.setProp("display", "none");
               }
             }
           } else {
             for (e of calEvents) {
               if (e.extendedProps.category === "설비") {
                 console.log(1);
                 e.setProp("display", "block");
               }
             }
           }
    	 });
     }
     function showpaper(){
    	 $(function () {
    		 let calEvents = calendar.getEvents();
    	 if ($("#btncheck3")[0].checked === true) {
             for (e of calEvents) {
               if (e.extendedProps.category === "도배") {
                 console.log(1);
                 e.setProp("display", "none");
               }
             }
           } else {
             for (e of calEvents) {
               if (e.extendedProps.category === "도배") {
                 console.log(1);
                 e.setProp("display", "block");
               }
             }
           }
    	 });
     }
     function showfurniture(){
    	 $(function () {
    		 let calEvents = calendar.getEvents();
    	 if ($("#btncheck4")[0].checked === true) {
             for (e of calEvents) {
               if (e.extendedProps.category === "가구") {
                 console.log(1);
                 e.setProp("display", "none");
               }
             }
           } else {
             for (e of calEvents) {
               if (e.extendedProps.category === "가구") {
                 console.log(1);
                 e.setProp("display", "block");
               }
             }
           }
       });
     }
      $(function () {
    	 
    	  for (e of scheduleEvent) {
    		  if(Number(e.extendedProps.teamid)%3==1){
    			  e.title=e.title+" A팀";
    			  
    		  }else if(Number(e.extendedProps.teamid)%3==2){
    			  e.title=e.title+" B팀";
    			  
    		  }else{
    			  e.title=e.title+" C팀";
    			  
    		  }
              calendar.addEvent(e);
           }
      });
      function scheduleUpdate(id,start,end,content,estart,address){  
          $.ajax({
            url:"calendar",
           data:{id:id,
        	   			start:start,
        	   			end:end,
        	   			content,
        	   			estart:estart,
        	   			address:address
        	}
            
          }).done((data)=>{
          	
          });
        } 
      function scheduleInsert(teamId,start,end,content,categoryId,hospitalName,address){
    	  $.ajax({
              url:"calendarajax",
              type:'post',
              data:{teamId:teamId,
          	   			start:start,
          	   			end:end,
          	   			content,
          	   			categoryId:categoryId,
          	   			hospitalName:hospitalName,
          	   			address:address
          	}
              
            }).done((data)=>{
            	
            });
      }
      
      $('#category').change(function() {
      	if(this.value==1){
    	  	$('#team1').css('display', 'block');
		 }else{
			 $('#team1').css('display', 'none');
		 }
      	if(this.value==2){
      		$('#team2').css('display', 'block');
      	}else{
			 $('#team2').css('display', 'none');
		 }
      	if(this.value==3){
      		$('#team3').css('display', 'block');
      	}else{
			 $('#team3').css('display', 'none');
		 }
      	if(this.value==4){
      		$('#team4').css('display', 'block');
      	}else{
			 $("#team4").css('display', 'none');
		 }
   });
     function disappear(){
    	   $('#team1').css('display', 'none');
           $('#team2').css('display', 'none');
           $('#team3').css('display', 'none');
           $('#team4').css('display', 'none');
     }
     function setcolor(info){
    	  if (info.event.extendedProps.category === "전기") {
              
              $(info.el).css("background-color", "rgba(255, 99, 132, 0.2)");
            }
            else if (info.event.extendedProps.category === "설비") {
                
                $(info.el).css("background-color", "rgba(120, 100, 200, 0.2)");
              }
            else if (info.event.extendedProps.category === "도배") {
                
                $(info.el).css("background-color", "rgba(2000, 200, 132, 0.2)");
              }
            else if (info.event.extendedProps.category === "가구") {
                
                $(info.el).css("background-color", "rgba(54, 162, 235, 0.2)");
              }
     }
    
    </script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>