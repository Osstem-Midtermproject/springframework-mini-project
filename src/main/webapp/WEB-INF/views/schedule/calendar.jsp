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
            <div class="mt-4" id="calendar-container">
              <div id="calendar"></div>
            </div>
          </div>
        </div>
      </div>
    </main>
   <script>
      var id = 0;
      var diaLogOpt = {
        title: "일정관리",
        modal: true, //모달대화상자
        resizable: true, //크기 조절 못하게
        width: "500",
        height: "500",
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
          var calendar = new FullCalendar.Calendar(calendarEl, {
            height: "700px", // calendar 높이 설정
            expandRows: true, // 화면에 맞게 높이 재설정
            slotMinTime: "08:00", // Day 캘린더에서 시작 시간
            slotMaxTime: "20:00", // Day 캘린더에서 종료 시간
            // 해더에 표시할 툴바
            headerToolbar: {
              left: "prev,next today",
              center: "title",
              right: "dayGridMonth,timeGridWeek,timeGridDay,listWeek",
            },
            initialView: "dayGridMonth", // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
            initialDate: "2022-04-11", // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
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
              console.log(info.event.extendedProps.startTime);
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
            select: function (arg) {
              // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
              let check = Number(moment(arg.end).format("DD")) - Number(moment(arg.start).format("DD"));
              if (check === 1) {
                $("#timebox").css("display", "block");
                var btnOpt = {
                  저장: function () {
                    id++;
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
                    console.log($("#time1").val());
                    calendar.addEvent({
                      id: id,
                      title: $("#datetitle").val(),
                      start: moment(arg.start).format("YYYY-MM-DD"),
                      end: moment(arg.end).format("YYYY-MM-DD"),
                      allDay: arg.allDay,
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
              }
              $("#time1").val("");
              $("#time2").val("");
              $("#datetitle").val("");
              $("#datecontent").val("");
              var dOpt = diaLogOpt;
              dOpt.buttons = btnOpt;
              $("#dialog").dialog(dOpt);
              calendar.unselect();
            },
            // 이벤트
            events: [
              {
                title: "All Day Event",
                start: "2022-04-16",
              },
              {
                title: "Long Event",
                start: "2022-04-07",
                end: "2022-04-11",
              },
              {
                groupId: 999,
                title: "Repeating Event",
                start: "2022-04-20T16:00:00",
              },
              {
                groupId: 999,
                title: "Repeating Event",
                start: "2022-04-20T16:00:00",
              },
              {
                title: "Conference",
                start: "2022-04-13",
                end: "2022-04-16",
              },
              {
                title: "Conferenceaaaa",
                start: "Thu Apr 28 2022 00:00:00 GMT+0900 (한국 표준시)",
                end: "Thu Apr 28 2022 00:00:00 GMT+0900 (한국 표준시)",
              },
              {
                title: "Meeting",
                start: "2022-04-1010:30:00",
                end: "2022-04-10T12:30:00",
              },
            ],
          });
          // 캘린더 랜더링
          calendar.render();
        });
      })();
    </script>
 <%@ include file="/WEB-INF/views/common/footer.jsp"%>