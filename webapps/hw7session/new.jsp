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
    <script>
    function checkExist(){
                var xmlhttp = new XMLHttpRequest();
                var account = document.forms["regF"]["account"].value;
                var url = "exist.jsp?account=" + account;
                xmlhttp.onreadystatechange = function(){
                    if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
                        if(xmlhttp.responseText.length == 25)
                            document.getElementById("isE").style.color = "red";
                        else
                            document.getElementById("isE").style.color = "green";
                        document.getElementById("isE").innerHTML = xmlhttp.responseText;
                    }

                };
                try{
                xmlhttp.open("GET",url,true);
                xmlhttp.send();
            }catch(e){alert("unable to connect to server");
          }}
    </script>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="stylesheet" href="css/style.css">
    <meta charset="utf-8">
    <title>Registration</title>
  </head>
  <body>
      <form name="regF" class="sign-up" action="member.jsp" method="post">
        <h1 class="sign-up-title">Register</h1>
          <input name="account" class="sign-up-input" type="text" onblur="checkExist()" placeholder="ID" autocomplete="off" required/><p id="isE"></p>
          <br>
          <input name="password" class="sign-up-input" id="password" type="password" placeholder="Password" pattern="[A-Za-z0-9]{6,12}" title="請輸入6-12英文字母或數字" required/>
          <br>
          <input name="name" class="sign-up-input" type="text" placeholder="Name" autocomplete="off" required/>
          <br>
          <input name="birth" class="sign-up-input" type="text" placeholder="Birthday" autocomplete="off" required/>
          <br>
          <input name="email" class="sign-up-input" type="text" placeholder="Email" autocomplete="off" required/>
          <br>
          <input name="phone" class="sign-up-input" type="text" placeholder="Phone Number" autocomplete="off" required/>
          <br>
          <div style="text-align:center !important">
            <input  class="sign-up-button" type="submit" id="regis" value="Register"/>
          </div>
        </form>
  </body>
</html>
