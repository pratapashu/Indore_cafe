<%-- 
    Document   : admin
    Created on : 11 Sep, 2020, 2:58:15 PM
    Author     : atikr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import= "java.sql.* " %>
<%@page import = "java.text.SimpleDateFormat"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %> 
<!DOCTYPE html>
<html >
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

        <title>Admin Page</title>
   <style>
    table{
                margin: auto;
                margin-top: 5%;
              width : 1140px;
              border: 2px solid black;
              border-collapse: collapse;
              padding: 10px;
              font-size:25px;
              text-align: center;
              ;
              }
              
/*    td, th {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;

               }

    tr:nth-child(even) {
           background-color: #dddddd;
            }*/
    h1{
        position: absolute;
        top:80px;
        left:45%;
       }
       input{
           border-radius: 15px;
       }

* {box-sizing: border-box;}

/* Button used to open the contact form - fixed at the bottom of the page */
    .open-button {
        background-color: #555;
        color: white;
        padding: 16px 20px;
        border: none;
        cursor: pointer;
        opacity: 0.8;
        position: fixed;
        bottom: 23px;
        right: 28px;
        width: 280px;
        }

/* The popup form - hidden by default */
    .form-popup {
        display: none;
        position: fixed;
        top:0%;
        left: 40%;
        border: 3px solid #f1f1f1;
        width:30%;
        z-index: 9;
        border-radius: 25px;
      }

/* Add styles to the form container */
    .form-container {
        max-width: 100%;
        padding: 10px;
        background-color: white;
        border-radius: 100px;
      }

/* Full-width input fields */
     .form-container input[type=text], .form-container input[type=password] {
            width: 100%;
            padding: 10px;
            margin: 5px 0 22px 0;
            border: none;
            background: #f1f1f1;
          }

/* When the inputs get focus, do something */
    .form-container input[type=text]:focus, .form-container input[type=password]:focus {
            background-color: #ddd;
            outline: none;
          }

/* Set a style for the submit/login button */
    .form-container .btn {
            background-color: #4CAF50;
            color: white;
            padding: 12px 18px;
            border: none;
            cursor: pointer;
            width: 100%;
            margin-bottom:6px;
            opacity: 0.8;
          }

/* Add a red background color to the cancel button */
    .form-container .cancel {
            background-color: red;
        }

/* Add some hover effects to buttons */
    .form-container .btn:hover, .open-button:hover {
        opacity: 1;
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
        
        

        
        if( request.getParameter("feedback_submit")!=null )
	{
            String name = (String)session.getAttribute("username");
        String email = (String)session.getAttribute("email");
        
            if(name == null && email == null)
            {
            response.sendRedirect("login.jsp");
            }
            
                String feedback_name = request.getParameter("feedback_name");
                String feedback_email = request.getParameter("feedback_email");
                String feedback_feed = request.getParameter("feedback_feed");
                String sql="insert into feedback(username,email,feed,active) values('"+feedback_name+"','"+feedback_email+"','"+feedback_feed+"',"+0+")";
                st.executeUpdate(sql);		
		con.close();
                response.sendRedirect("index.jsp");
	}
        
}
catch(Exception e)
{
	out.println(e);
}

%>
        
        
        
        
        
        
        
        
        
        
        
        
        
        <%

try
{	
    
   Class.forName("com.mysql.cj.jdbc.Driver");
        
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/website?serverTimezone=UTC&autoReconnect=true&useSSL=false", "root", "root");

        Statement st =  (Statement) con.createStatement();
        if( request.getParameter("update")!=null )
	{
                int item_id = java.lang.Integer.parseInt(request.getParameter("item_id"));
                String item_name= request.getParameter("item_name");
                String item_des = request.getParameter("item_des");
                String item_cat = request.getParameter("item_cat");
                int item_price = java.lang.Integer.parseInt(request.getParameter("item_price"));
                boolean item_aval = Boolean.parseBoolean(request.getParameter("item_aval"));
                
		st.executeUpdate("update menu set item_name='"+item_name+"',item_des='"+item_des+"',item_cat='"+item_cat+"',item_price="+item_price+",item_aval='"+item_aval+"' where item_id="+item_id);		
		con.close(); 
	}
        if( request.getParameter("insert")!=null )
        {
                String item_name= request.getParameter("insert_name");
                String item_des = request.getParameter("insert_des");
                String item_cat = request.getParameter("but");
                int item_price = java.lang.Integer.parseInt(request.getParameter("insert_price"));
                Boolean item_aval = java.lang.Boolean.parseBoolean(request.getParameter("insert_aval"));
                String img = request.getParameter("insert_img");
                
                
                String sql="insert into menu(item_name,item_des,item_cat,item_price,item_aval,img) values('"+item_name+"','"+item_des+"','"+item_cat+"',"+item_price+","+item_aval+",'"+img+"')";
                st.executeUpdate(sql);		
		con.close(); 
	}
        
}
catch(Exception e)
{
	out.println(e);
}

%>
      

  



        <%
try
{	
	Class.forName("com.mysql.cj.jdbc.Driver");
        
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/website?serverTimezone=UTC&autoReconnect=true&useSSL=false", "root", "root");

        Statement st =  (Statement) con.createStatement();
        if( request.getParameter("delete")!=null )
	{
		int item_id=Integer.parseInt(request.getParameter("item_id"));
               
		st.executeUpdate("delete from menu where item_id="+item_id);		
		con.close(); 
	}
}
catch(Exception e)
{
	out.println(e);
}

%>
<form action="file.jsp" method="post" enctype="multipart/form-data">  
     <input type="file" class="btn btn-secondary btn-lg dropdown-toggle" name="insert_img" style="position:absolute;top:130px;left:120px;background-color: #D65106;font-weight: bold;">
     <button class="form-container btn" style="position:absolute;top:135px;left:10px;background-color: #D65106;font-weight: bold;" onclick="">Add Image</button>     
</form>

<button class="form-container btn" style="position:absolute;top:135px;right:160px;background-color: #D65106;font-weight: bold;" onclick="insertForm()">Add New Item</button>
        <table class="table table-hover table-dark" style="margin-top:11.5%;">
        <%
        try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/website?serverTimezone=UTC&autoReconnect=true&useSSL=false", "root", "root");

        Statement st =  (Statement) con.createStatement();
        ResultSet rs = st.executeQuery("select *,row_number() over(order by item_id) from menu");
        out.println("<center><h2 style='position:relative;top:50px;'>MENU LIST</h2></center>");
        out.print("<tr><th>S.NO.</th><th colspan=2>&nbsp</th><th>Id</th><th>Name</th><th>Description</th><th>Price</th><th>Category</th><th>Avaliability</th></th>");
        while(rs.next()){
            String item_name = rs.getString(1);
            String item_des = rs.getString(2);
            String item_price = rs.getString(3);
            String item_cat = rs.getString(4);
            String item_aval = rs.getString(5);
            String item_id = rs.getString(6);
            String sno = rs.getString(8);
            
            out.print("<tr><td>"+sno+"</td><td><a id='"+item_id+"'  href='#' onclick='openFormid("+item_id+")' >Update</a></td><td><a href='#' onclick='openDeleteForm("+item_id+")' >Delete</a></td><td>"+item_id+"</td><td>"+item_name+"</td><td>"+item_des+"</td><td>"+item_price+"</td><td>"+item_cat+"</td><td>"+item_aval+"</td></tr>");
        }
        }
        catch(Exception e)
        {
        out.println("error("+e+")");
        }
        %>
        </table>
       
         <div class="form-popup" id="insertForm" >
    <form action="admin.jsp" class="form-container" method="post" >
        <h3><center>Insert</center></h3>
    
      <label for="name"><b>Item Name</b></label>
      <input type="text" placeholder="Item Name" name="insert_name" id="item_name" required>
      
      <label for="country"><b>Item Price</b></label>
      <input type="text" placeholder="Item Price" name="insert_price" id="item_price"  required>
  
   
   <div class="dropdown show">
  <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    Category
  </a>
       <input type="hidden" id="but" name="but">
       <script>
           function dropvalue(name)
           {
               document.getElementById("but").value=name;
           }
       </script>
  <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
      <p class="dropdown-item"  onclick="dropvalue('drink')">Drink</p>
      <p class="dropdown-item"  onclick="dropvalue('snacks')">Snacks</p>
      <p class="dropdown-item"  onclick="dropvalue('meal')">Meal</p>
    
</div>
   
   </div>
  
      &nbsp;
      <input type="radio" id="item_aval" name="insert_aval" value="True">
      <label for="Available">Available</label>&nbsp;&nbsp;
      <input type="radio" id="item_aval" name="insert_aval" value="False">
      <label for="Not Available">Not Available</label><br>
      <input type="text" placeholder="File Name"  id="item_img" required name="insert_img"  >
      
      <label for="country"><b>Item Description</b></label>
      <input type="text" placeholder="Item Description" name="insert_des" id="item_des" required>
  
      <button type="submit" class="btn" name="insert" >Insert</button>
      
      <button type="button" class="btn cancel" onclick="insertcloseForm()">Cancel</button>
    </form>

  </div>

        
        
        
        

        
            <div class="form-popup" id="updateForm" >
    <form action="admin.jsp" class="form-container" method="post" >
        <h3><center>Update</center></h3>
  
      <label for="id"><b>Item Id</b></label>
      <input type="text" placeholder="Id" name="item_id" id="update_id" readonly >
  
      <label for="name"><b>Item Name</b></label>
      <input type="text" placeholder="Item Name" name="item_name" id="update_name" required>
      
      <label for="country"><b>Item Price</b></label>
      <input type="text" placeholder="Item Price" name="item_price" id="update_price"  required>
  
      <div class="btn-group">
     <button class="btn btn-secondary btn-lg dropdown-toggle" style="padding:5px 5px;" value="category" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
      Category
     </button>
     <div class="dropdown-menu">
         <a> tea</a>
         <a> coffee</a>
     </div>
     </div>
      &nbsp;
      <input type="radio" id="item_aval" name="item_aval" value="True">
      <label for="Available">Available</label>&nbsp;&nbsp;
      <input type="radio" id="item_aval" name="item_aval" value="False">
      <label for="Not Available">Not Available</label><br>
  
      
      <label for="country"><b>Item Description</b></label>
      <input type="text" placeholder="Item Description" name="item_des" id="update_des" required>
  
      <button type="submit" class="btn" name="update" >Update</button>
      
      <button type="button" class="btn cancel" onclick="closeForm()">Cancel</button>
    </form>
  </div>

        
        

        
        <div class="form-popup" id="deleteForm" style="position:absolute;">
  <form action="admin.jsp" class="form-container" method="post">
    <h2>Delete</h2>

    <label for="item_id"><b>Item Id</b></label>
    <input type="text" placeholder="Item Id" name="item_id" id="delt-id" readonly>

    <button type="submit" class="btn" name="delete" >Delete</button>
    
    <button type="button" class="btn cancel" onclick="closeDeleteForm()">Cancel</button>
  </form>
</div>

        

        
        <table class="table table-hover table-dark">
        <%
        try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/website?serverTimezone=UTC&autoReconnect=true&useSSL=false", "root", "root");

        Statement st =  (Statement) con.createStatement();
        ResultSet rs = st.executeQuery("select *,row_number() over(order by username,email) from feedback");
        out.print("<h2 style='text-align:center;position:relative;top:50px;'>Feedback</h2>");
        out.print("<tr><th>S.NO.</Th><th colspan=2>&nbsp</th><th>Username</th><th>Email</th><th>Active</th><th>Feedback</th></tr>");
        while(rs.next()){
            String feed_id = rs.getString(5);
            String feed_name = rs.getString(1);
            String feed_email = rs.getString(2);
            int feed_active = java.lang.Integer.parseInt(rs.getString(3));
            String feed_feed = rs.getString(4);
            String sno = rs.getString(6);
            out.print("<tr><td>"+sno+"</td><td><form action='allowuser.jsp' method='post'><input type='submit' name='allow' value='Allow'>"
                    + "  <input type='hidden' name='allow_checking' value="+feed_id+"></form></td>"
                            + "<td><form action='allowuser.jsp' method='post'><input type='hidden' name='allow_checking' value="+feed_id+">"
                                    + "<input type='submit' name='allow' value='Delete'></form></td>"
                                    + "<td>"+feed_name+"</td><td>"+feed_email+"</td><td>"+feed_active+"</td><td>"+feed_feed+"</td></tr>");
        }
        }
        catch(Exception e)
        {
        out.println("error("+e+")");
        }
        %>
        </table>

        
       
         <table class="table table-hover table-dark">
        <%
        try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/website?serverTimezone=UTC&autoReconnect=true&useSSL=false", "root", "root");

        Statement st =  (Statement) con.createStatement();
        ResultSet rs = st.executeQuery("select *,row_number() over(order by username,email) from cart");
        out.print("<h2 style='text-align:center;position:relative;top:50px;'>Orders</h2>");
        out.print("<tr><th>S.NO</th><th>Username</th><th>Email</th><th>Amount</th></tr>");
        while(rs.next()){
            String cart_name = rs.getString(1);
            String cart_email = rs.getString(2);
            String amount = rs.getString(3);
            String sno = rs.getString(4);
            out.print("<tr><td>"+sno+"</td><td>"+cart_name+"</td><td>"+cart_email+"</td><td>"+amount+"</td></tr>");
        }
        }
        catch(Exception e)
        {
        out.println("error("+e+")");
        }
        %>
        </table>
        
        <table class="table table-hover table-dark">
 <%
        try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/website?serverTimezone=UTC&autoReconnect=true&useSSL=false", "root", "root");
        Statement st =  (Statement) con.createStatement();
        ResultSet rs = st.executeQuery("select *,row_number() over(order by username,email) from user");
       
        out.print("<h2 style='text-align:center;position:relative;top:50px;'>User</h2>");
        out.print("<tr><th>S.NO.</th><th>Username</th><th>Password</th><th>Email</th><th>Mobile</th><th>Date of Birth</th><th>Address</th></tr>");
        while(rs.next()){
            String username = rs.getString(1);
            String password = rs.getString(2);
            String email = rs.getString(3);
            int mobile = java.lang.Integer.parseInt(rs.getString(4));
            String dob = rs.getString(5);
            String address = rs.getString(6);
            String sno = rs.getString(7);
            out.print("<tr><td>"+sno+"</td><td>"+username+"</td><td>"+password+"</td><td>"+email+"</td><td>"+mobile+"</td><td>"+dob+"</td><td>"+address+"</td></tr>");
        }
        }
        catch(Exception e)
        {
        out.println("error("+e+")");
        }
        %>
        </table>

        
        <script>

    function insertForm() {
    
         document.getElementById("insertForm").style.display = "block";
         //document.getElementById("id1").value = id;
    }
    function insertcloseForm()
    {
        document.getElementById("insertForm").style.display = "none";
    }
    
    function openFormid(temp) {
    
         document.getElementById("updateForm").style.display = "block";
         document.getElementById("update_id").value = temp;
}

function closeForm() {
  document.getElementById("updateForm").style.display = "none";
}

function openDeleteForm(id){
    document.getElementById("deleteForm").style.display="block";
    document.getElementById("delt-id").value = id;
}

function closeDeleteForm(){
    document.getElementById("deleteForm").style.display="none";
}
function error(e)
{
    alert(e);
}

</script>

                
    </body>
</html>

