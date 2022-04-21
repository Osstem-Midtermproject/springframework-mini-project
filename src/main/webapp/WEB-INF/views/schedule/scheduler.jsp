<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>
  <div id="dialog" title="일정 관리" style="display: none">
      <div id="form-div">
        <form>
          <div class="form-group mt-2 mb-4">
            <label for="utitle">일정내용</label>
            <input type="utitle" class="form-control" id="datetitle" />
          </div>
          <div id="timebox" style="display: none">
            <label for="fromDate">시간 : </label>
            <input type="text" value="" placeholder="시작시간" id="time1" required size="8" maxlength="5" />
            <input type="text" value="" placeholder="종료시간" id="time2" required size="8" maxlength="5" />
          </div>
          <div class="form-group mt-2 mb-4">
            <label for="utitle">내용</label>
            <input type="utitle" class="form-control" id="datecontent" style="height: 140px" />
          </div>
        </form>
      </div>
    </div>
    
    <main id="main" class="main">
      <div class="d-flex flex-column">
        <div class="card">
          <div class="card-body">
            <div class="d-flex flex-row">
              
              <div style="margin-left: auto">
                <div id="sidecontainer" class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
                  <input type="checkbox" class="btn-check" id="btncheck1" autocomplete="off" />
                  <label id="select1" class="btn" for="btncheck1">전기</label>
      
                  <input type="checkbox" class="btn-check" id="btncheck2" autocomplete="off" />
                  <label id="select2" class="btn" for="btncheck2">벽지</label>
      
                  <input type="checkbox" class="btn-check" id="btncheck3" autocomplete="off" />
                  <label id="select3" class="btn" for="btncheck3">인테리어</label>
                </div>
              </div>
            </div>
            <div class="mt-4" id="calendar-container">
              <div id="calendar"></div>
            </div>
          </div>
        </div>
        <div class="card">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">팀 목록</h5>
              <div class="team-wrapper d-flex justify-content-between">
                <div id="elec" class="col-lg-4">
                 
                </div>

                <div id="wall" class="col-lg-4">
                 
                </div>

                <div id="interior" class="col-lg-4">
                
                </div>
              </div>
            </div>
        </div>
      </div>
    </main>
    <script>
      var id = 1;
      var diaLogOpt = {
        title: "일정관리",
        modal: true, //모달대화상자
        resizable: true, //크기 조절 못하게
        width: "500",
        height: "500",
      };

      (function () {
        $(function () {
          // calendar element 취득
          var calendarEl = $("#calendar")[0];
          // full-calendar 생성하기
          var calendar = new FullCalendar.Calendar(calendarEl, {
            schedulerLicenseKey: "CC-Attribution-NonCommercial-NoDerivatives",
            initialView: "resourceTimeline",
            height: 300,
            aspectRatio: 1.5,
            expandRows: true, // 화면에 맞게 높이 재설정
            slotMinTime: "09:00", // Day 캘린더에서 시작 시간
            slotMaxTime: "22:00", // Day 캘린더에서 종료 시간
            eventMinHeight:80,
            // 해더에 표시할 툴바
            headerToolbar: {
              left: "prev,next",
              center: "title",
              right: "resourceTimelineDay,resourceTimelineWeek,resourceTimelineMonth",
            },

            navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
            editable: true, // 수정 가능?
            selectable: true, // 달력 일자 드래그 설정가능
           

            locale: "ko", // 한국어 설정
            eventDidMount: function (info) {
              let title = info.event.title;
              let startday = moment(info.event.start).format("YYYY/MM/DD");
              let endday =
                moment(info.event.end).format("YYYY/MM/DD") != "Invalid date" ? moment(info.event.end).format("YYYY/MM/") + (Number(moment(info.event.end).format("DD")) - 1).toString() : "";
              let content = info.event.extendedProps.content == true ? info.event.extendedProps.content : "";

              $(info.el).qtip({
                content: {
                  title: `<span id="qtitle${id}">` + title + `</span>`,
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
                    $(`#qtitle${info.event.id}`).text($("#datetitle").val());
                    $(`#qcontent${info.event.id}`).text($("#datecontent").val());
                    info.event.setProp("title", $("#datetitle").val());
                    info.event.setExtendedProp("content", $("#datecontent").val());
                    info.event.setExtendedProp("startTime", $("time1").val());
                    info.event.setExtendedProp("endTime", $("#time2").val());
                    $(this).dialog("close");
                  },
                  삭제: function () {
                    info.event.remove();
                    $(this).dialog("close");
                  },
                };
              } else {
                $("#timebox").css("display", "none");
                var btnOpt = {
                  저장: function () {
                    $(`#qtitle${info.event.id}`).text($("#datetitle").val());
                    $(`#qcontent${info.event.id}`).text($("#datecontent").val());
                    info.event.setProp("title", $("#datetitle").val());
                    info.event.setExtendedProp("content", $("#datecontent").val());
                    $(this).dialog("close");
                  },
                  삭제: function () {
                    info.event.remove();
                    $(this).dialog("close");
                  },
                };
              }

              $("#datetitle").val(info.event.title);
              $("#datecontent").val(info.event.extendedProps.content);
              $("#time1").val(info.event.extendedProps.startTime);
              $("#time2").val(info.event.extendedProps.endTime);
              var dOpt = diaLogOpt;
              dOpt.buttons = btnOpt;
              $("#dialog").dialog(dOpt);
              calendar.unselect();
            },
            select: function (selectioninfo) {
              // 캘린더에서 드래그로 이벤트를 생성할 수 있다.

              var btnOpt = {
                저장: function () {
                  elec2(selectioninfo.resource.id);
                  calendar.addEvent({
                    resourceId: selectioninfo.resource.id,
                    id: selectioninfo.resource.id,
                    title: $("#datetitle").val(),
                    start: selectioninfo.start,
                    end: selectioninfo.end,
                    extendedProps: {
                      content: $("#datecontent").val(),
                    },
                  });
                  
                  $(this).dialog("close");
                },
                취소: function () {
                  $(this).dialog("close");
                },
              };

              $("#datetitle").val("");
              $("#datecontent").val("");
              var dOpt = diaLogOpt;
              dOpt.buttons = btnOpt;
              $("#dialog").dialog(dOpt);
              calendar.unselect();
            },
            // 이벤트
            resources: [
              {
                id: "A",
                title: "A팀",
              },
              {
                id: "B",
                title: "B팀",
              },
              {
                id: "C",
                title: "C팀",
              },
            ],
            events: [
              {
                resourceId: "a",
                id: "a",
                start: "2022-04-21T10:00",
                end: "2022-04-21T16:00",
              },
            ],
          });
          // 캘린더 랜더링
          calendar.render();
        });
      })();
    /*   function elec2(arg){  
        $.ajax({
           url:"${pageContext.request.contextPath}/schedule/elec.jsp"
           }).done((data)=>{
          
           $("#elec").append(data);
           
        });
      } */
      
    </script>
  
 <%@ include file="/WEB-INF/views/common/footer.jsp"%>