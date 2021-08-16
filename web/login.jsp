<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import= "java.sql.* " %>
<%@page import = "java.text.SimpleDateFormat"%>

<html>
<head>
      <style>

          .content {
  position: absolute;
  bottom: 0;
  background: rgb(0, 0, 0); /* Fallback color */
  background: rgba(0, 0, 0, 0); /* Black background with 0.5 opacity */
  color: #f1f1f1;
  width: 100%;
  padding: 20px;
}
          
          
          
.login-page {
  width: 360px;
  padding: 8% 0 0;
  margin: auto;
}
.form {
  position: relative;
  z-index: 1;
  max-width: 360px;
  margin: 0 auto 100px;
  padding: 45px;
  text-align: center;
  bbox-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
}
.form input {
  font-family: "Roboto", sans-serif;
  outline: 0;
  background: #f2f2f2;
  width: 100%;
  border: 0;
  margin: 0 0 15px;
  padding: 15px;
  box-sizing: border-box;
  font-size: 14px;
}
.form button {
  font-family: "Roboto", sans-serif;
  text-transform: uppercase;
  outline: 0;
  background: #D65106;
  width: 100%;
  border: 0;
  padding: 15px;
  color: #FFFFFF;
  font-size: 14px;
  -webkit-transition: all 0.3 ease;
  transition: all 0.3 ease;
  cursor: pointer;
}
.form button:hover,.form button:active,.form button:focus {
  background: orange;
}
.form .message {
  margin: 15px 0 0;
  color: #b3b3b3;
  font-size: 12px;
}
.form .message a {
  color: #4CAF50;
  text-decoration: none;
}
.form .register-form {
  display: none;
}
.container {
  position: relative;
  z-index: 1;
  max-width: 300px;
  margin: 0 auto;
}
.container:before, .container:after {
  content: "";
  display: block;
  clear: both;
}
.container .info {
  margin: 50px auto;
  text-align: center;
}
.container .info h1 {
  margin: 0 0 15px;
  padding: 0;
  font-size: 36px;
  font-weight: 300;
  color: #1a1a1a;
}
.container .info span {
  color: #4d4d4d;
  font-size: 12px;
}
.container .info span a {
  color: #000000;
  text-decoration: none;
}
.container .info span .fa {
  color: #EF3B3A;
}
body {
  background: #76b852;  
  background: -webkit-linear-gradient(right, #76b852, #8DC26F);
  background: -moz-linear-gradient(right, #76b852, #8DC26F);
  background: -o-linear-gradient(right, #76b852, #8DC26F);
  background: linear-gradient(to left, #76b852, #8DC26F);
  font-family: "Roboto", sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  background-image: url("images/slider-03.jpg");
  background-size: cover;
  
}
</style>

</head>
<body>
    
    
<%  
try
{	
   Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/website?serverTimezone=UTC&autoReconnect=true&useSSL=false", "root", "root");

        Statement st =  (Statement) con.createStatement();
        String check =request.getParameter("check");
        if(check.equals("login"))
        {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String sql="select password from user where username='"+username+"'and email='"+email+"'";
        ResultSet rs = st.executeQuery(sql);
        if(rs.next()== true)
        {
            String pass=rs.getString(1);
            if(password.equals(pass))
            {
             session.setAttribute("email",email); 
              session.setAttribute("username",username);
                response.sendRedirect("index.jsp");
            }
            else
            {
                %>
                <script>
                 alert("Wrong Password");   
                </script>
            <%   // out.print("<script>document.getElementById('wrongpassword').style.display = 'block';</script>");
             }
        }
        else
        {
                %>
                <script>
                 alert("Invalid User");   
                </script>
            <%
        }
        }
        else{
        String username = request.getParameter("user");
        String password = request.getParameter("pass");
        String email = request.getParameter("mail");        
        int mobile = java.lang.Integer.parseInt(request.getParameter("mobile"));
        String dob = request.getParameter("dob"); 
        String address = request.getParameter("address");
        String s = "select * from user where email ='"+email+"'";
        ResultSet rs = st.executeQuery(s);
        if(rs.next() == false)
        {
        String sql = "insert into user(username,password,email,mobile,dob,address) values('"+username+"','"+password+"','"+email+"',"+mobile+",'"+dob+"','"+address+"')";      
        st.executeUpdate(sql);
        }
        else
        {
        out.print("<script>alert('Email already exist');</script>");
        }
}   
con.close();

}
catch(Exception e)
{
}
%>

<a href="index.jsp" style="background-color: #D65106;z-index:20;position:fixed;top:30px;border-radius: 4px;font-size:16px;border: none;color: white;padding: 10px 20px;text-align: center;text-decoration: none;display: inline-block;margin: 2px 1px;cursor: pointer;"> Back</a>   
    
    
 <div class="login-page " id="loginform" >
  <div class="form content" >
    <form class="login-form" action="login.jsp" method="post">
        <input type="text" placeholder="username" name="username" required/>
      <input type="email" placeholder="email" name="email" required/>
      <input type="password" placeholder="password" name="password" required/>
      <input type="hidden" value="login" name="check" >
      <div id="wrongpassword" style="display:none;">wrong password</div>
      <button>login</button>
      <p class="message">Not registered? <a href="#" onclick="change()">Create an account</a></p>
    </form>
  </div>
</div>
    
    
  <div class="login-page" id="signupform" style="display:none;" >
  <div class="form" >
    <form class="login-form" action="login.jsp" method="post">
      <input type="text" placeholder="username" name="user" required/>
      <input type="password" placeholder="password" name="pass" required/>
      <input type="email" placeholder="Email" name="mail" required/>
      <input type="text" placeholder="Mobile" name="mobile" required/>
      <input type="date" placeholder="Date of birth" name="dob" required/>
      <input type="text" placeholder="Address" name="address" required/>
      <input type="hidden" value="registered" name="check">
      <button>Registered</button><br>
      <p class="message"><a href="#" onclick="change2()">Back</a></p>
    </form>
  </div>
</div>
    
    <script>
        function change()
        {
            document.getElementById("signupform").style.display = "block";
            document.getElementById("loginform").style.display = "none";
            
        }
         function change2()
        {
            document.getElementById("signupform").style.display = "none";
            document.getElementById("loginform").style.display = "block";
            
        }
        </script>
</body>
</html>