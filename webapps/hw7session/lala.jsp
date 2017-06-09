<%
        String access = "";
        if(check!=null){
         if(check.equals("ok")){
          if(rs!=null && y==0){
            while(rs.next()){
              if(account.equals(rs.getString("account"))){
                if(password.equals(rs.getString("password"))){
                  String namet=rs.getString("name");
                  String birtht=rs.getString("birth");
                  String emailt=rs.getString("email");
                  String phonet=rs.getString("phone");
                  access=rs.getString("access");
                  if(access.equals("管理員")){
                    %>
                    <h3>管理員</h3>
                  <%}else{%>
                    <h3>會員</h3>
                  <%}%>
                  <input type="hidden" name="account" value="<%=account%>"/>
                  <input type="hidden" name="password" value="<%=password%>"/>
                  姓名：<%=namet%>
                  <br>
                  生日：<%=birtht%>
                  <br>
                  E-Mail：<%=emailt%>
                  <br>
                  電話號碼：<%=phonet%>
                  <br>
                  <input type="button" id="login" onclick="window.open('index.jsp','_self')" value="登出"/>
                  <%
                  if(access.equals("管理員")){
                    %>
                    <table>
                      <tr><th colspan="4">會員資料</th></tr>
                      <tr>
                        <th>姓名</th><th>生日</th><th>E-mail</th><th>電話號碼</th>
                        <%
                          try { rs.close();database.closeDB(); } catch (Exception e) { /* ignored */ }
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
                              <tr>
                                <td><%=rs.getString("name")%></td>
                                <td><%=rs.getString("birth")%></td>
                                <td><%=rs.getString("email")%></td>
                                <td><%=rs.getString("phone")%></td>
                              </tr>
                              <%
                            }
                          try { rs.close();database.closeDB(); } catch (Exception e) { /* ignored */ }
                          }
                        %>
                      </tr>
                    </table>
                    <br>
                    查詢/調整會員權限：
                      <select name="member" size="1" >
                        <option value="" disabled selected style="display:none;">選擇會員</option>
                        <%
                        try{
                          database.connectDB();
                          String sql = "select name from person;";
                          database.query(sql);
                          rs = database.getRS();
                        }catch(Exception ex){
                          out.println(ex);
                        }
                        if(rs!=null){
                          while(rs.next()){
                            %>
                              <option value="<%=rs.getString("name")%>"><%=rs.getString("name")%></option>
                            <%
                          }
                          try { rs.close();database.closeDB(); } catch (Exception e) { /* ignored */ }
                        }
                        %>
                      </select>
                      <input type="submit" id="login" value="查詢"/>
                  <%}
                  break;
                }
              }
            }
          }
        }
        else
        if(check.equals("failed") && y==0){%>
          <script>$("#test").html("登入失敗");</script>
          <p>帳號或密碼錯誤</p>
          <input type="button" onclick="window.open('index.jsp','_self')" value="返回登入頁面"/>
          <input type="button" onclick="window.open('new.jsp','_self')" value="創建新賬號"/>
      <%}
    }else{
      response.sendRedirect("index.jsp");
    }%>
        <%if(y!=0){%>
          <p>帳號已被使用</p>
          <br>
          <input type="button" onclick="history.back()" value="返回註冊頁面"/>
          <input type="button" onclick="window.open('index.jsp','_self')" value="回到登入畫面"/>
      <%}%>
