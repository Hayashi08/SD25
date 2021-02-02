<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="ja">
    <head>
        <title>従業員登録</title>
        <%@ include file="../head.jsp" %>
        <%@ include file="../calendar.jsp" %>

    </head>
    <body>
        <div class="container-fluid">
            <div class="p-3">
                <div class="col-12 p-4 main">
                    <%@ include file="../header.jsp" %>
                </div>

                <div class="offset-4 my-3 col-4 text-center main_title">
                    シフト登録
                </div>

                <div class="offset-1 col-10 p-5 main">
                  <div id='calendar'></div>
                </div>

                <div class="offset-8 col-3 my-3">
                    <a class="btn btn-primary m-5" href="javascript:history.back();" role="button">戻る</a>
                </div>
            </div>
        </div>
    </body>
    <%@ include file="../ModalOpenTab.jsp" %>
          <form action="FrontController" method="POST">
            <input type="text" name="class_name" value="employee.ShiftSignupAction" hidden>
            <table class="offset-1 col-10 table table-striped">
                <tr>
                  <td class="field">従業員ID</td>
                  <td class="input-group"><input type="text" class="form-control" id="modal_id" name="employee_id" maxlength="3" required></td>
                </tr>
                <tr>
                  <td class="field">日付</td>
                  <td class="input-group"><input type="text" class="form-control" id="modal_date" name="date" maxlength="3" readonly></td>
                </tr>
                <tr>
                  <td class="field">開始時刻</td>
                  <td class="input-group row">
                      <div class="offset-2 col-3">
                          <select id="start" size="1">
                              <option value="09" selected>9時
                              <option value="10">10時
                              <option value="11">11時
                              <option value="12">12時
                              <option value="13">13時
                              <option value="14">14時
                              <option value="15">15時
                              <option value="16">16時
                              <option value="17">17時
                              <option value="18">18時
                              <option value="19">19時
                              <option value="20">20時
                              <option value="21">21時
                              <option value="22">22時
                              <option value="23">23時
                          </select>
                      </div>
                      <div class="offset-2 col-3">
                          <select id="start" size="1">
                              <option value="00" selected>0分
                              <option value="10">10分
                              <option value="20">20分
                              <option value="30">30分
                              <option value="40">40分
                              <option value="50">50分
                          </select>
                      </div>
                  </td>
                </tr>
                <tr>
                  <td class="field">終了時刻</td>
                  <td class="input-group row">
                      <div class="offset-2 col-3">
                          <select id="end" size="1">
                              <option value="12" selected>12時
                              <option value="13">13時
                              <option value="14">14時
                              <option value="15">15時
                              <option value="16">16時
                              <option value="17">17時
                              <option value="18">18時
                              <option value="19">19時
                              <option value="20">20時
                              <option value="21">21時
                              <option value="22">22時
                              <option value="23">23時
                              <option value="24">24時
                              <option value="25">25時
                              <option value="26">26時
                          </select>
                      </div>
                      <div class="offset-2 col-3">
                          <select id="start" size="1">
                              <option value="00" selected>0分
                              <option value="10">10分
                              <option value="20">20分
                              <option value="30">30分
                              <option value="40">40分
                              <option value="50">50分
                          </select>
                      </div>
                  </td>
                </tr>
            </table>
            <div class="row">
                <div class="col-2 offset-3">
                    <input type="submit" class="btn btn-primary" value="登録" role="button">
                </div>
                <div class="col-3 offset-1">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">閉じる</button>
                </div>
            </div>
          </form>
    <%@ include file="../ModalCloseTab.jsp" %>
    <%@ include file="../enhance.jsp" %>
    <script>
        $(function () {
          $('#btn').click(function() {
            $('#modal_id').val($('#id').val());
            $('#modal_pass').val($('#pass').val());
            $('#modal_name').val($('#name').val());
            $('#modal_position').val($('#position').val());
            $('#modal_mail').val($('#mail').val());
            $('#modal_tel').val($('#tel').val());
          });
        });

        document.addEventListener('DOMContentLoaded', function() {
          var today = new Date();
          var y = today.getFullYear();
          var m = ("00" + (today.getMonth()+1)).slice(-2);
          var d = ("00" + today.getDate()).slice(-2);

          var calendarEl = document.getElementById('calendar');

          var calendar = new FullCalendar.Calendar(calendarEl, {
            initialDate: y + '-' + m + '-' + d,
            initialView: 'timeGridWeek',
            nowIndicator: true,
            headerToolbar: {
              left: 'prev,next today',
              center: 'title',
              right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
            },
            dateClick: function(info) {
                $('#modal1').modal('show');
                $('#modal_date').val(info.dateStr);
            },
            timeZone: 'Asia/Tokyo',
            locale: 'ja',
            navLinks: true, // can click day/week names to navigate views
            editable: true,
            selectable: true,
            selectMirror: true,
            dayMaxEvents: true, // allow "more" link when too many events
            events: [
              {
                title: 'All Day Event',
                start: '2020-09-01',
              },
              {
                title: 'Long Event',
                start: '2020-09-07',
                end: '2020-09-10'
              },
              {
                groupId: 999,
                title: 'Repeating Event',
                start: '2020-09-09T16:00:00'
              },
              {
                groupId: 999,
                title: 'Repeating Event',
                start: '2020-09-16T16:00:00'
              },
              {
                title: 'Conference',
                start: '2020-09-11',
                end: '2020-09-13'
              },
              {
                title: 'Meeting',
                start: '2020-09-12T10:30:00',
                end: '2020-09-12T12:30:00'
              },
              {
                title: 'Lunch',
                start: '2020-09-12T12:00:00'
              },
              {
                title: 'Meeting',
                start: '2020-09-12T14:30:00'
              },
              {
                title: 'Happy Hour',
                start: '2020-09-12T17:30:00'
              },
              {
                title: 'Dinner',
                start: '2020-09-12T20:00:00'
              },
              {
                title: 'Birthday Party',
                start: '2020-09-13T07:00:00'
              },
              {
                title: 'Click for Google',
                url: 'http://google.com/',
                start: '2020-09-28'
              }
            ]
          });

          calendar.render();
        });
    </script>
</html>
