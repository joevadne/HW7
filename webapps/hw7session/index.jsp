<%@ page language="java" contentType="text/html;charset=UTF-8;" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Login System</title>
    <link rel="stylesheet" href="css/style.css">
  </head>
  <body>
    <form class="sign-up" action="member.jsp" method="post">
      <h1 class="sign-up-title">Login</h1>
          <input type="text" class="sign-up-input" name="account" id="username" placeholder="Username" required />
          <input type="password" class="sign-up-input"  name="password" id="password" placeholder="Password" required pattern="[A-Za-z0-9]{6,12}" title="請輸入6-12英文字母或數字" />
          <input type="submit" value="Login" class="sign-up-button">
            <br><br>
          <input type="submit" class="sign-up-button" onclick="window.open('new.jsp','_self')" value="Register"/>
          <br><br>
        <input type="submit" class="sign-up-button" onclick="window.open('list.jsp','_self')" value="User List"/>
    </form>

  </body>
</html>
