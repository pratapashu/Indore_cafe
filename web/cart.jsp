<%-- 
    Document   : cart
    Created on : 17 Sep, 2020, 3:24:18 PM
    Author     : atikr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import= "java.sql.*" %>
<!DOCTYPE html>
<html lang="en" class=" -webkit-" id="html1"><head>

  <meta charset="UTF-8">
  
<link rel="apple-touch-icon" type="image/png" href="https://static.codepen.io/assets/favicon/apple-touch-icon-5ae1a0698dcc2402e9712f7d01ed509a57814f994c660df9f7a952f3060705ee.png">
<meta name="apple-mobile-web-app-title" content="CodePen">

<link rel="shortcut icon" type="image/x-icon" href="https://static.codepen.io/assets/favicon/favicon-aec34940fbc1a6e787974dcd360f2c6b63348d4b1f4e06c77743096d55480f33.ico">

<link rel="mask-icon" type="" href="https://static.codepen.io/assets/favicon/logo-pin-8f3771b1072e3c38bd662872f6b673a722f4b3ca2421637d5596661b4e2132cc.svg" color="#111">


  <title>Indori Cafe Payment</title>
  <meta name="viewport" content="width=device-width">
  <style media="" data-href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">html,body,div,span,applet,object,iframe,h1,h2,h3,h4,h5,h6,p,blockquote,pre,a,abbr,acronym,address,big,cite,code,del,dfn,em,img,ins,kbd,q,s,samp,small,strike,strong,sub,sup,tt,var,b,u,i,center,dl,dt,dd,ol,ul,li,fieldset,form,label,legend,table,caption,tbody,tfoot,thead,tr,th,td,article,aside,canvas,details,embed,figure,figcaption,footer,header,hgroup,menu,nav,output,ruby,section,summary,time,mark,audio,video{margin:0;padding:0;border:0;font-size:100%;font:inherit;vertical-align:baseline}article,aside,details,figcaption,figure,footer,header,hgroup,menu,nav,section{display:block}body{line-height:1}ol,ul{list-style:none}blockquote,q{quotes:none}blockquote:before,blockquote:after,q:before,q:after{content:'';content:none}table{border-collapse:collapse;border-spacing:0}</style>

  
  
<style>
html {
  background-image: url('images/img-01.jpg');
  background-size: cover;
  font: 62.5%/1.5em "Trebuchet Ms", helvetica;
}

* {
  box-sizing: border-box;
  -webkit-font-smoothing: antialiased;
  -webkit-font-smoothing: antialiased;
}

@font-face {
    font-family: 'Shopper';
    src: url('http://www.shopperfont.com/font/Shopper-Std.ttf');
}

.shopper {
  text-transform: lowercase;
  font: 2em 'Shopper', sans-serif;
  line-height: 0.5em;
  display: inline-block;
}



h1 {
  text-transform: uppercase;
  font-weight: bold;
  font-size: 2.5em;
}

p {
  font-size: 1.5em;
  color: #8a8a8a;
}

input {
  border: 0.3em solid #bbc3c6;
  padding: 0.5em 0.3em; 
  font-size: 1.4em;
  color: #8a8a8a;
  text-align: center;
}

img {
  max-width: 9em;
  width: 100%;
  overflow: hidden; 
  margin-right: 1em;
}

a {
  text-decoration: none;
}

.container {
  max-width: 75em;
  width: 95%;
  margin: 40px auto;  
  overflow: hidden;
  position: relative;
  
  border-radius: 0.6em;
  background: #ecf0f1;
  box-shadow: 0 0.5em 0 rgba(138, 148, 152, 0.2);
}

.heading {
  padding: 1em;
  position: relative;
  z-index: 1;
  color: #f7f7f7;
  background: #D65106;
}

.cart {
  margin: 2.5em;
  overflow: hidden;
}

.cart.is-closed {
  height: 0;
  margin-top: -2.5em;
}

.table {
  background: #ffffff;
  border-radius: 0.6em;
  overflow: hidden;
  clear: both;
  margin-bottom: 1.8em;
}


.layout-inline > * {
  display: inline-block;
}

.align-center {
  text-align: center;
}

.th {
  background: #D65106;
  color: #fff;
  text-transform: uppercase;
  font-weight: bold;
  font-size: 1.5em;
}

.tf {
  background: #D65106;
  text-transform: uppercase;
  text-align: right;
  font-size: 1.2em;  
}

.tf p {
  color: #fff;
  font-weight: bold;
}

.col {
  padding: 1em;
  width: 12%;
}

.col-pro {
  width: 44%;
}

.col-pro > * {
  vertical-align: middle;
}

.col-qty {
  text-align: center;
  width: 17%;
}

.col-numeric p {
  font: bold 1.8em helvetica;
}

.col-total p {
  color: #12c8b1;
}

.tf .col {
  width: 20%;
}

.row > div {
  vertical-align: middle;
}

.row-bg2 {
  background: #f7f7f7;
}

.visibility-cart {
  position: absolute;
  color: #fff;
  top: 0.5em;
  right: 0.5em;
  font:  bold 2em arial;
  border: 0.16em solid #fff;
  border-radius: 2.5em;
  padding: 0 0.22em 0 0.25em ;
}

.col-qty > * {
  vertical-align: middle; 
}

.col-qty > input {
  max-width: 2.6em;
}


a.qty {
  width: 1em;
  line-height: 1em;
  border-radius: 2em;
  font-size: 2.5em;
  font-weight: bold;
  text-align: center;
  background: #43ace3;  
  color: #fff;
}

a.qty:hover {
  background: #3b9ac6;
}

.btn {
  padding: 10px 30px;
  border-radius: 0.3em;
  font-size: 1.4em;
  font-weight: bold;
  background: #43ace3;
  color: #fff;
  box-shadow: 0 3px 0 rgba(59,154,198, 1)
}

.btn:hover {
  box-shadow: 0 3px 0 rgba(59,154,198, 0)
}

.btn-update {
  float: right;
  margin: 0 0 1.5em 0;
}

.transition {
  transition: all 0.3s ease-in-out;
}

@media screen and ( max-width: 755px) {
  .container {
    width: 98%;
  }
  
  .col-pro {
    width: 35%;
  }
  
  .col-qty {
    width: 22%;
  }
  
  img {
    max-width: 100%;
    margin-bottom: 1em;
  }
}

@media screen and ( max-width: 591px) {
  
}
</style>

  <script>
  window.console = window.console || function(t) {};
</script>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>

  
  <script>
  if (document.location.search.match(/type=embed/gi)) {
    window.parent.postMessage("resize", "*");
  }
</script>
<!--
<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet" href="css/responsive.css">
 <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  -->
  
  <script>
      
      function popup()
      {
          document.getElementById("popup").style.display = "block";
          document.style.backgroundImage = "url('images/confirmOrder.gif')";
      }
  </script>
</head>

<body translate="no" style="background-image: url('images/gallery-img-04');">
    
    
  <div class="container">
  <div class="heading">
    <h1>
      <span class="shopper"></span>Cart
    </h1>
    
    <a href="#" class="visibility-cart transition is-open">X</a>    
  </div>
  
  <div class="cart transition is-open">
        <div class="col-lg-12 col-md-12 col-sm-12">
            <a href="index.jsp" style="background-color: #D65106;z-index:20;position:fixed;top:95px;border-radius: 4px;font-size:16px;border: none;color: white;padding: 10px 20px;text-align: center;text-decoration: none;display: inline-block;margin: 2px 1px;cursor: pointer;" >Back</a>                
    
        </div>
      <br><br><br><br>
      
      <form action="confirmorder.jsp" method="post">
    <div class="table">
      
      <div class="layout-inline row th">
        <div class="col col-pro">Product</div>
		<div class="col "></div>
        <div class="col col-price align-center "> 
          
        </div>
        <div class="col col-qty align-center">QTY</div>
        
        <div class="col">Price</div>
      </div>
      
    <%
        
        
    String checkbox[] = request.getParameterValues("marked");
    int total=0; 
    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/website?serverTimezone=UTC&autoReconnect=true&useSSL=false", "root", "root");
        Statement st =  (Statement) con.createStatement();
        
        String name = (String)session.getAttribute("username");
        String email = (String)session.getAttribute("email");
        
            if(name == null && email == null)
            {
            response.sendRedirect("login.jsp");
            }

        
       else{
      
        String sql = "select * from menu where item_id in (";
        for(String i:checkbox)
            sql = sql + "'" + i + "'" + ",";
        
        sql = sql.substring( 0 , sql.length() - 1);
        sql += ")";
        
        ResultSet rs = st.executeQuery(sql);
        while(rs.next()){
            total += java.lang.Integer.parseInt(rs.getString(3));
     %>
     
      <div class="layout-inline row">
        
        <div class="col col-pro layout-inline">
          <ximg src="https://static.ddmcdn.com/gif/10-kitten-cuteness-1.jpg" alt="kitten">
          <p style="text-transform:uppercase;font-weight: bold;color:black;"><% out.print(rs.getString(1));%></p>
        </div>
        <div class="col "></div>
        <div class="col col-price col-numeric align-center ">
          <p></p>
        </div>

        <div class="col col-qty layout-inline">
          <a href="#" class="qty qty-minus" style="background-color: #D65106; box-shadow: none;color:black;">-</a>
            <input type="numeric" value="1" style="background-color: white;border:4px solid;font-size:13px; box-shadow: none;">
          <a href="#" class="qty qty-plus" style="background-color: #D65106; box-shadow: none;">+</a>
        </div>
        
       
        <div class="col col-total col-numeric" sxtyle="position:relative;right:-30px;">               
					<input type="hidden" value="<% out.print(rs.getString(3));%>"></input>
					<p style="color: black;">$ <% out.print(rs.getString(3));%> </p>
        </div>
      </div>
      <%
          }   
}
}
        catch(Exception e)
        {
        out.println("error("+e+")");
        }
%>
 

  <div class="tf">
	<div class="row layout-inline" >
           <div class="col">
                <p>Total</p>
           </div>
	 <input type="hidden" id="total1" value="<% out.print(total);%>"></input>
                <div class="col col-numeric" style="position:relative;right:50px" >
                  <p id="total2"  value=""><% out.print(total);%></p>
                  <input type="hidden" name="amount" id="total3" value="<% out.print(total);%>">
                </div>
        </div>
   </div>         
<br>
<Br>
    
    <input type="submit" id="confirm" name="confirmOrder" style="background-color: #D65106;z-index:20;position:relative;border-radius: 4px;top:0px;font-size:16px;border: none;color: white;padding: 10px 20px;text-align: center;text-decoration: none;display: inline-block;margin: 2px 1px;cursor: pointer;" value="Confirm Order">                
    
  
</div>
  </form>  
    <script src="https://static.codepen.io/assets/common/stopExecutionOnTimeout-157cd5b220a5c80d4ff8e0e70ac069bffd87a61252088146915e8726e5d9f147.js"></script>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
  
  <div id="popup" style="z-index: 30;position:fixed;display: none;">
      <img id="img1" src="" alt="">
  </div>
  
  
  
      <script id="rendered-js">
	  
	var total =   parseInt( $("#total1").val());
	$("#total2").text(total);
$('.visibility-cart').on('click', function () {
	
  var $btn = $(this);
  var $cart = $('.cart');
  console.log($btn);

  if ($btn.hasClass('is-open')) {
    $btn.removeClass('is-open');
    $btn.text('O');
    $cart.removeClass('is-open');
    $cart.addClass('is-closed');
    $btn.addClass('is-closed');
  } else {
    $btn.addClass('is-open');
    $btn.text('X');
    $cart.addClass('is-open');
    $cart.removeClass('is-closed');
    $btn.removeClass('is-closed');
  }


});

// SHOPPING CART PLUS OR MINUS
$('a.qty-minus').on('click', function (e) {
  e.preventDefault();
  var $this = $(this);
  var $input = $this.closest('div').find('input');
  var value = parseInt($input.val());
	var Tval = value;
  if (value > 1) {
    value = value - 1;
  } else {
    value = 1;
  }
var $rs = $this.parent().parent().find(".col-total").find("p");
var $rsValue = $this.parent().parent().find(".col-total").find("input");

	$rs.text("$ "+ value * parseInt($rsValue.val()));
	
	if(parseInt($rsValue.val()) < total && value !=Tval )
	{
		total = total - parseInt($rsValue.val());
		$("#total1").val(total);
		$("#total2").text("$ " + total);
                $("#total3").val(total);
	}
	else if(value !=1)
	{
		total = total - parseInt($rsValue.val());
		$("#total1").val(0);
		$("#total2").text("$ " + "0");
                $("#total3").val(total);
	}
	
	$input.val(value);

});

$('a.qty-plus').on('click', function (e) {
  e.preventDefault();
  var $this = $(this);
  var $input = $this.closest('div').find('input');
  var value = parseInt($input.val());
	var Tval = value;
  if (value < 10) {
    value = value + 1;
  } else {
    value = 10;
  }
	
var $rs = $this.parent().parent().find(".col-total").find("p");
var $rsValue = $this.parent().parent().find(".col-total").find("input");

	$rs.text("$ "+ value * parseInt($rsValue.val()));
	
	if( total && value !=Tval )
		{
			total = total + parseInt($rsValue.val());
			$("#total1").val(total);
			$("#total2").text("$ " + total );
                        $("#total3").val(total);
		}
	
  $input.val(value);
});

// RESTRICT INPUTS TO NUMBERS ONLY WITH A MIN OF 0 AND A MAX 100
$('input').on('blur', function () {

  var input = $(this);
  var value = parseInt($(this).val());

  if (value < 0 || isNaN(value)) {
    input.val(0);
  } else if (
  value > 100) {
    input.val(100);
  }
});
//# sourceURL=pen.js
    </script>

</div>
  </body>
  </html>
