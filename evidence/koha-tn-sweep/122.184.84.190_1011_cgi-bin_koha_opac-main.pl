


































<!DOCTYPE html>
<!-- TEMPLATE FILE: opac-main.tt -->









<html lang="en" class="no-js">
<head>

<title>Koha online catalog</title>
<link rel="canonical" href="/" />



<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="generator" content="Koha" />
<!-- leave this for stats -->
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="csrf-token" content="9e92a050a1549e1ebe8cee852b43b198bfa31079,39184d7bb9e63916254a920ad0856591b0ec9713,1794130591" />


<link rel="shortcut icon" href="/opac-tmpl/bootstrap/images/favicon.ico" type="image/x-icon" />
<link rel="apple-touch-icon" href="/opac-tmpl/bootstrap/images/favicon.ico" type="image/x-icon" />

    
        
    


    <link rel="stylesheet" type="text/css" href="/opac-tmpl/bootstrap/css/opac_25.0502000.css">




    <link media="print" href="/opac-tmpl/bootstrap/css/print_25.0502000.css" type="text/css" rel="stylesheet">


    <!-- prettier-ignore-start -->
    <style>#loggedinuser-menu .divider-vertical {
    margin: 0px;
}
#members .divider-vertical {
    border: none;
}
.dropdown-menu {
  
  background-color: #fff;
}
.navbar {
    position: relative;
    padding: 0px 10px 0px 10px;
}
.main nav{

    background: none;

}
nav {
	/* Repeating background image */
	/*background: #283b66;*/
  background:#fff;
	margin:2px;
        /*border:1px solid #283b66; */        
}
.navbar-nav>li>a {
    color: #000!important;
    font-weight: 700;
}
nav ul {
	/* Removes bullet points */
	list-style:none;
	margin:0;
	padding:5px;      	
}
nav ul li {
	/* Any child positioned absolutely will be positioned relative to this */
	position:relative;
}
#OpacMainUserBlock.default_item{
      margin-left: 7%;
    margin-right: 3%;
}
marquee{
      background: #283b66;
    margin-top: -6px;
    padding-top: 10px;
    color: yellow;
    font-weight: 700;
    font-family: sans-serif;
      padding-bottom: 9px;
}
marquee span { 
    margin-right: 100%; 
    } 
    marquee p { 
    white-space:nowrap;
    margin-right: 1000px; 
    } 
nav a {
	color:#000000;
	/*padding:30px 0px; */
	/* Fill all available horizontal space */
	display:block;
	/* Remove underline */
	text-decoration:none;
	/* 
	New CSS3 animations:
	apply transition to background property, taking 1s to change it 
	*/
	transition:background 1s;
	-moz-transition:background 1s;
	-webkit-transition:background 1s;
	-o-transition:background 1s;
	font-family:sans-serif;
	font-size:12px;
	padding-left:5px;
       /* border-top:1px solid #ffffff; */
                
}
.fa.fa-icon-black, .fa.fa-icon-white {
    color: #000!important;
}
nav a:hover {
	/* 
	RGBA background for transparancy: 
	last number(0.05) is the transparency 
	*/
	/*background: RGBA(255,255,255,0.35); */
	color:#fff;
	
}
/*nav a:hover span {
	background: #ff0000;
	transform:rotate(90deg);
	-moz-transform:rotate(90deg);
	-webkit-transform:rotate(90deg);
}*/
nav ul li:hover ul {
	display:block;
}
nav ul ul {
	position:absolute;
	left:200px;
	top:0;
	border-top:0px solid #000000;
	display:none;
}
nav ul ul li {
	width:150px;
	background:#283b66;
	border:1px solid #000000;
	border-top:0;
}
nav ul ul li a {
	color:#ffffff;
	font-size:8px;
	text-transform:none;
}
nav ul ul li a:hover {
	color:#000000;
}
nav span {
	/*width:12px;
	height:12px;
	background:#fff;
	display:inline-block;
	float:left;
	margin-top:0px;
	margin-right:15px; 
	position:relative;
	transition:all 0.5s;
	-moz-transition:all 0.5s;
	-o-transition:all 0.5s;
	-webkit-transition:all 0.5s; */
  color:#000;
}
/*
nav span:before {
	content:"";
	width:12px;
	height:2px;
	background:#3a3b3b;
	position:absolute;
	left:0px;
	top:5px;
}
nav span:after {
	content:"";
	width:2px;
	height:12px;
	background:#3a3b3b;
	position:absolute;
	left:5px;
	position:top;
}
*/
.cartlabel:after{
  
  display: inline-block;
    margin-left: .255em;
    vertical-align: .255em;
    content: "";
    border-top: .3em solid;
    border-right: .3em solid transparent;
    border-bottom: 0;
    border-left: .3em solid transparent;
}



.example {
     
    width:100%;
    height:auto;
margin:2px auto;
    
    
    padding:0px;
    border-radius:3px;
    
}


/* main menu styles */
#nav {
    display:inline-block;
    width:100%;

    margin:0 auto;
    padding:0;
    /*background-color:#2185b7;*/
    /*background-color:#283b66;*/
  background-color:#2d325cdb;
}
#nav li {
    margin:2px;
    float:left;
    position:relative;
    list-style:none;
z-index:99;
padding-left: 15px;
}
#nav a {
    font-weight:bold;
    color:#fff;
    text-decoration:none;
    display:block;
    padding:10px 5px;

   
}

/* selected menu element */
#nav .current a, #nav li:hover > a {
    background:#fc7e1e url(../images/bg.png) repeat-x 0 -20px;
    color:#000;
    border-top:1px solid #f8f8f8;

    
}

/* sublevels */
#nav ul li:hover a, #nav li:hover li a {
    background:none;
    border:none;
    color:#fff;
}
#nav ul li a:hover {
    background:#538200 url(../images/bg.png) repeat-x 0 -100px;
    color:#fff;

}

#nav ul li:first-child > a {
    
}
#nav ul li:last-child > a {
    
}

/* drop down */
#nav li:hover > ul {
    opacity:1;
    visibility:visible;
}
#nav ul {
    opacity:0;
    visibility:hidden;
    padding:0;
    width:275px;
    position:absolute;
    background:#069 url(../images/bg.png) repeat-x 0 0;
    border:1px solid #7788aa;

    
   
}
#nav ul li {
    float:none;
    margin:0;
}
#nav ul a {
    font-weight:normal;
    text-shadow:0 2px 2px rgba(255,255,255, 0.7);
}
#nav ul ul {
    left:160px;
    top:0px;
}

/*Change navbar color to red*/
/*.navbar-inverse .navbar-inner {
    background-image: linear-gradient(to bottom, #680A1A, #680A1A);
    border-color: #680A1A;
    background-color: #680A1A;
}*/
 
/*change navbar font to white*/
.navbar-inverse .brand, .navbar-inverse .nav > li > a, #members a {
    color: #000 !important;
}
 
/*remove black bars from nav bar*/
.navbar-inverse .divider-vertical {
    border-left: none;
    border-right: none;
}


/* Added by Perumal*/
#daily-quote {
  border: 3px solid #D9D9D9;
  border-radius: 15px 15px 15px 15px;
  margin:auto;
  text-align: center;
  color:white;
  background:#283b66;
  padding: 0px 0px 10px 0px;
}

/*Change navbar color to blue*/
.navbar-inverse .navbar-inner {
    background-image: linear-gradient(to bottom, #283b66, #283b66);
    border-color: #283b66;
    background-color: #283b66;
}
 

#For pop-up
#blanket {
background-color:#111;
opacity: 0.65;
filter:alpha(opacity=65);
position:absolute;
z-index: 9001;
top:0px;
left:0px;
width:100%;
}
#popUpDiv {
position:absolute;
background-color:#eeeeee;
width:300px;
height:300px;
z-index: 9002;
}
.breadcrumb a span{
    color: #006394!important;
}
.breadcrumb a:hover {
    color: #006394!important;
}

.breadcrumb a{
 display: contents; 
      font-size: 14px;
}
#loggedin .maincontent, #notloggedin .maincontent{
margin-left: 0%!important;  
}
/*.maincontent{
margin-left: 3%!important;  
}*/
#opaccredits{
  padding-top: 3%;
    padding-bottom: 3%;
}
/* KML opac css */
.example{
  display:none;
}
#nav{
  display:none;
}
#onr_links > a{
    display: block;
    background: #7eb4e2;
    border-radius: 6px;
    padding: 15px;
    color: #fff;
    cursor: pointer;
    margin-bottom: 20px;
    font-size: 15px;
  font-weight:bold;
    text-transform: uppercase;
}
/*#onr_links > a:nth-child(even){
    display: block;
    color: #89060b;
    font-size: 14px;
    text-transform: uppercase;
    border-radius: 6px;
    margin-bottom: 20px;
    padding: 15px;
    background: #FDF8E4;
    position: relative;
}*/

#onr_links{
    display: block;
    float: left;
    width: 100%;
    margin: 20px 2%;
    background: #f9dd94;
    padding: 20px;
    border-radius: 3px;
}
#onr_links .article__arrow {
    position: absolute;
    top: 16px;
    left: 85%;
    width: 0;
    height: 0;
    border-left: 6px solid transparent;
    border-right: 6px solid transparent;
    border-top: 6px solid #fff;
}
#user_summary{
  display:none;
}
.title{
      font-family: 'Oswald', sans-serif;
    /* border-bottom: solid 3px #b3633e; */
    background: #7eb4e2;
    font-size: 22px;
    text-transform: uppercase;
    color: #fff;
    margin-top: 0;
    padding: 7px 10px;
    margin-bottom: 5px;
}
.team-margin{
    margin-left: 10px !important;
    margin-right: 10px !important;
}
.footer{
    background:#2b2e4a;
    padding: 10px 0;
    color: #fff;
    text-align: center !important;
    border-top: solid 1px #510100;
}
.topFooter{
    background: #fff;
    padding-top: 50px;
    padding-bottom: 50px;
}
.table-container
{
      height: 1000px;
    overflow: auto;
}
#cust-search-format{
      /*background: #2b2e4a;*/
  /*background:#2d325cdb;*/
  /*background:transparent*/;
    max-width: 800px;
    margin: 0 auto;
    padding: 20px;
  background:rgb(0,0,0,0.2);
}
#cust-search-header{
      text-align: center;
    text-transform: uppercase;
    font-weight: bold;
    padding-bottom: 14px;
    font-family: "Verdana", sans-serif;
    letter-spacing: 0.3rem;
    font-size: 20px;
    color: #fff;
}
#cust-moresearches
{
      color: #fff;
    margin: 0 auto;
    padding-top: 10px;
}
#cust-moresearches li a{
      display: inline-block;
    padding-right: 5px;
    white-space: nowrap;
    text-transform: uppercase;
    font-family: "Merriweather Sans",sans-serif;
    font-size: 14px;
    font-weight: bold;
    color: black;
    letter-spacing: 0.3rem;
}
.mastheadsearch{
    background: transparent !important;
  z-index : 2;
}

#opac-main
{    
    /*background-image:url("https://static.toiimg.com/photo/msid-88834592/88834592.jpg");*/
  background-image:url("http://122.184.84.190:1011/opac-tmpl/KML/KCL background.jpg");
    height: 100%;
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
  position:relative;
}
#opac-main::before {
  content: "";
  /*position: absolute;*/
  top: 0;
  left: 0;
  width: 100%;
  height: 82%;
  background-color: rgba(0, 0, 0, 0.2); /* Adjust the shade color and opacity here */
  z-index: 1;
}
.nav-item a:hover{
  color:white!important;
}
.nav-item a{
      color: black!important;
    font-weight: bolder!important;
}
@media screen and (max-width: 768px) {
  /* Modify the properties for screens with a maximum width of 768px */
  #opac-main::before {
    height: 50%; /* Adjust the height for smaller screens */
  }
}

@media screen and (max-width: 480px) {
  /* Modify the properties for screens with a maximum width of 480px */
  #opac-main::before {
    height: 25%; /* Adjust the height for even smaller screens */
  }
}
.main{
  background-color : transparent!important;
  border : none !important;
}
table,td{
  background-color : transparent !important;
}
.breadcrumb
{
  display:none;
}
  
    
  
  
 </style>
    <!-- prettier-ignore-end -->





<script>
    var Koha = {};
    function _(s) { return s } // dummy function for gettext
    const is_logged_in = false
</script>

<script src="/opac-tmpl/bootstrap/js/Gettext_25.0502000.js"></script>
<script src="/opac-tmpl/bootstrap/js/i18n_25.0502000.js"></script>

<link rel="stylesheet" href="/opac-tmpl/lib/fontawesome/css/fontawesome.min_25.0502000.css" type="text/css">
<link type="text/css" href="/opac-tmpl/lib/fontawesome/css/brands.min_25.0502000.css" rel="stylesheet">
<link type="text/css" href="/opac-tmpl/lib/fontawesome/css/solid.min_25.0502000.css" rel="stylesheet">































































































</head>




    





    

<body ID="opac-main" class="branch-default" >


































































































































<button id="scrolltocontent">Skip to main content</button>
<!-- prettier-ignore-start -->
<!-- closed in opac-bottom.inc -->
<div id="wrapper">
<!-- prettier-ignore-end -->
<header id="header-region" class="noprint">
    <nav class="navbar navbar-expand">
        <div id="logo">
            <a class="navbar-brand" href="/cgi-bin/koha/opac-main.pl">
                
                    Koha online
                
            </a>
        </div>
        
            
                <div id="cartDetails" class="cart-message">Your cart is empty.</div>
            
            <ul id="cart-list-nav" class="navbar-nav">
                
                    <li class="nav-item js-show">
                        <a href="#" class="nav-link" title="Collect items you are interested in" id="cartmenulink" role="button" aria-label="Cart">
                            <i id="carticon" class="fa fa-shopping-cart fa-fw fa-icon-black" aria-hidden="true"></i> <span class="cartlabel">Cart</span> <span id="basketcount"></span>
                        </a>
                    </li>
                
                <li class="divider-vertical"></li>
                
                    
                        <li class="nav-item dropdown">
                            <a
                                href="/cgi-bin/koha/opac-shelves.pl"
                                title="Show lists"
                                class="nav-link dropdown-toggle"
                                id="listsmenu"
                                data-bs-toggle="dropdown"
                                role="button"
                                aria-label="Show dropdown with detailed list information"
                                aria-haspopup="true"
                                aria-expanded="false"
                                ><i class="fa fa-list fa-fw fa-icon-black" aria-hidden="true"></i> <span class="listslabel">Lists</span>
                            </a>
                            <div aria-labelledby="listsmenu" role="menu" class="dropdown-menu">
                                
                                
                                
                                    <a class="dropdown-item" href="/cgi-bin/koha/opac-shelves.pl?op=list&amp;public=0" tabindex="0" role="menuitem"><strong>Your lists</strong></a>
                                    
                                        <a class="dropdown-item" href="/cgi-bin/koha/opac-shelves.pl?op=add_form" tabindex="0" role="menuitem">Log in to create your own lists</a>
                                    
                                
                            </div>
                            <!-- / .dropdown-menu -->
                        </li>
                        <!-- / .nav-item.dropdown -->
                    
                
                
            </ul>
            <!-- / .navbar-nav -->
        
        
            
            
            <ul id="members" class="navbar-nav">
                <li class="nav-item dropdown dropdown-menu-end">
                    
                        
                            
                                <a href="/cgi-bin/koha/opac-user.pl" class="nav-link login-link loginModal-trigger" aria-label="Log in to your account"
                                    ><i class="fa fa-user fa-fw fa-icon-black fa-fw" aria-hidden="true"></i> <span class="userlabel">Log in to your account</span></a
                                >
                            
                        
                    

                    
                </li>
                <!-- Cookie consent button for non logged-in users -->
                
                    <li style="display:none" id="cookieConsentDivider" class="divider-vertical" aria-hidden="true"></li>
                    <li style="display:none" id="cookieConsentLi" class="nav-item" aria-hidden="true">
                        <a id="cookieConsentButton" href="#" name="Your cookies" class="nav-link" title="View and amend cookies you have consented to" role="button">
                            <i class="fa fa-cookie-bite fa-fw fa-icon-black" aria-hidden="true"></i>
                            <span class="cookieconsentlabel">Your cookies</span>
                        </a>
                    </li>
                
                
                    
                        <li class="divider-vertical"></li>
                        <li class="nav-item search_history">
                            <a class="nav-link" href="/cgi-bin/koha/opac-search-history.pl" title="View your search history">
                                <i class="fa fa-calendar-days fa-fw fa-icon-black" aria-hidden="true"></i>
                                <span class="search_history_label">Search history</span>
                            </a>
                        </li>
                    
                
            </ul>
        
    </nav>
    <!-- /navbar -->

    
        <div class="container-fluid">
            <div class="row">
                <div class="col"> 
    
        <div id="opacheader">
            
                <div class="en_item">
                    
                    <div class="en_body"><img src="http://122.184.84.190:1011/opac-tmpl/KML/KCL banner 7.jpg" width="100%" height="200" /> <!--<img src="http://122.184.84.190:1011/opac-tmpl/KML/KCL banner 17.webp" width="100%" height="200" />--></div>
                </div>
            
        </div>
    
 </div>
            </div>
        </div>
    
</header>
<!-- / header-region -->


    <div class="container-fluid">
        
            <div class="row">
                <div class="col">
                    <div id="opac-main-search" class="mastheadsearch">
                        
                            
    
        <div id="OpacCustomSearch">
            
                <div class="en_item">
                    
                    <div class="en_body"><div class="container-fluid">
<div class="row">
<div class="col">
<div id="opac-main-search" class="mastheadsearch">
<div id="OpacCustomSearch" style="margin-top: 65px;">
<div class="default_item">
<div class="default_body">
<div id="mainpage" style="display: block;">
<div id="cust-search-format">
<div id="cust-search-header">Search the Library Catalogue</div>
<form method="get" action="/cgi-bin/koha/opac-search.pl">
<div class="form-row align-items-center">
<div class="col-sm-auto order-1 order-sm-1 mt-1"><select name="idx" id="masthead_search" class="form-control">
<option value="">Library catalog</option>
<option value="ti">Title</option>
<option value="au">Author</option>
<option value="su">Subject</option>
<option value="nb">ISBN</option>
<option value="ns">ISSN</option>
<option value="se">Series</option>
<option value="callnum">Call number</option>
<option value="bc">Accession No.</option>
</select></div>
<!-- /.col-sm-auto -->
<div class="col order-2 order-sm-2 mt-1"><input type="text" title="Type search term" class="transl1 form-control" id="translControl1" name="q" /> <span id="translControl"></span></div>
<!-- /.col -->
<div class="order-3 col-sm-auto mt-1"><button type="submit" id="searchsubmit" class="btn btn-primary">Go</button></div>
</div>
<!-- /.form-row --> <input type="hidden" name="weight_search" value="1" /></form>
<div class="row">
<ul class="nav" id="cust-moresearches">
<li class="nav-item"><a href="/cgi-bin/koha/opac-search.pl" style="color: #fff !important;">Advanced search</a></li>
<!-- 
                    
                    
                        <li class="nav-item">
                            <a href="/cgi-bin/koha/opac-authorities-home.pl">&nbsp;&nbsp;Authority search</a>
                        </li>                    
                    --></ul>
<!-- /.nav#moresearches --></div>
</div>
<!-- Switcheroo --></div>
<div id="otherpages" style="display: none;">
<div id="opac-main-search" class="mastheadsearch"><form method="get" action="/cgi-bin/koha/opac-search.pl">
<div class="form-row align-items-center">
<div class="col-sm-auto order-1 order-sm-1"><label for="masthead_search"> Search</label></div>
<div class="col-sm-auto order-2 order-sm-2"><select name="idx" id="masthead_search" class="form-control">
<option value="">Library catalog</option>
<option value="ti">Title</option>
<option value="au">Author</option>
<option value="su">Subject</option>
<option value="nb">ISBN</option>
<option value="ns">ISSN</option>
<option value="se">Series</option>
<option value="callnum">Call number</option>
</select></div>
<!-- /.col-sm-auto -->
<div class="col order-4 order-sm-3"><input type="text" title="Type search term" class="transl1 form-control" id="translControl1" name="q" /><span id="translControl"></span></div>
<!-- /.col -->
<div class="order-5 col-sm-auto"><button type="submit" id="searchsubmit" class="btn btn-primary">Go</button></div>
</div>
<!-- /.form-row --> <input type="hidden" name="weight_search" value="1" /></form></div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div></div>
                </div>
            
        </div>
    

                         </div
                    ><!-- /#opac-main-search -->
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        

        <div class="row">
            <ul class="nav" id="moresearches">
                <li class="nav-item">
                    <a href="/cgi-bin/koha/opac-search.pl">Advanced search</a>
                </li>
                
                
                
                
                
                    <li class="nav-item">
                        <a href="/cgi-bin/koha/opac-tags.pl">Tag cloud</a>
                    </li>
                
                
                
                
                
                
                    <li class="nav-item">
                        <a id="library_page" href="/cgi-bin/koha/opac-library.pl">
                            
                                <span>Contact</span>
                            
                        </a>
                    </li>
                
                
    

            </ul>
            <!-- /.nav#moresearches -->
        </div>
        <!-- /.row -->
    </div>
    <!-- /.container-fluid -->



    <!-- Login form hidden by default, used for modal window -->
    <div id="loginModal" class="modal" tabindex="-1" role="dialog" aria-labelledby="modalLoginLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title" id="modalLoginLabel">Log in to your account</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="/cgi-bin/koha/opac-user.pl" method="post" name="auth" id="modalAuth">
                    <input type="hidden" name="csrf_token" value="9e92a050a1549e1ebe8cee852b43b198bfa31079,39184d7bb9e63916254a920ad0856591b0ec9713,1794130591" />

                    <input type="hidden" name="has-search-query" id="has-search-query" value="" />
                    <div class="modal-body">
                        
                        
                        
                            
                            
                            <input type="hidden" name="koha_login_context" value="opac" />
                            <fieldset class="brief">
                                <div class="local-login">
                                    
    <label for="muserid">Card number or username:</label>
<input type="text" id="muserid" name="login_userid" autocomplete="off" /> <label for="mpassword">Password:</label
                                    ><input type="password" id="mpassword" name="login_password" autocomplete="off" />
                                    <fieldset class="action">
                                        <input type="hidden" name="op" value="cud-login" />
                                        <input type="submit" class="btn btn-primary" value="Log in" />
                                    </fieldset>
                                </div>
                                
                                
                                
                            </fieldset>
                        
                    </div>
                </form>
                <!-- /#auth -->
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /#modalAuth  -->





<main class="main">
    
    <nav id="breadcrumbs" aria-label="Breadcrumb" class="breadcrumbs">
        <ol class="breadcrumb">
            
            
                
    
        <li class="breadcrumb-item active">
            <a href="#" aria-current="page"> 
                    <span>Home</span>
                 </a>
        </li>
    

            
        </ol>
    </nav>


    
    
    <div id="notloggedin" class="container-fluid">
        <div class="row">
            
                <div class="col-12 col-lg-2 order-3 order-lg-1">
                    <div id="navigation"> 


    
    
        <div id="OpacNav">
            
                <div class="en_item">
                    
                    <div class="en_body"><div id="navigation">
<div id="opacnav">
<style>
.buttonside {
    background-color: #09c; /* Green */
    border: none;
    color: white;
    padding: 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    margin: 8px 2px;
    cursor: pointer;
}

.buttonside1 {
border-radius: 12px;
    text-decoration: none;
}

a.buttonside1 {
   
    text-decoration: none;
    color: white;
}

.buttonside1 {
background-color: #008CBA;
    color: white;
   
}

.buttonside1:hover {
    
     background-color: #004c8c; 
    color: white; 
}
#OpacNavLeft {
        border-collapse: collapse;
    width: 100%;
}

#OpacNavLeft td, #OpacNavLeft th {
    border: 1px solid #ddd;
    padding: 8px;
}
/*#OpacNavLeft tr:nth-child(even){background-color: #f2f2f2;}*/
#OpacNavLeft tr:nth-child(even){background-color: transparent;}
#OpacNavLeft tr:hover {background-color: #ddd;}

#OpacNavLeft th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: left;
   /* background-color: #d34205;*/
    background-color:#2d325cdb;
    color: white;
}
</style>
<table id="OpacNavLeft">
<tbody>
<tr>
<th><strong>Contact Us</strong></th>
</tr>
<tr>
<td>Chief Librarian and Information Officer, Kalaignar Centenary Library, Reserve Line, <br />Madurai, <br />Tamil Nadu &ndash; 625002.</td>
</tr>
<tr>
<td>E-mail: <br />Kclmdu@gmail.com</td>
</tr>
<tr>
<td>Phone:<br />0452-2535400</td>
</tr>
</tbody>
</table>
</div>
</div></div>
                </div>
            
        </div>
    






 </div>
                </div>
            

            
            
                
                
            
            <div class="col-12 col-lg-7 order-md-1 maincontent">
                <h1 class="sr-only">Koha home</h1>

                

                
                    
                
                
                    <!-- koha news -->
                    
                

                
                    

                    
                        
    
        <div id="OpacMainUserBlock">
            
                <div class="default_item">
                    
                    <div class="default_body"><br /><!--<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding: 0px; color: #444444; font-family: 'PT Sans', Arial, sans-serif; text-align: center;"><big style="vertical-align: baseline; outline: none; font-size: 15.6px; background: transparent; border: none; margin: 0px; padding: 0px;"> <big style="vertical-align: baseline; outline: none; font-size: 18.72px; background: transparent; border: none; margin: 0px; padding: 0px;"><span style="vertical-align: baseline; outline: none; font-size: 18.72px; background: transparent; border: none; margin: 0px; padding: 0px; color: #ff0000;">Attention Readers !</span></big></big></div>
<marquee><span style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding: 0px; font-family: 'PT Sans', Arial, sans-serif;"> <a href="http://www.annacentenarylibrary.org/p/book-suggestion.html"><span style="color: #2e40c1;"><b>வாசகர்கள் தாங்கள் பரிந்துரைக்க விரும்பும் நூல்களை அந்தந்த தளங்களிலுள்ள புத்தக பரிந்துரைப் பதிவேடு அல்லது இந்த Link ஐ Click செய்து தெரிவிக்கலாம். | Readers may suggest books in the book suggestion registers kept at the floors or through online via clicking this link.</b></span></a></span></marquee><hr />
<div style="background-color: #ffffb3; padding: 10px; border: 1px solid green;" align="center">
<div align="center" style="font-weight: normal;">
<div align="center" style="font-weight: normal; vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; color: #444444; font-family: 'PT Sans', Arial, sans-serif; text-align: center;"><span style="vertical-align: baseline; outline: none; font-size: 16.72px; background: transparent; border: none; margin: 0px; padding: 0px; color: #ff0000;"><span style="vertical-align: baseline; outline: none; font-size: 16.72px; background: transparent; border: none; margin: 0px; padding: 0px; color: #ff0000;"><span style="text-decoration: underline;"><span style="font-size: 10pt;"><span style="font-size: 12pt;"> </span><strong>தினம் ஒரு திருக்குறள் / Thirukkural for the day</strong></span></span></span></span>
<div align="center" style="color: #444444; font-family: 'PT Sans', Arial, sans-serif; font-weight: normal; vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;"><span style="font-size: 12pt;"><span style="font-size: 12pt;"><strong> </strong></span></span>
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">&nbsp;<span style="background-color: transparent;">கொலைமேற்கொண்டாரிற் கொடிதே அலைமேற்கொண்டு</span></div>
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">அல்லவை செய்தொழுகும் வேந்து.&nbsp;</div>
</div>
</div>
</div>
</div>
<span style="color: #3598db;"><strong><span style="background-color: transparent; font-family: Arial, Helvetica, sans-serif;"><span style="font-family: 'PT Sans', Arial, sans-serif; font-size: 13.3333px;"><span style="font-size: 13.3333px;"><span><span style="font-size: 13.3333px;">(பொருட்பால் -</span></span></span></span></span><span style="text-decoration: underline;"><span style="background-color: transparent; font-size: 10pt;">கொடுங்கோன்மை</span></span><span style="background-color: transparent;"><span style="background-color: transparent; font-family: Arial, Helvetica, sans-serif;"><span style="font-family: 'PT Sans', Arial, sans-serif; font-size: 13.3333px;"><span style="font-size: 13.3333px;"><span><span style="font-size: 13.3333px;"><span style="background-color: transparent;">&nbsp;</span></span></span></span></span></span><span style="background-color: transparent; font-family: Arial, Helvetica, sans-serif;"><span style="font-family: 'PT Sans', Arial, sans-serif; font-size: 13.3333px;"><span style="font-size: 13.3333px;"><span><span style="font-size: 13.3333px;"><span style="font-size: 13.3333px;"><u> - குறள் எண்.</u></span></span></span></span></span></span></span></strong><strong style="background-color: transparent;"><span style="background-color: transparent; font-family: Arial, Helvetica, sans-serif;"><span style="font-family: 'PT Sans', Arial, sans-serif; font-size: 13.3333px;"><span style="font-size: 13.3333px;"><span><span style="font-size: 13.3333px;"><span style="font-size: 13.3333px;"><u>551)</u></span></span></span></span></span></span></strong></span></div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;"><span style="color: #444444; font-family: PT Sans, Arial, sans-serif;">அறவழி மீறிக் குடிமக்களைத் துன்புறுத்தும் அரசு, கொலையைத் தொழிலாகக் கொண்டவரைவிடக் கொடியதாகும்</span></div>
</div>
</div>
</div>
</div>
</div>
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;"><strong><span style="background-color: transparent;"><span style="font-size: 10pt;"><span style="color: #3598db; text-decoration-line: underline;"><span style="font-size: 10pt;">மு.</span></span></span></span><span style="text-decoration-line: underline; background-color: transparent;"><span style="background-color: transparent;"><span style="font-size: 10pt;"><span style="color: #3598db;"><span style="font-size: 10pt;"> கருணாநிதி உரை.</span></span></span></span></span></strong></div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">
<div style="color: #444444; font-family: 'PT Sans', Arial, sans-serif; font-weight: normal;">
<div style="color: #444444; font-family: 'PT Sans', Arial, sans-serif; font-weight: normal;">
<div style="color: #444444; font-family: 'PT Sans', Arial, sans-serif; font-weight: normal;">
<div style="color: #444444; font-family: 'PT Sans', Arial, sans-serif; font-weight: normal;">
<div style="color: #444444; font-family: 'PT Sans', Arial, sans-serif; font-weight: normal;">
<div style="color: #444444; font-family: 'PT Sans', Arial, sans-serif; font-weight: normal;">
<div>
<div><span style="color: #444444; font-family: PT Sans, Arial, sans-serif;">More malicious than a murderer is the king Who rules with injustice and oppression.</span></div>
</div>
<div style="color: #444444; font-family: 'PT Sans', Arial, sans-serif; font-weight: normal;"></div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>--></div>
                </div>
            
                <div class="default_item">
                    
                    <div class="default_body"><!-- Debut du carrousel --><!-- Carrousel 4.1.2 -->
<div id="inlibro-carrousel">
<div class="carrouselFrame">
<p class="special-title">New Arrivals</p>
<div class="loadingDiv"></div>
<div id="carrousel-0" class="carrousel"><a class="left carousel-control" aria-label="previous" tabindex="0">&lsaquo;</a> <a class="right carousel-control" aria-label="next" tabindex="0">&rsaquo;</a> <a href="/cgi-bin/koha/opac-detail.pl?biblionumber=38317" title="Environment Agriculture and Poverty (In 3 Volumes) VOL.I"><img class="cloudcarousel" src="https://books.google.com/books/content?id=twEWUKEKMekC&amp;printsec=frontcover&amp;img=1&amp;zoom=1&amp;edge=curl&amp;source=gbs_api" alt="Environment Agriculture and Poverty (In 3 Volumes) VOL.I" /></a> <a href="/cgi-bin/koha/opac-detail.pl?biblionumber=38318" title="Environment Agriculture and Poverty (In 3 Volumes) VOL.II"><img class="cloudcarousel" src="https://books.google.com/books/content?id=twEWUKEKMekC&amp;printsec=frontcover&amp;img=1&amp;zoom=1&amp;edge=curl&amp;source=gbs_api" alt="Environment Agriculture and Poverty (In 3 Volumes) VOL.II" /></a> <a href="/cgi-bin/koha/opac-detail.pl?biblionumber=38319" title="Environment Agriculture and Poverty (In 3 Volumes) VOL.III"><img class="cloudcarousel" src="https://books.google.com/books/content?id=twEWUKEKMekC&amp;printsec=frontcover&amp;img=1&amp;zoom=1&amp;edge=curl&amp;source=gbs_api" alt="Environment Agriculture and Poverty (In 3 Volumes) VOL.III" /></a> <a href="/cgi-bin/koha/opac-detail.pl?biblionumber=38320" title="Horticulture for Sustainable Income and Environmental Protection (In 2 Volumes) Vol.I"><img class="cloudcarousel" src="https://covers.openlibrary.org/b/isbn/8180692205-M.jpg?default=false" alt="Horticulture for Sustainable Income and Environmental Protection (In 2 Volumes) Vol.I" /></a> <a href="/cgi-bin/koha/opac-detail.pl?biblionumber=38321" title="Horticulture for Sustainable Income and Environmental Protection (In 2 Volumes) Vol.II"><img class="cloudcarousel" src="https://covers.openlibrary.org/b/isbn/8180692205-M.jpg?default=false" alt="Horticulture for Sustainable Income and Environmental Protection (In 2 Volumes) Vol.II" /></a> <a href="/cgi-bin/koha/opac-detail.pl?biblionumber=38323" title="New Dimensions in Agricultural Geography - 8 vols set (VOL.I)"><img class="cloudcarousel" src="https://books.google.com/books/content?id=XiPbAAAAMAAJ&amp;printsec=frontcover&amp;img=1&amp;zoom=1&amp;source=gbs_api" alt="New Dimensions in Agricultural Geography - 8 vols set (VOL.I)" /></a> <a href="/cgi-bin/koha/opac-detail.pl?biblionumber=38324" title="New Dimensions in Agricultural Geography - 8 vols set (VOL.II)"><img class="cloudcarousel" src="https://books.google.com/books/content?id=XiPbAAAAMAAJ&amp;printsec=frontcover&amp;img=1&amp;zoom=1&amp;source=gbs_api" alt="New Dimensions in Agricultural Geography - 8 vols set (VOL.II)" /></a> <a href="/cgi-bin/koha/opac-detail.pl?biblionumber=38325" title="New Dimensions in Agricultural Geography - 8 vols set (VOL.III)"><img class="cloudcarousel" src="https://books.google.com/books/content?id=XiPbAAAAMAAJ&amp;printsec=frontcover&amp;img=1&amp;zoom=1&amp;source=gbs_api" alt="New Dimensions in Agricultural Geography - 8 vols set (VOL.III)" /></a> <a href="/cgi-bin/koha/opac-detail.pl?biblionumber=38326" title="New Dimensions in Agricultural Geography - 8 vols set (VOL.IV)"><img class="cloudcarousel" src="https://books.google.com/books/content?id=XiPbAAAAMAAJ&amp;printsec=frontcover&amp;img=1&amp;zoom=1&amp;source=gbs_api" alt="New Dimensions in Agricultural Geography - 8 vols set (VOL.IV)" /></a> <a href="/cgi-bin/koha/opac-detail.pl?biblionumber=38327" title="New Dimensions in Agricultural Geography - 8 vols set (VOL.V)"><img class="cloudcarousel" src="https://books.google.com/books/content?id=XiPbAAAAMAAJ&amp;printsec=frontcover&amp;img=1&amp;zoom=1&amp;source=gbs_api" alt="New Dimensions in Agricultural Geography - 8 vols set (VOL.V)" /></a> <a href="/cgi-bin/koha/opac-detail.pl?biblionumber=38328" title="New Dimensions in Agricultural Geography - 8 vols set (VOL.VI)"><img class="cloudcarousel" src="https://books.google.com/books/content?id=XiPbAAAAMAAJ&amp;printsec=frontcover&amp;img=1&amp;zoom=1&amp;source=gbs_api" alt="New Dimensions in Agricultural Geography - 8 vols set (VOL.VI)" /></a> <a href="/cgi-bin/koha/opac-detail.pl?biblionumber=38329" title="New Dimensions in Agricultural Geography - 8 vols set (VOL.VII)"><img class="cloudcarousel" src="https://books.google.com/books/content?id=XiPbAAAAMAAJ&amp;printsec=frontcover&amp;img=1&amp;zoom=1&amp;source=gbs_api" alt="New Dimensions in Agricultural Geography - 8 vols set (VOL.VII)" /></a> <a href="/cgi-bin/koha/opac-detail.pl?biblionumber=38330" title="New Dimensions in Agricultural Geography - 8 vols set (VOL.VIII)"><img class="cloudcarousel" src="https://books.google.com/books/content?id=XiPbAAAAMAAJ&amp;printsec=frontcover&amp;img=1&amp;zoom=1&amp;source=gbs_api" alt="New Dimensions in Agricultural Geography - 8 vols set (VOL.VIII)" /></a> <a href="/cgi-bin/koha/opac-detail.pl?biblionumber=38339" title="A Comprehensice Survey of International Soybean Research-Genetics, Physiology, Agronomy and Nitrogen Relationships"><img class="cloudcarousel" src="https://images-na.ssl-images-amazon.com/images/P/953510876X.01.MZZZZZZZ.jpg" alt="A Comprehensice Survey of International Soybean Research-Genetics, Physiology, Agronomy and Nitrogen Relationships" /></a> <a href="/cgi-bin/koha/opac-detail.pl?biblionumber=38340" title="Abiotic and Biotic Stress In Plants Recent Advances and Future Perspectives"><img class="cloudcarousel" src="https://images-na.ssl-images-amazon.com/images/P/9535122509.01.MZZZZZZZ.jpg" alt="Abiotic and Biotic Stress In Plants Recent Advances and Future Perspectives" /></a> <a href="/cgi-bin/koha/opac-detail.pl?biblionumber=38341" title="Abiotic Stress In Plants, Vol. 1"><img class="cloudcarousel" src="https://images-na.ssl-images-amazon.com/images/P/9535113518.01.MZZZZZZZ.jpg" alt="Abiotic Stress In Plants, Vol. 1" /></a> <a href="/cgi-bin/koha/opac-detail.pl?biblionumber=38342" title="Abiotic Stress In Plants, Vol. 2"><img class="cloudcarousel" src="https://images-na.ssl-images-amazon.com/images/P/9535113526.01.MZZZZZZZ.jpg" alt="Abiotic Stress In Plants, Vol. 2" /></a> <a href="/cgi-bin/koha/opac-detail.pl?biblionumber=38343" title="Abiotic Stress In Plants: Mechanisms and Adaptations"><img class="cloudcarousel" src="https://images-na.ssl-images-amazon.com/images/P/9533073942.01.MZZZZZZZ.jpg" alt="Abiotic Stress In Plants: Mechanisms and Adaptations" /></a>
<div class="carousel-caption">
<p class="title-text"></p>
</div>
</div>
</div>
</div>
<style>


    


#inlibro-carrousel .carrouselFrame {
    background: #DDDDDD;
    border-radius: 8px;
    margin: 1em 0;
    overflow: hidden;
    padding: 1em 0;
    position: relative;
}

#inlibro-carrousel .carrousel{
    height : 300px;
}

#inlibro-carrousel .loadingDiv{
    background : white;
    position : absolute;
    height : 100%;
    width : 100%;
    z-index : 2000;
    top : 0;

}

 /*De bootstrap pour le carrousel*/
  
.carousel {
    position: relative;
    margin-bottom: 20px;
    line-height: 1;
}

.carousel-inner {
    overflow: hidden;
    width: 100%;
    position: relative;
}

.carousel-inner>.item {
    display: none;
    position: relative;
    -webkit-transition: 0.6s ease-in-out left;
    -moz-transition: 0.6s ease-in-out left;
    -o-transition: 0.6s ease-in-out left;
    transition: 0.6s ease-in-out left;
}

.carousel-inner>.item>img, .carousel-inner>.item>a>img {
    display: block;
    line-height: 1;
}

.carousel-inner>.active, .carousel-inner>.next, .carousel-inner>.prev {
    display: block;
}

.carousel-inner>.active {
    left: 0;
}

.carousel-inner>.next, .carousel-inner>.prev {
    position: absolute;
    top: 0;
    width: 100%;
}

.carousel-inner>.next {
    left: 100%;
}

.carousel-inner>.prev {
    left: -100%;
}

.carousel-inner>.next.left, .carousel-inner>.prev.right {
    left: 0;
}

.carousel-inner>.active.left {
    left: -100%;
}

.carousel-inner>.active.right {
    left: 100%;
}

.carousel-control {
    position: absolute;
    top: 40%;
    left: 15px;
    width: 40px;
    height: 40px;
    margin-top: -20px;
    font-size: 60px;
    font-weight: 100;
    line-height: 28px;
    color: #000000;
    text-align: center;
    background: #222222;
    border: 2px solid #000000;
    -webkit-border-radius: 23px;
    -moz-border-radius: 23px;
    border-radius: 23px;
    padding-right: 5px;
    /*opacity: 0.5;*/
    filter: alpha(opacity=50);
    
}

.carousel-control.right {
    left: auto;
    right: 15px;
    padding-left: 7px;
}

.carousel-control:hover, .carousel-control:focus {
    color: #ffffff;
    text-decoration: none;
    opacity: 0.9;
    filter: alpha(opacity=90);
}

.carousel-indicators {
    position: absolute;
    top: 15px;
    right: 15px;
    z-index: 5;
    margin: 0;
    list-style: none;
}

.carousel-indicators li {
    display: block;
    float: left;
    width: 10px;
    height: 10px;
    margin-left: 5px;
    text-indent: -999px;
    background-color: #ccc;
    background-color: rgba(255, 255, 255, 0.25);
    border-radius: 5px;
}

.carousel-indicators .active {
    background-color: #fff;
}

.carousel-caption {
    position: absolute;
    left: 0;
    right: 0;
    bottom: 0;
    padding: 15px;
    background: #333333;
    background: rgba(0, 0, 0, 0.75);
}

.carousel-caption h4, .carousel-caption p {
    color: #ffffff;
    line-height: 20px;
}

.carousel-caption h4 {
    margin: 0 0 5px;
}

.carousel-caption p {
    margin-bottom: 0;
}
  
    /*De bootstrap pour le carrousel FIN*/


#inlibro-carrousel .carousel-caption .title-text{
    color : #000000;
}

#inlibro-carrousel .carousel-control,
#inlibro-carrousel .carousel-caption{
    background-color : #373737;
    z-index:1000;
    cursor : pointer;
}

#inlibro-carrousel .carousel-caption{
    font-weight : bold;
    position: absolute;
    left: 0;
    right: 0;
}

#inlibro-carrousel .carousel-control,
#inlibro-carrousel .carousel-caption{
    background-color : #373737;
    z-index:1000;
}

#inlibro-carrousel .carousel-caption{
    font-weight : bold;
}

#inlibro-carrousel a.locked{
    width:100px;
}

#inlibro-carrousel .slider {
    overflow: hidden;
}

#inlibro-carrousel .slider img {
    height: 175px;
}

#inlibro-carrousel .slider hr + div {
    background-color: #d5e1df;
}

#inlibro-carrousel .special-title{ 
    text-align: center;
    margin: 0;
    margin-top: 10px;
    margin-bottom: 35px;
    font-weight: bold;
    font-style: italic;
    font-size: 25px;
    color:black;
}

#inlibro-carrousel hr{
    margin: -5px 0px 15px 0px;
}

#inlibro-carrousel h2 {
    color: black;
}

#inlibro-carrousel .images {
    left: 0px;
    position: relative;
    white-space: nowrap;

}

#inlibro-carrousel .controls{
    margin-bottom: 116px;
    margin-top: 20px;
}

#inlibro-carrousel button{
    color : #000000;
    background-color: #373737;
    border: 0;
    height : 2em;
    font-size: 120%;
    border-radius : 3px;
}

#inlibro-carrousel .images a {
    display: inline-block;
    margin-right: 3px;
}

div.images>a:focus{
    border: 1px solid #373737;
}

a:focus>img{
    border: 2px solid #373737;
}
</style>
<!-- This is the cloud carousel javascript(cloud-carousel.1.0.0.js) -->
<script>
//////////////////////////////////////////////////////////////////////////////////
// CloudCarousel V1.0.5
// (c) 2011 by R Cecco. <http://www.professorcloud.com>
// MIT License
//
// Reflection code based on plugin by Christophe Beyls <http://www.digitalia.be>
//
// Please retain this copyright header in all versions of the software
//////////////////////////////////////////////////////////////////////////////////
document.addEventListener('DOMContentLoaded', function() {
    (function($){function Reflection(img,reflHeight,opacity){var reflection,cntx,imageWidth=img.width,imageHeight=img.width,gradient,parent;parent=$(img.parentNode);this.element=reflection=parent.append("<canvas class='reflection' style='position:absolute'/>").find(':last')[0];if(!reflection.getContext&&$.support.msie){this.element=reflection=parent.append("<img class='reflection' style='position:absolute'/>").find(':last')[0];reflection.src=img.src;reflection.style.filter="flipv progid:DXImageTransform.Microsoft.Alpha(opacity="+(opacity*100)+", style=1, finishOpacity=0, startx=0, starty=0, finishx=0, finishy="+(reflHeight/imageHeight*100)+")"}else{cntx=reflection.getContext("2d");try{$(reflection).attr({width:imageWidth,height:reflHeight});cntx.save();cntx.translate(0,imageHeight-1);cntx.scale(1,-1);cntx.drawImage(img,0,0,imageWidth,imageHeight);cntx.restore();cntx.globalCompositeOperation="destination-out";gradient=cntx.createLinearGradient(0,0,0,reflHeight);gradient.addColorStop(0,"rgba(255, 255, 255, "+(1-opacity)+")");gradient.addColorStop(1,"rgba(255, 255, 255, 1.0)");cntx.fillStyle=gradient;cntx.fillRect(0,0,imageWidth,reflHeight)}catch(e){return}}$(reflection).attr({'alt':$(img).attr('alt'),title:$(img).attr('title')})}var Item=function(imgIn,options){this.orgWidth=imgIn.width;this.orgHeight=imgIn.height;this.image=imgIn;this.reflection=null;this.alt=imgIn.alt;this.title=imgIn.alt;this.imageOK=false;this.options=options;this.imageOK=true;if(this.options.reflHeight>0){this.reflection=new Reflection(this.image,this.options.reflHeight,this.options.reflOpacity)}$(this.image).css('position','absolute')};var Controller=function(container,images,options){var items=[],funcSin=Math.sin,funcCos=Math.cos,ctx=this;this.controlTimer=0;this.stopped=false;this.container=container;this.xRadius=options.xRadius;this.yRadius=options.yRadius;this.showFrontTextTimer=0;this.autoRotateTimer=0;if(options.xRadius===0){this.xRadius=($(container).width()/2.3)}if(options.yRadius===0){this.yRadius=($(container).height()/6)}this.xCentre=options.xPos;this.yCentre=options.yPos;this.frontIndex=0;this.rotation=this.destRotation=Math.PI/2;this.timeDelay=1000/options.FPS;if(options.altBox!==null){$(options.altBox).css('display','block');$(options.titleBox).css('display','block')}$(container).css({position:'relative',overflow:'hidden'});$(options.buttonLeft).css('display','inline');$(options.buttonRight).css('display','inline');$(options.buttonLeft).bind('mouseup',this,function(event){event.data.rotate(-1);return false});$(options.buttonRight).bind('mouseup',this,function(event){event.data.rotate(1);return false});if(options.mouseWheel){$(container).bind('mousewheel',this,function(event,delta){event.data.rotate(delta);return false})}$(container).bind('mouseover click',this,function(event){clearInterval(event.data.autoRotateTimer);var text=$(event.target).attr('alt');if(text!==undefined&&text!==null){clearTimeout(event.data.showFrontTextTimer);$(options.altBox).html(($(event.target).attr('alt')));$(options.titleBox).html(($(event.target).attr('alt')));if(options.bringToFront&&event.type=='click'){var idx=$(event.target).data('itemIndex');var frontIndex=event.data.frontIndex;var diff=(idx-frontIndex)%images.length;if(Math.abs(diff)>images.length/2){diff+=(diff>0?-images.length:images.length)}event.data.rotate(-diff)}}});$(container).bind('mouseout',this,function(event){var context=event.data;clearTimeout(context.showFrontTextTimer);context.showFrontTextTimer=setTimeout(function(){context.showFrontText()},1000);context.autoRotate()});$(container).bind('mousedown',this,function(event){event.data.container.focus();return false});container.onselectstart=function(){return false};this.innerWrapper=$(container).wrapInner('<div style="position:absolute;width:100%;height:100%;"/>').children()[0];this.showFrontText=function(){if(items[this.frontIndex]===undefined){return}$(options.titleBox).html($(items[this.frontIndex].image).attr('alt'));$(options.altBox).html($(items[this.frontIndex].image).attr('alt'))};this.go=function(){if(this.controlTimer!==0){return}var context=this;this.controlTimer=setTimeout(function(){context.updateAll()},this.timeDelay)};this.stop=function(){clearTimeout(this.controlTimer);this.controlTimer=0};

    this.rotate=function(direction){
        this.frontIndex-=direction;
        while (this.frontIndex<0) { this.frontIndex += items.length; }
        this.frontIndex%=items.length;
        this.destRotation+=(Math.PI/items.length)*(2*direction);
        this.showFrontText();
        this.go()
    };

    this.autoRotate=function(){
        if(options.autoRotate!=='no'){
            var dir=(options.autoRotate==='right')?1:-1;
            this.autoRotateTimer=setInterval(function(){ctx.rotate(dir)},options.autoRotateDelay)}};
            this.updateAll=function(){var minScale=options.minScale;
            var smallRange=(1-minScale)*0.5;
            var w,h,x,y,scale,item,sinVal;
            var change=(this.destRotation-this.rotation);
            var absChange=Math.abs(change);
            this.rotation+=change*options.speed;
            if(absChange<0.001){this.rotation=this.destRotation}
            var itemsLen=items.length;
            var spacing=(Math.PI/itemsLen)*2;
            var radians=this.rotation;
            var isMSIE=$.support.msie;
            this.innerWrapper.style.display='none';
            var style;var px='px',reflHeight;
            var context=this;
            for(var i=0;i<itemsLen;i++){item=items[i];sinVal=funcSin(radians);
            scale=((sinVal+1)*smallRange)+minScale;
            x=this.xCentre+(((funcCos(radians)*this.xRadius)-(item.orgWidth*0.5))*scale);
            y=this.yCentre+(((sinVal*this.yRadius))*scale);
            if(item.imageOK){var img=item.image;
            w=img.width=item.orgWidth*scale;
            h=img.height=item.orgHeight*scale;
            img.style.left=x+px;
            img.style.top=y+px;img.style.zIndex=""+(scale*100)>>0;
            if(item.reflection!==null){reflHeight=options.reflHeight*scale;
            style=item.reflection.element.style;style.left=x+px;
            style.top=y+h+options.reflGap*scale+px;
            style.width=w+px;
            if(isMSIE){style.filter.finishy=(reflHeight/h*100)}else{style.height=reflHeight+px}}}radians+=spacing}this.innerWrapper.style.display='block';if(absChange>=0.001){this.controlTimer=setTimeout(function(){context.updateAll()},this.timeDelay)}else{this.stop()}};this.checkImagesLoaded=function(){var i;for(i=0;i<images.length;i++){if((images[i].width===undefined)||((images[i].complete!==undefined)&&(!images[i].complete))){return}}for(i=0;i<images.length;i++){items.push(new Item(images[i],options));$(images[i]).data('itemIndex',i)}clearInterval(this.tt);this.showFrontText();this.autoRotate();this.updateAll()};this.tt=setInterval(function(){ctx.checkImagesLoaded()},50)};$.fn.CloudCarousel=function(options){this.each(function(){options=$.extend({},{reflHeight:0,reflOpacity:0.5,reflGap:0,minScale:0.5,xPos:0,yPos:0,xRadius:0,yRadius:0,altBox:null,titleBox:null,FPS:30,autoRotate:'no',autoRotateDelay:1500,speed:0.2,mouseWheel:false,bringToFront:false},options);$(this).data('cloudcarousel',new Controller(this,$('.cloudcarousel',$(this)),options))});return this}})(jQuery);

    //This initialises carousels on the container elements specified.
    
        
            $("#carrousel-0").each(function (){
                var controls = $(this).find(".carousel-control");
                $(this).CloudCarousel(
                {
                    
                    xPos : $(this).parent().width() * 0.5,
                    yPos : 10,
                    xRadius : $(this).parent().width() / 2,
                    yRadius : $(this).parent().height() / 7,
                    buttonLeft: $(controls).filter(".left"),
                    buttonRight: $(controls).filter(".right"),
                    titleBox: $(this).find(".title-text"),
                    minScale: 0.25,
                    reflHeight : 40,
                    reflGap : 4,
                    reflOpacity : 0.75
                }
                );
            });
        
    

    $(".loadingDiv").delay(1000);
    $(".loadingDiv").fadeOut(1000);
});
</script>
<script>
var scrolling_duration = 250;
var time_between_scrolling = 5000;


function Left (button){
    let container =  document.getElementById(button.className).getElementsByClassName("images")[0];
    let livres = container.children;

    var last = $(container).find("a img").last();
    if ($(last).position().left + $(last)[0].clientWidth < $(".slider")[0].clientWidth) return;
    $(container).animate({
        left: $(container).find("a img").eq(1).position().left * -1,
    }, scrolling_duration, function() {
        $(container).css("left", "0");
        $(container).append($(container).find("a").first());
    });  
};
function Right (button){
    let container =  document.getElementById(button.className).getElementsByClassName("images")[0];
    let livres = container.children;

    var last = $(container).find("a img").last();
    if ($(last).position().left + $(last)[0].clientWidth < $(".slider")[0].clientWidth) return;
    $(container).animate({
        left: $(container).find("a img").eq(1).position().left,
    }, scrolling_duration, function() {
        $(container).css("left", "0");
        $(container).prepend($(container).find("a").last());
    });
};

/*
window.addEventListener('load', function() {
    function setPosition() {
        $(".images").each(function(i) {
            var last = $(this).find("a img").last();
            if ($(last).position().left + $(last)[0].clientWidth < $("#sliders")[0].clientWidth) return;
            $(this).animate({
                left: $(this).find("a img").eq(1).position().left * -1,
            }, scrolling_duration, function() {
                $(this).css("left", "0");
                $(this).append($(this).find("a").first());
            });
        });
    }
    //setInterval(setPosition, time_between_scrolling);
});
*/
</script>
<!-- Fin du carrousel --></div>
                </div>
            
        </div>
    

                    
                
            </div>
            <!-- / .col 6/8 -->

            
                <div class="col-12 col-lg-3 order-md-2">
                    
                        
                            
                                <div id="login">
                                    <form action="/cgi-bin/koha/opac-user.pl" method="post" name="auth" id="auth" autocomplete="off">
                                        <input type="hidden" name="csrf_token" value="a0010284c698f2ff380b12204161cd60b79880dc,078befafde2a55f7a3cd6eafbaa71969b8d707b6,1794130591" />

                                        <input type="hidden" name="koha_login_context" value="opac" />
                                        <h2 class="sr-only">Login form</h2>
                                        <fieldset class="brief">
                                            <legend>Log in to your account:</legend>
                                            
                                            
                                            
                                            <div class="local-login">
                                                
    <label for="userid">Card number or username:</label>

                                                <input class="form-control" type="text" id="userid" name="login_userid" autocomplete="off" />
                                                <label for="password">Password:</label>
                                                <input class="form-control" type="password" id="password" name="login_password" autocomplete="off" />
                                                <fieldset class="action">
                                                    <input type="hidden" name="op" value="cud-login" />
                                                    <input type="submit" value="Log in" class="btn btn-primary" />
                                                </fieldset>
                                            </div>
                                            
                                            
                                            
                                        </fieldset>
                                    </form>
                                </div>
                                <!-- /#login -->
                            
                        
                    
                    
    
        <div id="OpacNavRight">
            
                <div class="en_item">
                    
                    <div class="en_body"><div id="OpacNavRight">
<div class="OpacNavRight_en_item">
<div class="OpacNavRight_en_body">
<style>
#OpacNavRight {
        border-collapse: collapse;
    width: 100%;
}

#OpacNavRight td, #OpacNavRight th {
    border: 1px solid #ddd;
    padding: 8px;
}

/*#OpacNavRight tr:nth-child(even){background-color: #f2f2f2;}*/
#OpacNavRight tr:nth-child(even){background-color: transparent;}

#OpacNavRight tr:hover {background-color: #ddd;}

#OpacNavRight th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: left;
    /*background-color: #d34205;*/
background-color:#2d325cdb;
    color: white;
}
</style>
<table id="OpacNavRight">
<tbody>
<tr>
<th colspan="2">Library Hours</th>
</tr>
<tr>
<td>Monday to Sunday</td>
<td>8.00 AM to 8.00 PM</td>
</tr>
</tbody>
</table>
</div>
</div>
</div></div>
                </div>
            
        </div>
    

                </div>
                <!-- / .col -->
            
        </div>
        <!-- /.row -->
    </div>
    <!-- /.container-fluid -->
</main>
<!-- /.main -->




































































































    
    
        <div class="container-fluid">
            <div class="row">
                <div class="col"> 
    
        <div id="opaccredits">
            
                <div class="en_item">
                    
                    <div class="en_body"><div class="opaccredits_en_item">
<div class="opaccredits_en_body">
<div class="topFooter">
<div class="container">
<div class="row">
<div class="col-sm-12">
<h2><span>Find us on the map</span></h2>
<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3908.057001772515!2d78.1357215!3d9.941357799999995!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3b00c5d803dbe503%3A0x2f4f6b348038f703!2sMuthamil%20Arignar%20Kalaignar%20Memorial%20Library%20-%20Madurai%20District%2C%20Tamilnadu%2C%20India!5e0!3m2!1sen!2sus!4v1622211034845!5m2!1sen!2sus" style="border: 0;" allowfullscreen="" aria-hidden="false" width="100%" height="280" frameborder="0" tabindex="0"></iframe></div>
</div>
</div>
</div>
<div class="footer">
<div class="container footer_container">
<div class="row">
<div class="col-sm-6 copyright"><strong>Kalaignar Centenary Library</strong><br />Copyright &copy; 2023 . All Rights Reserved.</div>
<div class="col-sm-6 powered" style="color: white !important; margin-top: 10px;">Maintained by <strong><a href="https://2cqr.in/" target="_blank" style="color: white !important;" rel="noopener">2cqr automation private limited, Chennai.</a></strong>.</div>
</div>
</div>
</div>
<!-- Matomo -->
<script>
  var _paq = window._paq = window._paq || [];
  /* tracker methods like "setCustomDimension" should be called before "trackPageView" */
  _paq.push(['trackPageView']);
  _paq.push(['enableLinkTracking']);
  (function() {
    var u="https://karma.l2c2.co.in/";
    _paq.push(['setTrackerUrl', u+'matomo.php']);
    _paq.push(['setSiteId', '54']);
    var d=document, g=d.createElement('script'), s=d.getElementsByTagName('script')[0];
    g.async=true; g.src=u+'matomo.js'; s.parentNode.insertBefore(g,s);
  })();
</script>
<!-- End Matomo Code --></div>
</div>
<!--<center><b>Maintained and Designed by</b> <br /><img src="http://142.11.243.235:6061/opac-tmpl/bootstrap/kongunadu/2cqrlogo.jpeg" style="max-width: 2%;" /> <b>Anna Centenary Library , Chennai. All Rights Reserved.</b></center>--></div>
                </div>
            
        </div>
    
 </div>
            </div>
        </div>
    
    <!-- prettier-ignore-start -->
    </div> <!-- / #wrapper in masthead.inc -->
    <!-- prettier-ignore-end -->

    
        <footer id="changelanguage" class="navbar navbar-expand navbar-light bg-light noprint">
            <div class="container-fluid">
                <div class="collapse navbar-collapse">
                    
                    

                    <div class="navbar-nav flex-grow-1">
                        

                        
                    </div>
                    
                        <div class="navbar-nav">
                            <a id="koha_url" class="nav-link koha_url" href="https://koha-community.org">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16">
                                    <path
                                        fill="currentColor"
                                        d="M7.394.75c.82-.45 1.75-.72 2.69-.75.5.015.99.1 1.45.27.92.35 1.68 1.05 2.15 1.9.53.865.76 1.875.87 2.875.25 3.315-.98 6.635-3.07 9.18-.825.82-1.835 1.52-3 1.735-.96.135-2-.07-2.775-.675-.48-.365-.67-1-.63-1.575.425.6 1.12 1.015 1.86 1.035.675.03 1.35-.275 1.8-.765.75-.825.835-2.21.12-3.08-.325-.375-.7-.715-1.15-.95-.44-.265-.95-.38-1.46-.45-.93-.06-1.9.11-2.72.57a3.22 3.22 0 0 0-1.565 2.15c-.2.7-.125 1.43-.05 2.14-.31-.81-.43-1.67-.5-2.53v-.64c.12-3.13 1.43-6.2 3.53-8.515.725-.75 1.53-1.43 2.45-1.92Zm0 0"
                                        style="stroke-width:.500008"
                                    />
                                </svg>
                                <span class="koha_url_text">Powered by Koha</span>
                            </a>
                        </div>
                    
                </div>
                <!-- /.collapse.navbar-collapse -->
            </div>
            <!-- /.container-fluid -->
        </footer>
        <!-- / #changelanguage -->
    




<!-- CookieConsentedJS code that may run -->


<!-- JavaScript includes -->
<script src="/opac-tmpl/lib/jquery/jquery-3.6.0.min_25.0502000.js"></script>
<script src="/opac-tmpl/lib/jquery/jquery-migrate-3.3.2.min_25.0502000.js"></script>
<script src="/opac-tmpl/lib/bootstrap/js/bootstrap.bundle.min_25.0502000.js"></script>
<script src="/opac-tmpl/lib/fontfaceobserver/fontfaceobserver.min_25.0502000.js"></script>
<script src="/opac-tmpl/lib/enquire/enquire.min_25.0502000.js"></script>
<script>
    let logged_in_user_id = "";
</script>
<script src="/opac-tmpl/bootstrap/js/global_25.0502000.js"></script>
<script type="module" src="/opac-tmpl/bootstrap/js/form-submit_25.0502000.js"></script>

    <script src="/opac-tmpl/bootstrap/js/amazonimages_25.0502000.js"></script>

<script>
    

    
        $(window).load(function() {
            verify_images();
         });
    
    $(".print-large").on("click",function(){
        window.print();
        return false;
    });
    $(".addtoshelf").on("click",function(e){
        e.preventDefault();
        Dopop( this.href );
    });
    $("body").on("click", ".addtocart", function(e){
        e.preventDefault();
        var biblionumber = $(this).data("biblionumber");
        addRecord( biblionumber );
    });
    $("body").on("click", ".cartRemove", function(e){
        e.preventDefault();
        var biblionumber = $(this).data("biblionumber");
        delSingleRecord( biblionumber );
    });
</script>

    <script src="/opac-tmpl/bootstrap/js/basket_25.0502000.js"></script>


<script src="/opac-tmpl/bootstrap/js/tags_25.0502000.js"></script>

    <script src="/opac-tmpl/bootstrap/js/google-jackets_25.0502000.js"></script>




    <script src="/opac-tmpl/bootstrap/js/localcovers_25.0502000.js"></script>






<script src="/opac-tmpl/lib/js-cookie/js.cookie-3.0.1.min_25.0502000.js"></script>
<script src="/opac-tmpl/bootstrap/js/show-password-toggle_25.0502000.js"></script>
<script>
    $(document).ready(function () {
        if ($("#searchsubmit").length) {
            $(document).on("click", "#searchsubmit", function (e) {
                Cookies.remove("form_serialized", { path: "/" });
                Cookies.remove("form_serialized_limits", { path: "/" });
                Cookies.remove("search_path_code", { path: "/" });
            });
        }
    });
</script>




<script src="/opac-tmpl/lib/dayjs/dayjs.min_25.0502000.js"></script>
<script src="/opac-tmpl/lib/dayjs/plugin/timezone_25.0502000.js"></script>
<script src="/opac-tmpl/lib/dayjs/plugin/utc_25.0502000.js"></script>
<script>
    dayjs.extend(window.dayjs_plugin_utc);
    dayjs.extend(window.dayjs_plugin_timezone);
</script>
<!-- js-date-format.inc -->
<script>
    (function() {
        var def_date_format = 'metric';
        var def_time_format = '24hr';
        var def_tz = 'Asia/Kolkata';

        var get_date_pattern = function(format) {
            var date_pattern = 'YYYY-MM-DD';
            if(format == 'us') date_pattern = 'MM/DD/YYYY';
            if(format == 'metric') date_pattern = 'DD/MM/YYYY';
            if(format == 'dmydot') date_pattern = 'DD.MM.YYYY';
            return date_pattern;
        };

        var get_time_pattern = function(format) {
            var time_pattern = 'HH:mm';
            if(format == '12hr') time_pattern = 'hh:mm a';
            return time_pattern;
        };

        /*
         * A JS equivalent of the KohaDates TT Plugin. Passed an rfc3339 formatted date string,
         * or JS Date, the function will return a date string formatted as per the koha instance config.
         * Optionally accepts a dateformat parameter to allow override of the configured output format
         * as well as a 'withtime' boolean denoting whether to include time or not in the output string.
         */
        window.$date = function(value, options) {
            if(!value) return '';
            var tz = (options&&options.tz)||def_tz;
            var m = dayjs(value);
            if ( ! value.match(/^\d{4}-\d{2}-\d{2}$/ ) ) {
                m = m.tz(tz);
            }

            var dateformat = (options&&options.dateformat)||def_date_format;
            var withtime = (options&&options.withtime)||false;

            if(dateformat=='rfc3339' && withtime) return m.format();

            var timeformat = (options&&options.timeformat)||def_time_format;
            var date_pattern = get_date_pattern(dateformat);
            var time_pattern = !withtime?'':' '+get_time_pattern(timeformat);

            return m.format(date_pattern+time_pattern);
        }

        window.$datetime = function(value, options) {
            options = options||{};
            options.withtime = true;
            return $date(value, options);
        };

        window.$time = function(value, options) {
            if(!value) return '';
            var tz = (options&&options.tz)||def_tz;
            var m = dayjs(value);
            if(tz) m = m.tz(tz);

            var dateformat = (options&&options.dateformat);
            var timeformat = (dateformat=='rfc3339'&&'24hr')||(options&&options.timeformat)||def_time_format;

            return m.format(get_time_pattern(timeformat)+(dateformat=='rfc3339'?':ss'+(!m.isUTC()?'Z':''):''))+(dateformat=='rfc3339' && m.isUTC()?'Z':'');
        }

    })();
</script>
<!-- / js-date-format.inc -->


<script>
    (function () {
        /**
         * Format the biblio response from a Koha RESTful API request.
         * @param  {Object}  biblio  The biblio json object as returned from the Koha RESTful API
         * @param  {Object}  config  A configuration object
         *                           Valid keys are: `link`
         * @return {string}          The formatted HTML string
         */
        window.$biblio_to_html = function (biblio, config) {
            if (biblio === undefined) {
                return ""; // empty string for no biblio
            }

            var title = '<span class="biblio-title">';
            if (biblio.title != null && biblio.title != "") {
                title += escape_str(biblio.title);
            } else {
                title += _("No title");
            }
            title += "</span>";

            // add subtitle
            if (biblio.subtitle != null && biblio.subtitle != "") {
                title += ' <span class="biblio-subtitle">' + escape_str(biblio.subtitle) + "</span>";
            }

            // set title as link
            if (config && config.link) {
                if (config.link === "marcdetail") {
                    title = '<a href="/cgi-bin/koha/opac-MARCdetail.pl?biblionumber=' + encodeURIComponent(biblio.biblio_id) + '" class="title">' + title + "</a>";
                } else if (config.link === "labeled_marc") {
                    title = '<a href="/cgi-bin/koha/opac-labeledMARCdetail.pl?biblionumber=' + encodeURIComponent(biblio.biblio_id) + '" class="title">' + title + "</a>";
                } else if (config.link === "isbd") {
                    title = '<a href="/cgi-bin/koha/opac-ISBDdetail.pl?biblionumber=' + encodeURIComponent(biblio.biblio_id) + '" class="title">' + title + "</a>";
                } else {
                    title = '<a href="/cgi-bin/koha/opac-detail.pl?biblionumber=' + encodeURIComponent(biblio.biblio_id) + '" class="title">' + title + "</a>";
                }
            }

            // add medium
            if (biblio.medium != null && biblio.medium != "") {
                title += ' <span class="biblio-medium">' + escape_str(biblio.medium) + "</span>";
            }

            // add part numbers/names
            let part_numbers = typeof biblio.part_number === "string" ? biblio.part_number.split("|") : [];
            let part_names = typeof biblio.part_name === "string" ? biblio.part_name.split("|") : [];
            let i = 0;
            while (part_numbers[i] || part_names[i]) {
                if (part_numbers[i]) {
                    title += ' <span class="part-number">' + escape_str(part_numbers[i]) + "</span>";
                }
                if (part_names[i]) {
                    title += ' <span class="part-name">' + escape_str(part_names[i]) + "</span>";
                }
                i++;
            }

            return title;
        };
    })();
</script>









</body>
<!-- prettier-ignore-start -->
</html>
<!-- prettier-ignore-end -->


