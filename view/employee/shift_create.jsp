<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bean.ShiftBean" %>
<%

    ArrayList<ShiftBean> shiftBeans = (ArrayList<ShiftBean>)request.getAttribute("shiftBeans");

%>
<html lang="ja">
    <head>
        <title>シフト作成</title>
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
                    シフト作成
                </div>

                <div class="offset-1 col-10 p-5 main">
                    <div class="row m-3">
                        <div class="col-3 text-center">
                            <a class="btn btn-primary"  href="FrontController?class_name=employee.EmployeeIndexAction" role="button">従業員管理</a>
                        </div>
                        <div class="offset-1 col-3 text-center">
                            <a class="btn btn-primary"  href="FrontController?class_name=employee.ShiftCreateFormAction" role="button">シフト作成</a>
                        </div>
                        <div class="offset-1 col-3 text-center">
                            <a class="btn btn-primary"  href="FrontController?class_name=employee.ShiftFormAction" role="button">シフト予定登録</a>
                        </div>
                    </div>
                    <div id="title"></div>
                    <div id='calendar'></div>
                </div>

                <div class="offset-8 col-3 my-3">
                    <a class="btn btn-primary m-5" href="FrontController?class_name=situation.TopAction" role="button">トップページへ</a>
                </div>

            </div>
        </div>
    </body>
    <%@ include file="../ModalOpenTab.jsp" %>
        <table class="offset-1 col-10 table table-striped">
            <tr>
              <td class="field">従業員名</td>
              <td class="input-group"><input type="text" class="form-control" id="modal_name" readonly></td>
            </tr>
            <tr>
              <td class="field">日付</td>
              <td class="input-group"><input type="text" class="form-control" id="modal_date" readonly></td>
            </tr>
            <tr>
              <td class="field">開始時刻</td>
              <td class="input-group"><input type="text" class="form-control" id="modal_start" readonly></td>
            </tr>
            <tr>
              <td class="field">終了時刻</td>
              <td class="input-group"><input type="text" class="form-control" id="modal_end" readonly></td>
            </tr>
        </table>
    <%@ include file="../ModalCloseTab.jsp" %>
    <%@ include file="../enhance.jsp" %>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
          var today = new Date();
          var y = today.getFullYear();
          var m = ("00" + (today.getMonth()+2)).slice(-2);
          var d = ("00" + today.getDate()).slice(-2);
          var mon = "";

          if (m<10) {

            mon = m.slice(1);

          } else {
            
            mon = m;

          }
          
          document.getElementById("title").innerHTML = '<div class="my-5 h2 text-center">' + mon + '月シフト作成</div>';

          var calendarEl = document.getElementById('calendar');

          var calendar = new FullCalendar.Calendar(calendarEl, {
            initialDate: y + '-' + m + '-' + d,
            initialView: 'dayGridMonth',
            nowIndicator: true,
            headerToolbar: {
              left: 'prev,next today',
              center: 'title',
              right: 'dayGridMonth,timeGridDay,listWeek'
            },
            views: {
              timeGridDay: {
                slotMinTime: '08:00:00',
                slotMaxTime: '26:00:00'
              }
            },
            timeZone: 'Asia/Tokyo',
            locale: 'ja',
            navLinks: true,
            editable: true,
            selectable: true,
            selectMirror: true,
            dayMaxEvents: true,
            contentHeight: 'auto',
            allDaySlot: false,
            <% if (shiftBeans.size() == 0) { %>
            <% }else{ %>
            events: [
              <% for (int i=0; i < shiftBeans.size()-1; i++) { %>
              {
                title: '<%= shiftBeans.get(i).getName() %>',
                start: '<%= shiftBeans.get(i).getDate() %>T<%= shiftBeans.get(i).getStart() %>',
                end: '<%= shiftBeans.get(i).getDate() %>T<%= shiftBeans.get(i).getEnd() %>'
              },
              <% } %>
              {
                title: '<%= shiftBeans.get(shiftBeans.size()-1).getName() %>',
                start: '<%= shiftBeans.get(shiftBeans.size()-1).getDate() %>T<%= shiftBeans.get(shiftBeans.size()-1).getStart() %>',
                end: '<%= shiftBeans.get(shiftBeans.size()-1).getDate() %>T<%= shiftBeans.get(shiftBeans.size()-1).getEnd() %>'
              }
            ],
            <% } %>
            eventClick: function(info) { //イベントをクリックすると発動
                $('#modal1').modal('show');
                $('#modal_name').val(info.event.title);
                $('#modal_date').val(info.event.startStr.slice( 0, -9 ));
                $('#modal_start').val(info.event.startStr.slice( 11, 16 ));
                $('#modal_end').val(info.event.endStr.slice( 11, 16 ));
            }
          });

          calendar.render();
        });
    </script>
</html>
