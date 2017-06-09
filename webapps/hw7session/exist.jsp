<%@ page language="java" contentType="text/html;charset=UTF-8;" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<%
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con =(Connection) DriverManager.getConnection("jdbc:mysql://140.120.49.205:3306/4104029024","4104029024","Ss4104029024!");
            PreparedStatement ps = con.prepareStatement("SELECT  * FROM person WHERE " +
                    "account = ?");
            ps.setString(1,request.getParameter("account"));
            ResultSet res = ps.executeQuery();
            if(res.first()){
                out.print("User already exists");
            }else{
                out.print("User name is valid!!!!");
            }
        }catch (Exception e){
            System.out.println(e);
        }
%>
