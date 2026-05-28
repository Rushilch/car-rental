<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String firstname = request.getParameter("firstname");
    String lastname = request.getParameter("lastname");
    String gender = request.getParameter("gender");
    String birthday = request.getParameter("birthday");
    String contactnumber = request.getParameter("contactnumber");
    String email = request.getParameter("email");
    String city = request.getParameter("city");
    String state = request.getParameter("state");
    String pincode = request.getParameter("pincode");
    String username = request.getParameter("username");
    String password= request.getParameter("password");
try{    
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/car rental","root","root");
Statement st = con.createStatement();
int i = st.executeUpdate("insert into user values('"+firstname+"','"+lastname+"','"+gender+"','"+birthday+"','"+contactnumber+"','"+email+"','"+city+"','"+state+"','"+pincode+"','"+username+"','"+password+"')");

if(i>0){
%>    
<script type ="text/javascript">
    window.alert("Successfully Registered!!!");
    window.location="login.html";
</script>
<%}
else{ %>
<script type="text/javascript">
    window.alert("Registration Failed!!!");
    window.location="registration.html";    
</script>
<%
}
}catch(Exception e){
out.println(e);
}
%>
