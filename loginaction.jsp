
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    
try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/car rental","root","root");
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from user where username='"+username+"' and password='"+password+"'");
    if(rs.next()){
%>
<script type="text/javascript">
    window.alert("Login Successful");
    window.location="home.html";
</script>
<% 
    }else{ %>
<script type="text/javascript">
    window.alert("Login FAiled");
    window.location="login.html";
</script>
<%
        }
}
catch(Exception e){
    out.println(e);
}
%>    
