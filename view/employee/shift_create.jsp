<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bean.ShiftBean" %>
<%@ page import="bean.ShiftConfirmBean" %>
<%

    ArrayList<ShiftBean> shiftBeans = (ArrayList<ShiftBean>)request.getAttribute("shiftBeans");
    ArrayList<ShiftConfirmBean> shiftConfirmBeans = (ArrayList<ShiftConfirmBean>)request.getAttribute("shiftConfirmBeans");

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
                            <a class="btn btn-primary"  href="FrontController?class_name=employee.TopAction" role="button">トップ</a>
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

    <!-- シフト確定モーダル -->
    <%@ include file="../ModalDisplay1OpenTab.jsp" %>
        <div id="confirm_date"></div>
        <form action="FrontController" method="POST">
            <input type="text" name="class_name" value="employee.ShiftConfirmAction" hidden>
            <input type="text" name="date" id="modal_confirm_date" hidden>
            <div class="row">
                <div class="col-2 offset-3">
                    <input type="submit" class="btn btn-primary" value="確定" role="button">
                </div>
                <div class="col-3 offset-1">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">閉じる</button>
                </div>
            </div>
        </form>
    <%@ include file="../ModalCloseTab.jsp" %>

    <!-- 詳細モーダル -->
    <%@ include file="../ModalDisplayOpenTab.jsp" %>
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
        <div class="row">
            <div class="col-3 offset-2">
                <div class="btn btn-primary" id="edit_btn">
                    編集
                </div>
            </div>
            <div class="col-3 offset-2">
                    <a id="delete" class="btn btn-primary" href="" role="button">削除</a>
            </div>
        </div>
    <%@ include file="../ModalCloseTab.jsp" %>
    
    <!-- 編集モーダル -->
    <%@ include file="../ModalEditOpenTab.jsp" %>
          <form action="FrontController" method="POST">
            <input type="text" name="class_name" value="employee.ShiftUpdateAction" hidden>
            <input type="text" id="edit_id" name="id" value="" hidden>
            <input type="text" name="flag" value="confirm" hidden>
            <table class="offset-1 col-10 table table-striped">
                <tr>
                  <td class="field">従業員名</td>
                  <td class="input-group"><input type="text" class="form-control" id="edit_name" readonly></td>
                </tr>
                <tr>
                  <td class="field">日付</td>
                  <td class="input-group"><input type="text" class="form-control" id="edit_date" readonly></td>
                </tr>
                <tr>
                  <td class="field">開始時刻</td>
                  <td class="input-group row">
                      <div class="col-6">
                          <select class="custom-select" name="start_hh" size="1">
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
                      <div class="col-6">
                          <select class="custom-select" name="start_mm" size="1">
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
                      <div class="col-6">
                          <select class="custom-select" name="end_hh" size="1">
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
                      <div class="col-6">
                          <select class="custom-select" name="end_mm" size="1">
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
                    <input type="submit" class="btn btn-primary" value="更新" role="button">
                </div>
                <div class="col-3 offset-1">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">閉じる</button>
                </div>
            </div>
          </form>
    <%@ include file="../ModalCloseTab.jsp" %>

    <%@ include file="../enhance.jsp" %>
    <script>

        var shift_id = "";

        document.addEventListener('DOMContentLoaded', function() {

          //シフト確定済みの日付のレイアウト設定
          <% for (int i=0; i < shiftConfirmBeans.size(); i++) { %>

            $('[data-date="<%= shiftConfirmBeans.get(i).getDate() %>"]').css('background-color','orange');

          <% } %>

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
              right: 'dayGridMonth,timeGridDay'

            },
            views: {

              timeGridDay: {

                slotMinTime: '08:00:00',
                slotMaxTime: '24:00:00'

              }

            },
            dateClick: function(info) {

                $('#modal_display1').modal('show');
                $('#modal_confirm_date').val(info.dateStr);
                document.getElementById("confirm_date").innerHTML = '<div class="my-5 h4 text-center">' + info.dateStr + 'のシフトを確定しますか</div>';

            },
            timeZone: 'Asia/Tokyo',
            locale: 'ja',
            navLinks: true,
            editable: true,
            selectable: true,
            selectMirror: true,
            dayMaxEvents: 2,
            contentHeight: 'auto',
            allDaySlot: false,
            <% if (shiftBeans.size() != 0) { %>

            events: [
              <% for (int i=0; i < shiftBeans.size()-1; i++) { %>
              {

                id: '<%= shiftBeans.get(i).getId() %>',
                title: '<%= shiftBeans.get(i).getName() %>',
                start: '<%= shiftBeans.get(i).getDate() %>T<%= shiftBeans.get(i).getStart() %>',
                end: '<%= shiftBeans.get(i).getDate() %>T<%= shiftBeans.get(i).getEnd() %>'

              },
              <% } %>
              {

                id: '<%= shiftBeans.get(shiftBeans.size()-1).getId() %>',
                title: '<%= shiftBeans.get(shiftBeans.size()-1).getName() %>',
                start: '<%= shiftBeans.get(shiftBeans.size()-1).getDate() %>T<%= shiftBeans.get(shiftBeans.size()-1).getStart() %>',
                end: '<%= shiftBeans.get(shiftBeans.size()-1).getDate() %>T<%= shiftBeans.get(shiftBeans.size()-1).getEnd() %>'

              }
            ],
            <% } %>

            eventClick: function(info) { //イベントをクリックすると発動

                $('#modal_display').modal('show');
                $('#modal_name').val(info.event.title);
                $('#modal_date').val(info.event.startStr.slice( 0, -9 ));
                $('#modal_start').val(info.event.startStr.slice( 11, 16 ));
                $('#modal_end').val(info.event.endStr.slice( 11, 16 ));
                $('#delete').attr('href', 'FrontController?class_name=employee.ShiftDeleteAction&id=' + info.event.id + '&flag=confirm');
                shift_id = info.event.id;

            }

          });

          calendar.render();

        });

        $(function () {

          $('#edit_btn').click(function() {

            $('#edit').modal('show');
            $('#modal_display').modal('hide');
            $('#edit_id').val(shift_id);
            $('#edit_name').val($('#modal_name').val());
            $('#edit_date').val($('#modal_date').val());

          });
          
        });

    </script>
</html>
