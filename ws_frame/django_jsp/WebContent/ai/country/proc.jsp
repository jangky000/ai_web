<%@ page contentType="text/html; charset=EUC-KR" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>�ͳ�/����/������ ��Ÿ�� ���� �ý���</title>
    <link href="../../css/style.css' %}" rel="Stylesheet" type="text/css">
    <script type="text/JavaScript"
                 src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script type="text/javascript" language="javscript">
        function send() {
            frm.submit();
        }

        // �ͳ�: 1,1,1,10,1,2
        function country1() {
          $('#drink').val(1);
          $("input:radio[name='life']:radio[value='1']").prop('checked', true);
          $("input:radio[name='cousin']:radio[value='1']").prop('checked', true);
          $('#trip').val(10);
          $("input:radio[name='house']:radio[value='1']").prop('checked', true);
          $("input:radio[name='land']:radio[value='2']").prop('checked', true);
        }

        // ����: 1,0,1,6,1,1
        function country2() {
          $('#drink').val(0);
          $("input:radio[name='life']:radio[value='1']").prop('checked', true);
          $("input:radio[name='cousin']:radio[value='1']").prop('checked', true);
          $('#trip').val(6);
          $("input:radio[name='house']:radio[value='1']").prop('checked', true);
          $("input:radio[name='land']:radio[value='1']").prop('checked', true);
        }

        // ����(������): 0,0,0,2,1,0
        function country_fail() {
          $('#drink').val(0);
          $("input:radio[name='life']:radio[value='0']").prop('checked', true);
          $("input:radio[name='cousin']:radio[value='0']").prop('checked', true);
          $('#trip').val(2);
          $("input:radio[name='house']:radio[value='1']").prop('checked', true);
          $("input:radio[name='land']:radio[value='0']").prop('checked', true);
        }
    </script>
</head>
<body>
<DIV class="container">
<H1>�ͳ���� ���� ���� �ý���</H1>
 <form id='frm' name='frm' action='http://127.0.0.1:8000/country/to_django' method='GET'>
  <br>
  <OL>
      <LI class="li_question">
          �ִ� ���� Ƚ��: 0 ~ 3(3ȸ �̻�):
          <input name="drink" id="drink" type="number" min = "0" max="3" step="1" value="">
      </LI>
      <LI class="li_question">
          ���̿��� ��Ȱ���� �ִ�:
          <label style="cursor: pointer;">
              <input name="life" id="life1" type="radio" value="1"> ����
          </label>
          <label style="cursor: pointer;">
              <input name="life"  id="life0" type="radio" value="0"> ����
          </label>
      </LI>
      <LI class="li_question">
          �����߿� ���̿��� ��Ȱ�ϰ� �ִ� ģô�ִ� ����:
          <label style="cursor: pointer;">
              <input name="cousin" id="cousin1" type="radio" value="1"> ����
          </label>
          <label style="cursor: pointer;">
              <input name="cousin" id="cousin0" type="radio" value="0"> ����
          </label>
      </LI>
      <LI class="li_question">
          1�⵿���� ���� Ƚ��: 0 ~ 12 (���/ķ��, ����, ����, ���� ��� �ش�)
          <input name="trip" id="trip" type="number" min = "0" max="12" step="1" value="">
      </LI>
      <LI class="li_question">
          ���� ���� �� �� �ִ� ������:
          <label style="cursor: pointer;">
              <input name="house" id="house1" type="radio" value="1"> ����
          </label>
          <label style="cursor: pointer;">
              <input name="house" id="house0" type="radio" value="0"> ����
          </label>
      </LI>
      <LI class="li_question">
          ���� �� �� �ִ� ���� ���: 0 ~ (��)<br>
          <label style="cursor: pointer;">
              <input name="land" id="land0" type="radio" value="0"> ����
          </label>
          <label style="cursor: pointer;">
              <input name="land" id="land1" type="radio" value="1"> 1 ~ 2000 �̸�
          </label>
          <label style="cursor: pointer;">
              <input name="land" id="land2" type="radio" value="2"> 2000�̻� ~ 3000�̸�
          </label>
          <label style="cursor: pointer;">
              <input name="land" id="land3" type="radio" value="3"> 3000�̻�
          </label>
      </LI>
  </OL>
  <UL>
      <LI  style='font-size: 26px; list-style: none;'>������: <%=request.getParameter("data") %></LI>
      <LI  style='font-size: 26px; list-style: none;'>�ͳ�/���� ���� Ȯ��: <span style="text-decoration: underline;"><%=request.getParameter("pct") %> %</span></LI>
      <LI  style='font-size: 26px; list-style: none;'>���: <span style="text-decoration: underline;"><%=request.getParameter("res") %></span></LI>

  </UL>
  
  <br>
  <button type='button' onclick="country1();">�ͳ�</button>
  <button type='button' onclick="country2();">����(���� ��Ȱ)</button>
  <button type='button' onclick="country_fail();">�ͳ�/���� ����(������)</button>
  <button type='button' onclick="send();">����</button>
  <button type='button' onclick="location.href='/'">HOME</button>
</form>
</DIV>
</body>
</html>