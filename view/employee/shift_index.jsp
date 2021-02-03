<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bean.EmployeeBean" %>
<%

    ArrayList<EmployeeBean> employeeBeans = (ArrayList<EmployeeBean>)request.getAttribute("employeeBeans");

%>
<html lang="ja">
    <head>
        <title>シフト管理</title>
        <%@ include file="../head.jsp" %>
        <%@ include file="../calendar.jsp" %>
    </head>
    <body>
        <div class="container-fluid">
            <div class="p-3">
                <div class="col-12 p-4 main">
                    <%@ include file="../header.jsp" %>
                </div>
                
                <div class="offset-4 my-3 col-4 main_title text-center">
                    シフト管理
                </div>

                <div class="offset-1 col-10 p-5 main">
                    <div class="row m-3">
                        <div class="offset-2 col-3">
                            <a class="btn btn-primary"  href="shift_matome.html" role="button">シフト作成</a>
                        </div>
                        <div class="offset-2 col-3">
                            <a class="btn btn-primary"  href="FrontController?class_name=employee.ShiftFormAction" role="button">シフト予定登録</a>
                        </div>
                    </div>
                    <div class="my-5 h2 text-center">
                        本日のシフト
                    </div>
                    <div id='calendar'></div>
                </div>

                <div class="offset-8 col-3 my-3">
                    <a class="btn btn-primary m-5" href="FrontController?class_name=employee.TopAction" role="button">従業員管理トップへ</a>
                </div>

            </div>
        </div>
    </body>
    <%@ include file="../ModalOpenTab.jsp" %>
        <table class="offset-1 col-10 table table-striped">
            <tr>
              <td class="field">従業員ID</td>
              <td class="input-group"><input type="text" class="form-control" id="modal_id" maxlength="3" readonly></td>
            </tr>
            <tr>
              <td class="field">日付</td>
              <td class="input-group"><input type="text" class="form-control" id="modal_date" maxlength="3" readonly></td>
            </tr>
            <tr>
              <td class="field">開始時刻</td>
              <td class="input-group"><input type="text" class="form-control" id="modal_start" maxlength="3" readonly></td>
            </tr>
            <tr>
              <td class="field">終了時刻</td>
              <td class="input-group"><input type="text" class="form-control" id="modal_end" maxlength="3" readonly></td>
            </tr>
        </table>
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
            initialView: 'timeGridWeek',
            nowIndicator: true,
            headerToolbar: {
              left: 'prev,next today',
              center: 'title',
              right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
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
            navLinks: true,
            editable: true,
            selectable: true,
            selectMirror: true,
            dayMaxEvents: true,
            events: [
              <% for (int i=0; i < employeeBeans.size()-1; i++) { %>
              {
                id: '<%= i %>',
                start: '<%= employeeBeans.get(i).getDate() %>T<%= employeeBeans.get(i).getStart() %>',
                end: '<%= employeeBeans.get(i).getDate() %>T<%= employeeBeans.get(i).getEnd() %>'
              },
              <% } %>
              {
                id: 'employeeBeans.size()-1',
                start: '<%= employeeBeans.get(employeeBeans.size()-1).getDate() %>T<%= employeeBeans.get(employeeBeans.size()-1).getStart() %>',
                end: '<%= employeeBeans.get(employeeBeans.size()-1).getDate() %>T<%= employeeBeans.get(employeeBeans.size()-1).getEnd() %>'
              }
            ],
            eventClick: function(event) { //イベントをクリックすると発動
                $('#modal1').modal('show');
                $('#modal_id').val();
                $('#modal_date').val();
                $('#modal_start').val(event.startStr);
                $('#modal_end').val(event.endStr);
            }
          });

          calendar.render();
        });
    </script>
</html>
