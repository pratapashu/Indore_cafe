<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import= "java.sql.*" %>
<html lang="en">
   <!-- Basic -->
   <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <!-- Mobile Metas -->
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <!-- Site Metas -->
      <title>Indori Cafe</title>
      <meta name="keywords" content="">
      <meta name="description" content="">
      <meta name="author" content="">
      <!-- Site Icons -->
      <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
      <link rel="apple-touch-icon" href="images/apple-touch-icon.png">
      <!-- Bootstrap CSS -->
      <link rel="stylesheet" href="css/bootstrap.min.css">
      <!-- Site CSS -->
      <link rel="stylesheet" href="css/style.css">
      <!-- Responsive CSS -->
      <link rel="stylesheet" href="css/responsive.css">
      <!-- Custom CSS -->
      <link rel="stylesheet" href="css/custom.css">
 
      <style>
          @import url('https://fonts.googleapis.com/css?family=Source+Sans+Pro:600&display=swap');

* {
  box-sizing: border-box;
  &::before, &::after {
    box-sizing: border-box;
  }
}


input[type="checkbox"] {
  position: relative;
  width: 1.5em;
  height: 1.5em;
  color: black;
  border: 1px solid gray;
  border-radius: 4px;

  outline: 0;
  cursor: pointer;
  transition: background 175ms cubic-bezier(0.1, 0.1, 0.25, 1);
  &::before {
    position: absolute;
    content: '';
    display: block;
    top: 2px;
    left: 7px;
    width: 8px;
    height: 14px;
    border-style: solid;
    border-color: white;
    border-width: 0 2px 2px 0;
    transform: rotate(45deg);
    opacity: 0;
  }
  &:checked {
    color: black;
    border-color: black;
    background: black;
    &::before {
      opacity: 1;
    }
    ~ label::before {
      clip-path: polygon(0 0, 100% 0, 100% 100%, 0 100%);
    }
  }
}

label {
  position: relative;
  cursor: pointer;
  font-size: 1.5em;
  font-weight: 600;
  padding: 0 0.25em 0;
  user-select: none;
  &::before {
    position: absolute;
    content: attr(data-content);
    color: lightgray;
    clip-path: polygon(0 0, 0 0, 0% 100%, 0 100%);
    text-decoration: line-through;
    text-decoration-thickness: 3px;
    text-decoration-color: black;
    transition: clip-path 200ms cubic-bezier(0.25, 0.46, 0.45, 0.94);
  }
}
          </style>
          
   </head>
   <body>
      <!-- Start header -->
      <header class="top-navbar">
         <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container">
               <a class="navbar-brand" href="index.jsp">
               <img src="images/logo.png" alt="" />
               </a>
               <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbars-rs-food" aria-controls="navbars-rs-food" aria-expanded="false" aria-label="Toggle navigation">
               <span class="navbar-toggler-icon"></span>
               </button>
               <div class="collapse navbar-collapse" id="navbars-rs-food">
                   
                   <%
                       try{
                       String name = (String)session.getAttribute("username");
                       String email = (String)session.getAttribute("email");
                          if(name != null && email != null)
                        { 
                        out.print("<h2 style='font-size:30px;position:relative;left:20px;'>Hello ,"+name+"</h2>");    
                        
                         }
                       }
                          catch(Exception e)
                                  {
                                  out.println(e);
                                  }
                   %>
                   
                   
                   
                   
                  <ul class="navbar-nav ml-auto" style="position:relative;right:8%;">
                     <li class="nav-item active">
                        <a class="nav-link" href="index.jsp">Home</a>
                     </li>
                     <li class="nav-item">
                        <a class="nav-link" href="#menu_id" >Menu</a>
                     </li>
                     <li class="nav-item">
                        <a class="nav-link" href="#footer_id">About</a>
                     </li>
                     <!--             <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="dropdown-a" data-toggle="dropdown">Pages</a><div class="dropdown-menu" aria-labelledby="dropdown-a"><a class="dropdown-item" href="reservation.html">Reservation</a><a class="dropdown-item" href="stuff.html">Stuff</a><a class="dropdown-item" href="gallery.html">Gallery</a></div></li>
                        -->
                     <!--			<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="dropdown-a" data-toggle="dropdown">Blog</a><div class="dropdown-menu" aria-labelledby="dropdown-a"><a class="dropdown-item" href="blog.html">blog</a><a class="dropdown-item" href="blog-details.html">blog Single</a></div></li> -->
                     <li class="nav-item">
                        <a class="nav-link" href="#footer_id">Contact</a>
                     </li>
                     <%
                     try{
        
        String name = (String)session.getAttribute("username");
        String email = (String)session.getAttribute("email");
        
            if(name == null && email == null)
            {
     %>
                     <li class="nav-item">
                        <a class="nav-link" href="login.jsp">Login</a>
                     </li>
                     <%
                         }
else{
                     %>
                     <li class="nav-item">
                        <a class="nav-link" href="logout.jsp">Log Out</a>
                     </li>
                     <%
}
}
        catch(Exception e)
        {
        out.println("error("+e+")");
        }
%>
                  </ul>
               </div>
            </div>
         </nav>
      </header>
      <!-- End header -->
      <!-- Start slides -->
      <div id="slides" class="cover-slides">
         <ul class="slides-container">
            <li class="text-left">
               <img src="images/slider-01.jpg" alt="">
               <div class="container">
                  <div class="row">
                     <div class="col-md-12">
                        <h1 class="m-b-20">
                           <strong>Welcome To 
                           <br> Indori Cafe 
                           </strong>
                        </h1>
                        <p class="m-b-40">See how your users experience your website </p>
                     </div>
                  </div>
               </div>
            </li>
            <li class="text-left">
               <img src="images/slider-02.jpg" alt="">
               <div class="container">
                  <div class="row">
                     <div class="col-md-12">
                        <h1 class="m-b-20">
                           <strong>Welcome To 
                           <br> Indori Cafe
                           </strong>
                        </h1>
                        <p class="m-b-40">See how your users experience your website </p>
                     </div>
                  </div>
               </div>
            </li>
            <li class="text-left">
               <img src="images/slider-03.jpg" alt="">
               <div class="container">
                  <div class="row">
                     <div class="col-md-12">
                        <h1 class="m-b-20">
                           <strong>Welcome To 
                           <br>  The World of Indori Taste
                           </strong>
                        </h1>
                        <p class="m-b-40">See how your users experience your website </p>
                     </div>
                  </div>
               </div>
            </li>
         </ul>
         <div class="slides-navigation">
            <a href="#" class="next">
            <i class="fa fa-angle-right" aria-hidden="true"></i>
            </a>
            <a href="#" class="prev">
            <i class="fa fa-angle-left" aria-hidden="true"></i>
            </a>
         </div>
      </div>
      <!-- End slides -->
      <!-- Start About 
         <div class="about-section-box"><div class="container"><div class="row"><div class="col-lg-6 col-md-6 col-sm-12 text-center"><div class="inner-column"><h1>Welcome To <span>Live Dinner Restaurant</span></h1><h4>Little Story</h4><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque auctor suscipit feugiat. Ut at pellentesque ante, sed convallis arcu. Nullam facilisis, eros in eleifend luctus, odio ante sodales augue, eget lacinia lectus erat et sem. </p><p>Sed semper orci sit amet porta placerat. Etiam quis finibus eros. Sed aliquam metus lorem, a pellentesque tellus pretium a. Nulla placerat elit in justo vestibulum, et maximus sem pulvinar.</p><a class="btn btn-lg btn-circle btn-outline-new-white" href="#">Reservation</a></div></div><div class="col-lg-6 col-md-6 col-sm-12"><img src="images/about-img.jpg" alt="" class="img-fluid"></div></div></div></div>
          End About -->
      <!-- Start QT -->
      <div class="qt-box qt-background">
         <div class="container">
            <div class="row">
               <div class="col-md-8 ml-auto mr-auto text-center">
                  <p class="lead ">
                     " If you're not the one cooking, stay out of the way and compliment the chef. "
                  </p>
                  <span class="lead">Michael Strahan</span>
               </div>
            </div>
         </div>
      </div>
      <!-- End QT -->
      <!-- Start Menu -->
      <div class="menu-box" id="menu_id">
         <div class="container">
            <div class="row">
               <div class="col-lg-12">
                  <div class="heading-title text-center">
                     <h2>Special Menu</h2>
                  </div>
               </div>
            </div>
            <div class="row inner-menu-box">
               <div class="col-3">
                  <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                     <a class="nav-link active" id="all_button" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="true">All</a>
                     <a class="nav-link" id="drink_button" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false">Drink </a>
                       <a class="nav-link" id="lunch_button" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false">Snacks </a>
                         <a class="nav-link" id="dinner_button" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false">Meal </a>
                  </div>
               </div>
               <div class="col-9">
                   <form action="cart.jsp" method="post">
                  <div class="tab-content" id="v-pills-tabContent">
                     <div class="tab-pane fade show active" id="all_div" role="tabpanel" aria-labelledby="v-pills-home-tab">
                        <div class="row">
                            <% 
        try{
            
            
        Class.forName("com.mysql.cj.jdbc.Driver");
        
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/website?serverTimezone=UTC&autoReconnect=true&useSSL=false", "root", "root");

        Statement st =  (Statement) con.createStatement();
        
        ResultSet rs = st.executeQuery("select * from menu");
        while(rs.next()){
                            %>
                           <div class="col-lg-4 col-md-6 special-grid drinks" onclick="check(<% out.print(rs.getString(6));%>)">
                              <div class="gallery-single fix" >
                                 <img src="images/<% out.print(rs.getString(7)); %>" class="img-fluid" alt="Image" ">
                                 <div class="why-text">
                                    <h4><% out.print(rs.getString(1)); %></h4>
                                    <p><% out.print(rs.getString(2)); %></p>
                                    <h5> $<% out.print(rs.getString(3));%></h5>
                                 </div>
                            </div>
       <input type="checkbox" id="<% out.print(rs.getString(6));%>" name="marked" value="<% out.print(rs.getString(6));%>" onclick="visible()">
<label for="todo" data-content="Get out of bed">Add to Cart</label>
                           </div>
                                 
<%
}
}
        catch(Exception e)
        {
        out.println("error("+e+")");
        }
%>                        </div>
                     </div>
                     
                     
                     <div class="tab-pane fade show active" id="drink_div" role="tabpanel" aria-labelledby="v-pills-home-tab">
                        <div class="row">
                            <% 
        
        try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/website?serverTimezone=UTC&autoReconnect=true&useSSL=false", "root", "root");

        Statement st =  (Statement) con.createStatement();
        
        ResultSet rs = st.executeQuery("select * from menu where item_cat = 'drink'");
        while(rs.next()){
                            %>
                           <div class="col-lg-4 col-md-6 special-grid drinks">
                              <div class="gallery-single fix" >
                                 <img src="images/<% out.print(rs.getString(7)); %>" class="img-fluid" alt="Image" ">
                                 <div class="why-text">
                                    <h4><% out.print(rs.getString(1)); %></h4>
                                    <p><% out.print(rs.getString(2)); %></p>
                                    <h5> $<% out.print(rs.getString(3));%></h5>
                                 </div>
                              </div>
             <input type="checkbox" id="<% out.print(rs.getString(6));%>" name="marked" value="<% out.print(rs.getString(6));%>">
<label for="todo" data-content="Get out of bed">Add to Cart</label>
                           </div>
<%
}
}
        catch(Exception e)
        {
        out.println("error("+e+")");
        }
%>                        </div>
                     </div>
                     
                    
                     <div class="tab-pane fade show active" id="lunch_div" role="tabpanel" aria-labelledby="v-pills-home-tab">
                        <div class="row">
                            <% 
        
        try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/website?serverTimezone=UTC&autoReconnect=true&useSSL=false", "root", "root");

        Statement st =  (Statement) con.createStatement();
        
        ResultSet rs = st.executeQuery("select * from menu where item_cat = 'lunch'");
        while(rs.next()){
                            %>
                           <div class="col-lg-4 col-md-6 special-grid drinks">
                              <div class="gallery-single fix" >
                                 <img src="images/<% out.print(rs.getString(7)); %>" class="img-fluid" alt="Image" ">
                                 <div class="why-text">
                                    <h4><% out.print(rs.getString(1)); %></h4>
                                    <p><% out.print(rs.getString(2)); %></p>
                                    <h5> $<% out.print(rs.getString(3));%></h5>
                                 </div>
                              </div>
              <input type="checkbox" id="<% out.print(rs.getString(6));%>" name="marked" value="<% out.print(rs.getString(6));%>">
<label for="todo" data-content="Get out of bed">Add to Cart</label>
                           </div>
<%
}
}
        catch(Exception e)
        {
        out.println("error("+e+")");
        }
%>                        </div>
                     </div>
                     
                     
                     <div class="tab-pane fade show active" id="dinner_div" role="tabpanel" aria-labelledby="v-pills-home-tab">
                        <div class="row">
                            <% 
        
        try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/website?serverTimezone=UTC&autoReconnect=true&useSSL=false", "root", "root");

        Statement st =  (Statement) con.createStatement();
        
        ResultSet rs = st.executeQuery("select * from menu where item_cat = 'dinner'");
        while(rs.next()){
                            %>
                           <div class="col-lg-4 col-md-6 special-grid drinks">
                              <div class="gallery-single fix" >
                                 <img src="images/<% out.print(rs.getString(7)); %>" class="img-fluid" alt="Image" ">
                                 <div class="why-text">
                                    <h4><% out.print(rs.getString(1)); %></h4>
                                    <p><% out.print(rs.getString(2)); %></p>
                                    <h5> $<% out.print(rs.getString(3));%></h5>
                                 </div>
                              </div>
                <input type="checkbox" id="<% out.print(rs.getString(6));%>" name="marked" value="<% out.print(rs.getString(6));%>">
<label for="todo" data-content="Get out of bed">Add to Cart</label>
                           </div>
<%
}
}
        catch(Exception e)
        {
        out.println("error("+e+")");
        }
%>                        </div>
                     </div>
                   
                  </div>
    <input type="submit" id="place_order" style="background-color: #D65106;z-index:20;position:fixed;top:30px;border-radius: 4px;font-size:16px;right:100px;border: none;color: white;padding: 10px 20px;text-align: center;text-decoration: none;display: inline-block;margin: 2px 1px;cursor: pointer;" value="Order">                
                   </form>
  
   
               </div>
            </div>
         </div>
      </div>
      <!-- End Menu -->
      <!-- Start Gallery -->
      <div class="gallery-box">
      <div class="container">
      <div class="row">
         <div class="col-lg-12">
            <div class="heading-title text-center">
               <h2>Gallery</h2>
            </div>
         </div>
      </div>
      <div class="tz-gallery">
         <div class="row">
            <div class="col-sm-12 col-md-4 col-lg-4">
               <a class="lightbox" href="images/gallery-img-01.jpg">
               <img class="img-fluid" src="images/gallery-img-01.jpg" alt="Gallery Images">
               </a>
            </div>
             <div class="col-sm-12 col-md-4 col-lg-4">
               <a class="lightbox" href="images/gallery-img-02.jpg">
               <img class="img-fluid" src="images/gallery-img-02.jpg" alt="Gallery Images">
               </a>
            </div>
             <div class="col-sm-12 col-md-4 col-lg-4">
               <a class="lightbox" href="images/gallery-img-03.jpg">
               <img class="img-fluid" src="images/gallery-img-03.jpg" alt="Gallery Images">
               </a>
            </div>
            <!--	<div class="col-sm-6 col-md-4 col-lg-4"><a class="lightbox" href="images/gallery-img-02.jpg"><img class="img-fluid" src="images/gallery-img-02.jpg" alt="Gallery Images"></a></div><div class="col-sm-6 col-md-4 col-lg-4"><a class="lightbox" href="images/gallery-img-03.jpg"><img class="img-fluid" src="images/gallery-img-03.jpg" alt="Gallery Images"></a></div><div class="col-sm-12 col-md-4 col-lg-4"><a class="lightbox" href="images/gallery-img-04.jpg"><img class="img-fluid" src="images/gallery-img-04.jpg" alt="Gallery Images"></a></div><div class="col-sm-6 col-md-4 col-lg-4"><a class="lightbox" href="images/gallery-img-05.jpg"><img class="img-fluid" src="images/gallery-img-05.jpg" alt="Gallery Images"></a></div><div class="col-sm-6 col-md-4 col-lg-4"><a class="lightbox" href="images/gallery-img-06.jpg"><img class="img-fluid" src="images/gallery-img-06.jpg" alt="Gallery Images"></a></div></div></div>
               -->
         </div>
      </div>
      <!-- End Gallery -->
      <!-- Start Customer Reviews -->
      <div class="customer-reviews-box">
         <div class="container">
            <div class="row">
               <div class="col-lg-12">
                  <div class="heading-title text-center">
                     <h2>Customer Reviews</h2>
                  </div>
               </div>
            </div>
             
            <div class="row">
               <div class="col-md-8 mr-auto ml-auto text-center">
                  <div id="reviews" class="carousel slide" data-ride="carousel">
                     <div class="carousel-inner mt-4">
                        <div class="carousel-item text-center active">
                           <div class="img-box p-1 border rounded-circle m-auto">
                              <img class="d-block w-100 rounded-circle" src="images/quotations-button.png" alt="">
                           </div>
                           <h5 class="mt-4 mb-0">
                              <strong class="text-warning text-uppercase">Indori Cafe</strong>
                           </h5>
                           <h6 class="text-dark m-0">Email</h6>
                           <p class="m-0 pt-3">Feedback     </div> 

                         
                            <% 
        
        try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/website?serverTimezone=UTC&autoReconnect=true&useSSL=false", "root", "root");

        Statement st =  (Statement) con.createStatement();
        
        ResultSet rs = st.executeQuery("select * from feedback where active = 1");
        while(rs.next()){
                            %>
                         
                            <div class="carousel-item text-center ">
                           <div class="img-box p-1 border rounded-circle m-auto">
                              <img class="d-block w-100 rounded-circle" src="images/quotations-button.png" alt="">
                           </div>
                           <h5 class="mt-4 mb-0">
                              <strong class="text-warning text-uppercase"><% out.print(rs.getString(1));%></strong>
                           </h5>
                           <h6 class="text-dark m-0"><% out.print(rs.getString(2));%></h6>
                           <p class="m-0 pt-3"><% out.print(rs.getString(4));%>   
                            </div>
                        
<%
}
}
        catch(Exception e)
        {
        out.println("error("+e+")");
        }
%>                                                  
                            
                            
        </div>
                     <a class="carousel-control-prev" href="#reviews" role="button" data-slide="prev">
                     <i class="fa fa-angle-left" aria-hidden="true"></i>
                     <span class="sr-only">Previous</span>
                     </a>
                     <a class="carousel-control-next" href="#reviews" role="button" data-slide="next">
                     <i class="fa fa-angle-right" aria-hidden="true"></i>
                     <span class="sr-only">Next</span>
                     </a>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- End Customer Reviews -->
      <!-- Add feedback -->
      <div class="comment-respond-box">
         <h3>Leave your comment </h3>
         
         <div class="comment-respond-form">
            <form action="admin.jsp" class="comment-form-respond row" method="post">
               <div class="col-lg-6 col-md-6 col-sm-6">
                   
                  <div class="form-group">
                     <input id="name_com" class="form-control" name="feedback_name" placeholder="Name" type="text">
                  </div>
                  <div class="form-group">
                     <input id="email_com" class="form-control" name="feedback_email" placeholder="Your Email" type="email">
                  </div>
               </div>
               <div class="col-lg-6 col-md-6 col-sm-6">
                  <div class="form-group">
                     <textarea class="form-control" id="textarea_com" name="feedback_feed" placeholder="Your Message" rows="2"></textarea>
                  </div>
               </div>
               <div class="col-lg-12 col-md-12 col-sm-12">
                  <input type="submit" name="feedback_submit" class="btn btn-submit" value="Submit Comment">
               </div>
            </form>
         </div>
      </div>
      <!-- End feedback-->
      <br>
      <Br>
      <!-- Start Contact info 
         <div class="contact-imfo-box"><div class="container"><div class="row"><div class="col-md-4 arrow-right"><i class="fa fa-volume-control-phone"></i><div class="overflow-hidden"><h4>Phone</h4><p class="lead">
         						+01 123-456-4590
         					</p></div></div><div class="col-md-4 arrow-right"><i class="fa fa-envelope"></i><div class="overflow-hidden"><h4>Email</h4><p class="lead">
         						yourmail@gmail.com
         					</p></div></div><div class="col-md-4"><i class="fa fa-map-marker"></i><div class="overflow-hidden"><h4>Location</h4><p class="lead">
         						800, Lorem Street, US
         					</p></div></div></div></div></div>
          End Contact info -->
      <!-- Start Footer -->
      <footer class="footer-area bg-f" id="footer_id">
         <div class="container">
            <div class="row">
               <div class="col-lg-3 col-md-6">
                  <h3>About Us</h3>
                  <p>Indorii Cafe has some pretty cool and different recipes, that look delicious! Aside from that, you can purchase their food for home .</p>
               </div>
               <!--				<div class="col-lg-3 col-md-6"><h3>Subscribe</h3><div class="subscribe_form"><form class="subscribe_form"><input name="EMAIL" id="subs-email" class="form_input" placeholder="Email Address..." type="email"><button type="submit" class="submit">SUBSCRIBE</button><div class="clearfix"></div></form></div><ul class="list-inline f-social"><li class="list-inline-item"><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li><li class="list-inline-item"><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li><li class="list-inline-item"><a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li><li class="list-inline-item"><a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a></li><li class="list-inline-item"><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li></ul></div>
                  -->
               <div class="col-lg-3 col-md-6">
                  <h3>Contact information</h3>
                  <p class="lead">Atik Raiwal</p>
                  <p class="lead">Al Akmar Shafin</p>
                  <p class="lead">Aditya Chouhan</p>
                  <p class="lead">Aadarsh Laad</p>
                  <p class="lead">Gourav Parwal</p>
                  <p>
                     <a href="#"> quizanswers.mail@gmail.com</a>
                  </p>
               </div>
               <div class="col-lg-3 col-md-6">
                  <h3>Opening hours</h3>
                  <p>
                     <span class="text-color">Monday: </span>Closed
                  </p>
                  <p>
                     <span class="text-color">Tue-Wed :</span> 9:Am - 10PM
                  </p>
                  <p>
                     <span class="text-color">Thu-Fri :</span> 9:Am - 10PM
                  </p>
                  <p>
                     <span class="text-color">Sat-Sun :</span> 5:PM - 10PM
                  </p>
               </div>
            </div>
         </div>
         <div class="copyright">
            <div class="container">
               <div class="row">
                  <div class="col-lg-12">
                     <p class="company-name">All Rights Reserved. &copy; 2018 
                        <a href="#">Live Dinner Restaurant</a> Design By : 
                        <a href="https://html.design/">html design</a>
                     </p>
                  </div>
               </div>
            </div>
         </div>
          
 
          
          
      </footer>
      <!-- End Footer -->
      <a href="#" id="back-to-top" title="Back to top" style="display: none;">
      <i class="fa fa-paper-plane-o" aria-hidden="true"></i>
      </a>
      <!-- ALL JS FILES -->
      <script src="js/jquery-3.2.1.min.js"></script>
      <script src="js/popper.min.js"></script>
      <script src="js/bootstrap.min.js"></script>
      <!-- ALL PLUGINS -->
      <script src="js/jquery.superslides.min.js"></script>
      <script src="js/images-loded.min.js"></script>
      <script src="js/isotope.min.js"></script>
      <script src="js/baguetteBox.min.js"></script>
      <script src="js/form-validator.min.js"></script>
      <script src="js/contact-form-script.js"></script>
      <script src="js/custom.js"></script>
      
      
      <script>
      $(document).ready(function(){        $("#drink_div").hide();
    $("#lunch_div").hide();
    $("#dinner_div").hide();
$("#place_order").hide();
  $("#all_button").click(function(){
    $("#all_div").show();
        $("#drink_div").hide();
    $("#lunch_div").hide();
    $("#dinner_div").hide();
  });
});  

      $(document).ready(function(){
$("#drink_button").click(function(){
    $("#drink_div").show();
    $("#all_div").hide();
    $("#lunch_div").hide();
    $("#dinner_div").hide();
  });
});

   $(document).ready(function(){
$("#lunch_button").click(function(){
    $("#lunch_div").show();
    $("#all_div").hide();
    $("#drink_div").hide();
    $("#dinner_div").hide();
  });
});

   $(document).ready(function(){
$("#dinner_button").click(function(){
    $("#dinner_div").show();
    $("#all_div").hide();
    $("#lunch_div").hide();
    $("#drink_div").hide();
  });
});
      </script> 
           
      <script>
       function visible() {
  var x = document.getElementsByName("marked");
  var i,s="";
  for (i = 0; i < x.length; i++) {
    if (x[i].type == "checkbox") {
      if(x[i].checked == true){
        s = s + x[i].value + " ";
      }
    }
  }
  if(s === "")
  {
      document.getElementById("place_order").style.display = "none";
  }
  else{
      document.getElementById("place_order").style.display = "block";
  }
}


       </script>
   </body>
</html>
