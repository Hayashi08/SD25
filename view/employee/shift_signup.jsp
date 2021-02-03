<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bean.EmployeeBean" %>
<%

    ArrayList<EmployeeBean> employeeBeans = (ArrayList<EmployeeBean>)request.getAttribute("employeeBeans");

%>
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
                          <select name="start_hh" size="1">
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
                          <select name="start_mm" size="1">
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
                          <select name="end_hh" size="1">
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
                          </select>
                      </div>
                      <div class="offset-2 col-3">
                          <select name="end_mm" size="1">
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
        document.addEventListener('DOMContentLoaded', function() {
          var today = new Date();
          var y = today.getFullYear();
          var m = ("00" + (today.getMonth()+1)).slice(-2);
          var d = ("00" + today.getDate()).slice(-2);

          var calendarEl = document.getElementById('calendar');

          var calendar = new FullCalendar.Calendar(calendarEl, {
            initialDate: y + '-' + m + '-' + d,
            initialView: 'dayGridMonth',
            nowIndicator: true,
            headerToolbar: {
              left: 'prev,next today',
              center: 'title',
              right: 'dayGridMonth'
            },
            views: {
              timeGridDay: {
                slotMinTime: '08:00:00',
                slotMaxTime: '26:00:00'
              }
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
              <% for (int i=0; i < employeeBeans.size()-1; i++) { %>
              {
                start: '<%= employeeBeans.get(i).getDate() %>T<%= employeeBeans.get(i).getStart() %>',
                end: '<%= employeeBeans.get(i).getDate() %>T<%= employeeBeans.get(i).getEnd() %>'
              },
              <% } %>
              {
                start: '<%= employeeBeans.get(employeeBeans.size()-1).getDate() %>T<%= employeeBeans.get(employeeBeans.size()-1).getStart() %>',
                end: '<%= employeeBeans.get(employeeBeans.size()-1).getDate() %>T<%= employeeBeans.get(employeeBeans.size()-1).getEnd() %>'
              }
            ]
          });

          calendar.render();
        });
    </script>
</html>
