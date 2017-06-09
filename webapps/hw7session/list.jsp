<%@ page language="java" contentType="text/html;charset=UTF-8;" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="database" class="com.database.Database">
  <jsp:setProperty property="ip" name="database" value="140.120.49.205" />
  <jsp:setProperty property="port" name="database" value="3306" />
  <jsp:setProperty property="db" name="database" value="4104029024" />
  <jsp:setProperty property="user" name="database" value="4104029024" />
  <jsp:setProperty property="password" name="database" value="Ss4104029024!" />
</jsp:useBean>
<%
 request.setCharacterEncoding("UTF-8");
 String url = "";
 String driver = "com.mysql.jdbc.Driver";
 ResultSet rs = null;
 String account = request.getParameter("account");
 String password = request.getParameter("password");
 String name = request.getParameter("name");
 String birth = request.getParameter("birth");
 String email = request.getParameter("email");
 String phone = request.getParameter("phone");
 int x = 0;int y = 0;
 String message="";
 if(account !=null && password !=null && name !=null && birth !=null && email !=null && phone !=null){
   try{
     database.connectDB();
     String sql = "select * from person;";
     database.query(sql);
     rs = database.getRS();
     if(rs!=null){
       while(rs.next()){
         String accountData = rs.getString("account");
         if(account.equals(accountData)){
           y+=1;
           break;
         }
       }
       if(y!=0){
         message="註冊失敗";
       }else{
         database.insertData(account,password,name,birth,email,phone);
         message="註冊成功";
         }
       }
     }catch(Exception ex){
       out.println(ex);
     }
   }else{
    message="登入成功！";
  }
 try{
   database.connectDB();
   String sql = "select * from person;";
   database.query(sql);
   rs = database.getRS();
 }catch(Exception ex){
   out.println(ex);
 }
%>
<!DOCTYPE html>
<html>
    <head>
      <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
      <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.2.4.min.js"></script>
      <link rel="stylesheet" href="css/style.css">
      <meta charset="utf-8">
      <title>會員管理</title>
      <style>
      table {
      	background: #f5f5f5;
      	border-collapse: separate;
      	box-shadow: inset 0 1px 0 #fff;
      	font-size: 12px;
      	line-height: 24px;
      	margin: 30px auto;
      	text-align: left;
      }

      th {
      	background: url(http://jackrugile.com/images/misc/noise-diagonal.png), linear-gradient(#777, #444);
      	border-left: 1px solid #555;
      	border-right: 1px solid #777;
      	border-top: 1px solid #555;
      	border-bottom: 1px solid #333;
      	box-shadow: inset 0 1px 0 #999;
      	color: #fff;
        font-weight: bold;
      	padding: 10px 15px;
      	position: relative;
      	text-shadow: 0 1px 0 #000;
      }

      th:after {
      	background: linear-gradient(rgba(255,255,255,0), rgba(255,255,255,.08));
      	content: '';
      	display: block;
      	height: 25%;
      	left: 0;
      	margin: 1px 0 0 0;
      	position: absolute;
      	top: 25%;
      	width: 100%;
      }

      th:first-child {
      	border-left: 1px solid #777;
      	box-shadow: inset 1px 1px 0 #999;
      }

      th:last-child {
      	box-shadow: inset -1px 1px 0 #999;
      }

      td {
      	border-right: 1px solid #fff;
      	border-left: 1px solid #e8e8e8;
      	border-top: 1px solid #fff;
      	border-bottom: 1px solid #e8e8e8;
      	padding: 10px 15px;
      	position: relative;
      	transition: all 300ms;
      }

      td:first-child {
      	box-shadow: inset 1px 0 0 #fff;
      }

      td:last-child {
      	border-right: 1px solid #e8e8e8;
      	box-shadow: inset -1px 0 0 #fff;
      }

      tr {
      	background: url(http://jackrugile.com/images/misc/noise-diagonal.png);
      }

      tr:nth-child(odd) td {
      	background: #f1f1f1 url(http://jackrugile.com/images/misc/noise-diagonal.png);
      }

      tr:last-of-type td {
      	box-shadow: inset 0 -1px 0 #fff;
      }

      tr td:first-child {
      	box-shadow: inset 1px -1px 0 #fff;
      }

      tr td:last-child {
      	box-shadow: inset -1px -1px 0 #fff;
      }

      tbody:hover td {
      	color: transparent;
      	text-shadow: 0 0 3px #aaa;
      }

      tbody:hover tr:hover td {
      	color: #444;
      	text-shadow: 0 1px 0 #fff;
      }
      </style>
    </head>
  <body>
          <form class="sign-up">
            <h1 class="sign-up-title">User List</h1>

          <table><center>
            <thead>
              <tr><th>姓名</th><th>生日</th><th>E-mail</th><th>電話號碼</th></tr>
            </thead>
              <%
                try{
                  database.connectDB();
                  String sql = "select * from person;";
                  database.query(sql);
                  rs = database.getRS();
                }catch(Exception ex){
                  out.println(ex);
                }
                if(rs!=null){
                  while(rs.next()){
                    %>
                  <tbody><tr>
                      <td><%=rs.getString("name")%></td>
                      <td><%=rs.getString("birth")%></td>
                      <td><%=rs.getString("email")%></td>
                      <td><%=rs.getString("phone")%></td>
                  </tr></tbody>
                    <%
                  }
                }
              %>
          </center></table>
            <input class="sign-up-button" type="button" onclick="window.open('index.jsp','_self')" value="回到登入畫面"/>

      </form>

  </body>
</html>
