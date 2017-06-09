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
  ResultSet rs = null;
  String account = request.getParameter("account");
  String password = request.getParameter("password");
  try{
    database.connectDB();
    String sql = "select * from person where account='"+account+"' and password='"+ password +"'";
    database.query(sql);
    rs = database.getRS();
    if(rs!=null){
      if(rs.next()){
        session.setAttribute("check","ok");
        session.setAttribute("account",account);
        session.setAttribute("password",password);
        response.sendRedirect("member.jsp");
    }else{
      session.setAttribute("check","failed");
      response.sendRedirect("member.jsp");
    }
  }
  }catch(Exception ex){
    out.println(ex);
  }finally{
    try { rs.close();database.closeDB(); } catch (Exception e) { /* ignored */ }
  }
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title></title>
  </head>
  <body>
  </body>
</html>
