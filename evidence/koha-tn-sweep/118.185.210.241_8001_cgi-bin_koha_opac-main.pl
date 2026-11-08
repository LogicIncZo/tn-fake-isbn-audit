


































<!DOCTYPE html>
<!-- TEMPLATE FILE: opac-main.tt -->









<html lang="en" class="no-js">
<head>

<title>Anna Centenary Library catalog</title>
<link rel="canonical" href="/" />



<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="generator" content="Koha" /> <!-- leave this for stats -->
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="csrf-token" content="24ef7973a2b5cf22fa9b333ba1ad3d64f06ba696,168df2ce6ddad1b18cae84a45b7aef28a3b3aa4c,1794130501">


<link rel="shortcut icon" href="/opac-tmpl/bootstrap/images/favicon.ico" type="image/x-icon" />
<link rel="apple-touch-icon" href="/opac-tmpl/bootstrap/images/favicon.ico" type="image/x-icon" />

    
        
    


    <link type="text/css" href="/opac-tmpl/bootstrap/css/opac_24.1101000.css" rel="stylesheet">




    <link type="text/css" href="/opac-tmpl/bootstrap/css/print_24.1101000.css" media="print" rel="stylesheet">


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
/*margin-left: 0%!important; */
      margin-left: 0%!important;
    width: 56%;   
    padding: 60px;
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
  /*background-image:url("http://172.16.11.60:8001/opac-tmpl/ACL/ACL_Background_3.jpg");*/
  background-image:url("http://118.185.210.241:8001/opac-tmpl/ACL/ACL_Background_3.jpg");
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
  /*background-color : transparent !important;*/
  background-color : white !important;
  
}

table {
font-size : 75% !important;
}
.breadcrumb
{
  display:none;
}
  
 .no-image { display: none; } 
  
/* ================================================================
   /* ================================================================
   Koha Search Quest — OPACUserCSS  (v2 — manual-accurate)
   Paste into: Koha › Administration › System preferences › OPACUserCSS
   ================================================================ */

/* ── Floating launcher ── */
#ksq-launcher {
  position: fixed;
  bottom: 24px;
  right: 24px;
  z-index: 9998;
  background: #2563eb;
  color: #fff;
  border: none;
  border-radius: 50px;
  padding: 11px 20px;
  font-family: 'Segoe UI', system-ui, sans-serif;
  font-size: 14px;
  font-weight: 700;
  cursor: pointer;
  box-shadow: 0 4px 16px rgba(37,99,235,0.35);
  display: flex;
  align-items: center;
  gap: 8px;
  transition: background 0.15s, transform 0.15s;
}
#ksq-launcher:hover { background: #1d4ed8; transform: translateY(-2px); }

/* ── Overlay ── */
#ksq-overlay {
  display: none;
  position: fixed;
  inset: 0;
  z-index: 9999;
  background: rgba(15,23,42,0.55);
  backdrop-filter: blur(2px);
  align-items: center;
  justify-content: center;
}
#ksq-overlay.ksq-open { display: flex; }

/* ── Panel ── */
#ksq-root {
  font-family: 'Segoe UI', system-ui, sans-serif;
  color: #1e293b;
  background: #f1f5f9;
  width: min(1020px, 97vw);
  height: min(720px, 94vh);
  border-radius: 14px;
  overflow: hidden;
  display: flex;
  flex-direction: column;
  box-shadow: 0 24px 64px rgba(0,0,0,0.28);
}

/* ── Header ── */
#ksq-root .ksq-header {
  background: #fff;
  border-bottom: 1.5px solid #e2e8f0;
  padding: 0 20px;
  height: 54px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  flex-shrink: 0;
}
#ksq-root .ksq-header-brand {
  display: flex;
  align-items: center;
  gap: 10px;
  font-weight: 800;
  font-size: 18px;
}
#ksq-root .ksq-header-brand .sub {
  font-weight: 400;
  font-size: 11px;
  color: #64748b;
  letter-spacing: 0.12em;
}
#ksq-root .ksq-header-right {
  display: flex;
  align-items: center;
  gap: 20px;
}
#ksq-root .ksq-stat-block { text-align: right; }
#ksq-root .ksq-stat-label {
  font-size: 9px;
  color: #94a3b8;
  font-weight: 700;
  letter-spacing: 0.08em;
  text-transform: uppercase;
}
#ksq-root .ksq-rank-val  { font-size: 13px; font-weight: 700; }
#ksq-root .ksq-score-wrap { position: relative; text-align: right; }
#ksq-root .ksq-score-val  { font-size: 26px; font-weight: 800; color: #2563eb; line-height: 1; }
#ksq-root .ksq-score-flash {
  position: absolute;
  top: -16px; right: 0;
  color: #16a34a;
  font-weight: 800;
  font-size: 13px;
  opacity: 0;
  pointer-events: none;
}
#ksq-root .ksq-score-flash.ksq-anim { animation: ksqFadeUp 2s ease-out forwards; }
#ksq-root .ksq-close-btn {
  background: none; border: none; cursor: pointer;
  color: #94a3b8; font-size: 22px; line-height: 1;
  padding: 2px 4px; border-radius: 4px; transition: color 0.12s;
}
#ksq-root .ksq-close-btn:hover { color: #ef4444; }

/* ── Toast ── */
#ksq-root .ksq-toast {
  display: none;
  background: #fef9c3; border-bottom: 1px solid #fde047;
  color: #78350f; font-weight: 700; padding: 8px 20px;
  font-size: 13px; text-align: center; flex-shrink: 0;
}
#ksq-root .ksq-toast.ksq-visible { display: block; }

/* ── Body ── */
#ksq-root .ksq-body { flex: 1; display: flex; overflow: hidden; }

/* ── Sidebar ── */
#ksq-root .ksq-sidebar {
  width: 210px;
  background: #fff;
  border-right: 1.5px solid #e2e8f0;
  padding: 12px 10px;
  display: flex; flex-direction: column; gap: 12px;
  overflow-y: auto; flex-shrink: 0;
}

/* ── Tab strip (Index / Advanced) ── */
#ksq-root .ksq-tab-strip {
  display: flex; gap: 4px;
  background: #f1f5f9;
  border-radius: 7px; padding: 3px;
  flex-shrink: 0;
}
#ksq-root .ksq-tab-btn {
  flex: 1; border: none; border-radius: 5px;
  padding: 5px 0; cursor: pointer;
  font-family: inherit; font-size: 10px; font-weight: 700;
  transition: background 0.12s, color 0.12s;
  background: transparent; color: #64748b;
}
#ksq-root .ksq-tab-btn.active { background: #2563eb; color: #fff; }

/* ── Group label ── */
#ksq-root .ksq-group-label {
  font-size: 9px; font-weight: 700; color: #94a3b8;
  letter-spacing: 0.08em; text-transform: uppercase; margin-bottom: 5px;
}

/* ── Chips ── */
#ksq-root .ksq-chip-row { display: flex; flex-wrap: wrap; gap: 4px; }
#ksq-root .ksq-chip {
  border-radius: 6px; padding: 4px 8px; cursor: pointer;
  font-size: 10px; font-weight: 700; transition: all 0.12s;
  border-width: 2px; border-style: solid;
  white-space: nowrap;
}

/* ── Input box ── */
#ksq-root .ksq-input-box {
  display: none; border-radius: 8px; padding: 9px;
  border-width: 2px; border-style: solid; background: #f8fafc;
}
#ksq-root .ksq-input-box.ksq-visible { display: block; }
#ksq-root .ksq-input-type-label {
  font-size: 9px; font-weight: 700; letter-spacing: 0.06em;
  text-transform: uppercase; margin-bottom: 4px;
}
#ksq-root .ksq-input-field {
  width: 100%; border: 1px solid #cbd5e1; border-radius: 5px;
  padding: 6px 8px; font-size: 11px; outline: none;
  box-sizing: border-box; font-family: inherit;
}
#ksq-root .ksq-input-hint {
  font-size: 9px; color: #94a3b8; margin-top: 4px; line-height: 1.4;
}
#ksq-root .ksq-add-btn {
  margin-top: 6px; width: 100%; border: none; border-radius: 6px;
  padding: 6px 0; font-weight: 700; font-size: 11px;
  cursor: pointer; font-family: inherit;
  transition: background 0.12s, color 0.12s;
}

/* ── Phrase / Exact toggle ── */
#ksq-root .ksq-phrase-row {
  display: flex; align-items: center; gap: 5px;
  margin-top: 5px; font-size: 10px; color: #64748b;
}
#ksq-root .ksq-phrase-row input { margin: 0; cursor: pointer; }
#ksq-root .ksq-phrase-row label { cursor: pointer; user-select: none; }

/* ── Section divider ── */
#ksq-root .ksq-section-divider {
  border-top: 1px solid #f1f5f9; padding-top: 10px;
}

/* ── Missions ── */
#ksq-root .ksq-mission-row {
  display: flex; gap: 6px; align-items: flex-start;
  padding: 4px 5px; border-radius: 6px; margin-bottom: 3px;
  border: 1px solid transparent;
}
#ksq-root .ksq-mission-row.done  { background: #f0fdf4; border-color: #bbf7d0; }
#ksq-root .ksq-mission-row:not(.done) { background: #f8fafc; }
#ksq-root .ksq-mission-icon { font-size: 13px; line-height: 1.4; }
#ksq-root .ksq-mission-title     { font-size: 10px; font-weight: 700; }
#ksq-root .ksq-mission-title.done { color: #15803d; }
#ksq-root .ksq-mission-title:not(.done) { color: #374151; }
#ksq-root .ksq-mission-desc      { font-size: 9px; color: #9ca3af; }

/* ── Rank progress ── */
#ksq-root .ksq-progress-bar-bg {
  background: #e2e8f0; border-radius: 4px; height: 7px; overflow: hidden;
}
#ksq-root .ksq-progress-bar-fill {
  background: #2563eb; height: 100%; border-radius: 4px; transition: width 0.6s ease;
}
#ksq-root .ksq-progress-label { font-size: 9px; color: #64748b; margin-top: 4px; }

/* ── Tip ── */
#ksq-root .ksq-tip {
  background: #eff6ff; border-radius: 6px; padding: 7px 9px;
  font-size: 9px; color: #1d4ed8; border-left: 3px solid #3b82f6; line-height: 1.5;
}

/* ── Main area ── */
#ksq-root .ksq-main { flex: 1; display: flex; flex-direction: column; overflow: hidden; }

/* ── Builder ── */
#ksq-root .ksq-builder {
  background: #fff; border-bottom: 1.5px solid #e2e8f0;
  padding: 12px 16px; flex-shrink: 0;
}
#ksq-root .ksq-builder-title {
  font-weight: 700; font-size: 13px; margin-bottom: 8px; color: #374151;
}
#ksq-root .ksq-query-drop {
  min-height: 78px; border: 2px dashed #cbd5e1; border-radius: 10px;
  padding: 10px 12px; display: flex; flex-wrap: wrap; align-items: center; gap: 6px;
  background: #fafbfc;
}
#ksq-root .ksq-query-placeholder { color: #94a3b8; font-size: 13px; }

/* ── Blocks ── */
#ksq-root .ksq-block-wrap { display: inline-flex; align-items: center; gap: 4px; }
#ksq-root .ksq-block-arrow { color: #cbd5e1; font-size: 17px; user-select: none; }
#ksq-root .ksq-block-pill {
  position: relative; display: inline-flex; flex-direction: column;
  align-items: center; color: #fff; border-radius: 8px;
  padding: 4px 12px; line-height: 1.4; cursor: default;
}
#ksq-root .ksq-block-pill.phrase-mode { border: 2px dashed rgba(255,255,255,0.6); }
#ksq-root .ksq-block-type  { font-size: 8px; opacity: 0.8; font-weight: 700; letter-spacing: 0.05em; }
#ksq-root .ksq-block-value { font-size: 12px; font-weight: 700; }
#ksq-root .ksq-block-modifier { font-size: 8px; opacity: 0.7; font-style: italic; }
#ksq-root .ksq-block-remove {
  position: absolute; top: -6px; right: -6px;
  background: #fff; color: #ef4444; border: 1.5px solid #ef4444;
  border-radius: 50%; width: 16px; height: 16px; padding: 0;
  cursor: pointer; display: flex; align-items: center; justify-content: center;
  font-size: 10px; font-weight: 900; line-height: 1;
}

/* ── Actions ── */
#ksq-root .ksq-actions { display: flex; gap: 8px; margin-top: 8px; align-items: center; }
#ksq-root .ksq-btn-clear {
  background: #fff; color: #ef4444; border: 1.5px solid #ef4444;
  border-radius: 7px; padding: 7px 14px; cursor: pointer;
  font-weight: 700; font-size: 12px; font-family: inherit; transition: background 0.12s;
}
#ksq-root .ksq-btn-clear:hover { background: #fef2f2; }
#ksq-root .ksq-btn-run {
  background: #2563eb; color: #fff; border: none; border-radius: 7px;
  padding: 7px 22px; cursor: pointer; font-weight: 700; font-size: 12px;
  font-family: inherit; transition: background 0.12s;
}
#ksq-root .ksq-btn-run:hover:not(:disabled) { background: #1d4ed8; }
#ksq-root .ksq-btn-run:disabled { background: #94a3b8; cursor: not-allowed; }

/* ── Sort selector ── */
#ksq-root .ksq-sort-wrap { margin-left: auto; display: flex; align-items: center; gap: 6px; }
#ksq-root .ksq-sort-label { font-size: 10px; color: #64748b; font-weight: 600; }
#ksq-root .ksq-sort-select {
  border: 1px solid #cbd5e1; border-radius: 5px; padding: 5px 7px;
  font-size: 11px; font-family: inherit; background: #fff; cursor: pointer;
}

/* ── Results / preview pane ── */
#ksq-root .ksq-results { flex: 1; overflow-y: auto; padding: 16px; }

/* ── Empty state ── */
#ksq-root .ksq-empty-state { text-align: center; padding-top: 50px; color: #94a3b8; }
#ksq-root .ksq-empty-icon  { font-size: 50px; }
#ksq-root .ksq-empty-title { margin-top: 10px; font-size: 15px; font-weight: 600; }
#ksq-root .ksq-empty-sub   { font-size: 12px; margin-top: 4px; }

/* ── Preview panel ── */
#ksq-root .ksq-preview-wrap { display: flex; flex-direction: column; gap: 12px; }
#ksq-root .ksq-preview-label { font-weight: 800; font-size: 13px; color: #374151; }

#ksq-root .ksq-query-banner {
  background: #f8fafc; border: 1px solid #e2e8f0; border-radius: 8px;
  padding: 8px 13px; font-size: 11px; display: flex; gap: 7px; align-items: flex-start;
}
#ksq-root .ksq-query-banner-label { font-weight: 700; color: #64748b; flex-shrink: 0; }
#ksq-root .ksq-query-banner-val   { font-family: monospace; color: #1e293b; word-break: break-all; }

#ksq-root .ksq-url-box { background: #f0fdf4; border-color: #bbf7d0; }
#ksq-root .ksq-url-box .ksq-query-banner-label { color: #15803d; }
#ksq-root .ksq-url-box .ksq-query-banner-val   { color: #166534; font-size: 10px; }

/* ── Explain grid ── */
#ksq-root .ksq-explain-grid { display: flex; gap: 10px; flex-wrap: wrap; }
#ksq-root .ksq-explain-card {
  flex: 1 1 130px; background: #fff; border: 1px solid #e2e8f0;
  border-radius: 9px; padding: 9px 11px; min-width: 130px;
}
#ksq-root .ksq-explain-head {
  font-size: 10px; font-weight: 800; color: #374151;
  margin-bottom: 7px; border-bottom: 1px solid #f1f5f9; padding-bottom: 5px;
}
#ksq-root .ksq-explain-row { display: flex; align-items: center; gap: 5px; margin-bottom: 4px; }
#ksq-root .ksq-explain-tag {
  color: #fff; font-size: 8px; font-weight: 800; border-radius: 4px;
  padding: 2px 5px; letter-spacing: 0.04em; flex-shrink: 0;
}
#ksq-root .ksq-explain-arrow { color: #cbd5e1; font-size: 11px; flex-shrink: 0; }
#ksq-root .ksq-explain-val {
  font-size: 10px; color: #1e293b; font-weight: 600;
  overflow: hidden; text-overflow: ellipsis; white-space: nowrap;
}
#ksq-root .ksq-explain-modifier { font-size: 9px; color: #7c3aed; font-style: italic; margin-left: 2px; }

/* ── CCL reference card ── */
#ksq-root .ksq-ccl-ref {
  background: #faf5ff; border: 1px solid #e9d5ff; border-radius: 8px;
  padding: 10px 13px;
}
#ksq-root .ksq-ccl-ref-title {
  font-size: 10px; font-weight: 800; color: #7c3aed; margin-bottom: 7px;
}
#ksq-root .ksq-ccl-ref-grid {
  display: grid; grid-template-columns: 1fr 1fr; gap: 4px 16px;
}
#ksq-root .ksq-ccl-ref-row { font-size: 9px; color: #374151; }
#ksq-root .ksq-ccl-ref-row code {
  font-family: monospace; background: #ede9fe; padding: 1px 4px;
  border-radius: 3px; color: #5b21b6; font-size: 9px;
}

/* ── ES syntax card ── */
#ksq-root .ksq-es-ref {
  background: #ecfdf5; border: 1px solid #a7f3d0; border-radius: 8px;
  padding: 10px 13px;
}
#ksq-root .ksq-es-ref-title { font-size: 10px; font-weight: 800; color: #065f46; margin-bottom: 7px; }
#ksq-root .ksq-es-ref-row   { font-size: 9px; color: #374151; margin-bottom: 3px; }
#ksq-root .ksq-es-ref-row code {
  font-family: monospace; background: #d1fae5; padding: 1px 4px;
  border-radius: 3px; color: #065f46; font-size: 9px;
}

/* ── Last-search stamp ── */
#ksq-root .ksq-last-query {
  font-size: 10px; color: #94a3b8;
  border-top: 1px dashed #e2e8f0; padding-top: 8px;
}
#ksq-root .ksq-last-query code { font-family: monospace; color: #64748b; }

/* ── Keyframes ── */
@keyframes ksqFadeUp {
  0%   { opacity: 1; transform: translateY(0); }
  100% { opacity: 0; transform: translateY(-18px); }
}
</style>





<script>
    var Koha = {};
    function _(s) { return s } // dummy function for gettext
    const is_logged_in = false
</script>

<script src="/opac-tmpl/bootstrap/js/Gettext_24.1101000.js"></script>
<script src="/opac-tmpl/bootstrap/js/i18n_24.1101000.js"></script>

<link href="/opac-tmpl/lib/fontawesome/css/fontawesome.min_24.1101000.css" type="text/css" rel="stylesheet">
<link href="/opac-tmpl/lib/fontawesome/css/brands.min_24.1101000.css" type="text/css" rel="stylesheet">
<link href="/opac-tmpl/lib/fontawesome/css/solid.min_24.1101000.css" type="text/css" rel="stylesheet">































































































</head>




    





    

<body ID="opac-main" class="branch-default" >


































































































































<button id="scrolltocontent">Skip to main content</button>
<div id="wrapper">
    <div id="header-region" class="noprint">
        <nav class="navbar navbar-expand">
            <div id="logo">
            <a class="navbar-brand" href="/cgi-bin/koha/opac-main.pl">
                
                    Anna Centenary Library
                
            </a>
            </div>
            
                
                <ul id="cart-list-nav" class="navbar-nav">
                    
                    <li class="divider-vertical"></li>
                    
                        
                            <li class="nav-item dropdown">
                                <a href="/cgi-bin/koha/opac-shelves.pl" title="Show lists" class="nav-link dropdown-toggle" id="listsmenu" data-bs-toggle="dropdown" role="button" aria-label="Show dropdown with detailed list information" aria-haspopup="true" aria-expanded="false"
                                    ><i class="fa fa-list fa-fw fa-icon-black" aria-hidden="true"></i> <span class="listslabel">Lists</span>
                                </a>
                                <div aria-labelledby="listsmenu" role="menu" class="dropdown-menu">
                                    
                                        <a class="dropdown-item" href="/cgi-bin/koha/opac-shelves.pl?op=list&amp;public=1" tabindex="-1" role="menuitem"><strong>Public lists</strong></a>
                                        
                                        
                                            <a class="dropdown-item" href="/cgi-bin/koha/opac-shelves.pl?op=view&amp;shelfnumber=6&amp;sortfield=title" tabindex="-1" role="menuitem">கணினி1</a>
                                            
                                            
                                        
                                        
                                            <a class="dropdown-item listmenulink" href="/cgi-bin/koha/opac-shelves.pl?op=list&amp;public=1" tabindex="-1" role="menuitem">View all</a>
                                        
                                    
                                    
                                    
                                </div> <!-- / .dropdown-menu -->
                            </li> <!-- / .nav-item.dropdown -->
                        
                    
                    

                </ul> <!-- / .navbar-nav -->
            
            
                
                
                <ul id="members" class="navbar-nav">
                    <li class="nav-item dropdown dropdown-menu-end">
                        

                        
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
            
        </nav> <!-- /navbar -->

        
            <div class="container-fluid">
                <div class="row">
                    <div class="col">
                        
    
        <div id="opacheader">
            
                <div class="default_item">
                    
                    <div class="default_body"><!--<style>
.responsive {
  width: 100%;
  }
</style>
<div><img src="https://1.bp.blogspot.com/-bqSrH7tNfsg/YUm0h4cQQfI/AAAAAAAAFvo/0d2LIVSo8kAZNGMRgb0q_tFXL9yQOnlVwCLcBGAsYHQ/s734/acl%2Blogo%2Bnew.jpg" width="100%" height="100%" alt="" class="responsive" style="display: block; margin-left: auto; margin-right: auto;" /></div>
<style>
/* Style the body */

/* Header/Logo Title */
.header {
  padding: 6px;
  text-align: center;
  background: #b92020;
  color: white;
  font-size: 21px;
}

</style>
<div class="header">
<p>WEBOPAC (ONLINE PUBLIC ACCESS CATALOGUE)</p>
</div>--> <!--<img src="http://117.239.65.6:8001/opac-tmpl/ACL/ACL_Banner_new_1.webp" width="100%" height="200" />--> <img src="http://118.185.210.241:8001/opac-tmpl/ACL/ACL_Banner_new_1.webp" width="100%" height="200" /></div>
                </div>
            
        </div>
    

                    </div>
                </div>
            </div>
        

    </div> <!-- / header-region -->

    
        <div class="container-fluid">
            
                <div class="row">
                    <div class="col">
                            <div id="opac-main-search" class="mastheadsearch">
                                
                                    
    
        <div id="OpacCustomSearch">
            
                <div class="default_item">
                    
                    <div class="default_body"><div class="container-fluid">
<div class="row">
<div class="col">
<div id="opac-main-search" class="mastheadsearch">
<div id="OpacCustomSearch">
<div class="default_item">
<div class="default_body">
<div id="mainpage" style="display: block;">
<div id="cust-search-format">
<div id="cust-search-header">Search the Library Catalogue</div>
<form method="get" action="/cgi-bin/koha/opac-search.pl">
<div class="form-row align-items-center">
<div class="col-sm-auto order-1 order-sm-1"><select name="idx" id="masthead_search" class="form-control">
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
<div class="col order-2 order-sm-2 mt-2"><input type="text" title="Type search term" class="transl1 form-control" id="translControl1" name="q" /> <span id="translControl"></span></div>
<!-- /.col -->
<div class="order-3 col-sm-auto mt-2"><button type="submit" id="searchsubmit" class="btn btn-primary">Go</button></div>
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
    

                                
                            </div><!-- /#opac-main-search -->
                    </div> <!-- /.col -->
                </div> <!-- /.row -->
            

            <div class="row">
                <ul class="nav" id="moresearches">
                    <li class="nav-item">
                        <a href="/cgi-bin/koha/opac-search.pl">Advanced search</a>
                    </li>
                    
                    
                    
                        <li class="nav-item">
                            <a href="/cgi-bin/koha/opac-authorities-home.pl">Authority search</a>
                        </li>
                    
                    
                    
                        <li class="nav-item">
                            <a href="/cgi-bin/koha/opac-tags.pl">Tag cloud</a>
                        </li>
                    
                    
                    
                    
                    
                    
                        <li class="nav-item">
                            <a id="library_page" href="/cgi-bin/koha/opac-library.pl">
                                
                                    <span>Library</span>
                                
                            </a>
                        </li>
                    
                    
    

                </ul> <!-- /.nav#moresearches -->
            </div> <!-- /.row -->
        </div> <!-- /.container-fluid -->
    

    <!-- Login form hidden by default, used for modal window -->
    <div id="loginModal" class="modal" tabindex="-1" role="dialog" aria-labelledby="modalLoginLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title" id="modalLoginLabel">Log in to your account</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="/cgi-bin/koha/opac-user.pl" method="post" name="auth" id="modalAuth">
                    <input type="hidden" name="csrf_token" value="24ef7973a2b5cf22fa9b333ba1ad3d64f06ba696,168df2ce6ddad1b18cae84a45b7aef28a3b3aa4c,1794130501" />

                    <input type="hidden" name="has-search-query" id="has-search-query" value="" />
                    <div class="modal-body">
                        
                        
                        
                            
                            
                            <input type="hidden" name="koha_login_context" value="opac" />
                            <fieldset class="brief">
                                <div class="local-login">
                                    
    <label for="muserid">Card number or username:</label>
<input type="text" id="muserid" name="login_userid" autocomplete="off" />
                                    <label for="mpassword">Password:</label><input type="password" id="mpassword" name="login_password" autocomplete="off" />
                                    <fieldset class="action">
                                        <input type="hidden" name="op" value="cud-login" />
                                        <input type="submit" class="btn btn-primary" value="Log in" />
                                    </fieldset>
                                </div>
                                
                                
                                
                            </fieldset>
                        
                    </div>
                </form> <!-- /#auth -->
            </div> <!-- /.modal-content -->
        </div> <!-- /.modal-dialog -->
    </div>  <!-- /#modalAuth  -->
    


<div class="main">
    
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
            
                <div class="default_item">
                    
                    <div class="default_body"><div id="navigation">
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
#OpacNavLeft tr:nth-child(even){background-color: #f2f2f2;}
/*#OpacNavLeft tr:nth-child(even){background-color: transparent;}*/
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
<th><a href="/cgi-bin/koha/opac-page.pl?page_id=12" class="buttonside buttonside1">Click here to Search Floor Wise Library Collection📚</a></th>
</tr>
<tr>
<th><strong>Contact Us</strong></th>
</tr>
<tr>
<td>The Chief Librarian &amp; Information Officer Anna Centenary Library Kotturpuram , <br />Chennai - 600025, <br />Tamil Nadu.</td>
</tr>
<tr>
<td>E-mail:<a href="mailto:clbrnaclchn.dopl@tn.gov.in">clbrnaclchn.dopl@tn.gov.in</a></td>
</tr>
<tr>
<td>Phone:<a href="tel:04422201011">04422201011</a></td>
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
                    
                    <div class="default_body"><div class="container" align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding: 0px; color: #444444; font-family: 'PT Sans', Arial, sans-serif; text-align: center;"><big style="vertical-align: baseline; outline: none; font-size: 15.6px; background: transparent; border: none; margin: 0px; padding: 0px;"><big style="vertical-align: baseline; outline: none; font-size: 15.6px; background: transparent; border: none; margin: 0px; padding: 0px;"> <big style="vertical-align: baseline; outline: none; font-size: 18.72px; background: transparent; border: none; margin: 0px; padding: 0px;"></big></big></big>
<h1 style="vertical-align: baseline; outline: none; background: transparent; border: none; margin-top: -12px; padding: 0px; color: #ff0000; font-weight: bolder;">Attention Readers !</h1>
</div>
<br /><marquee><span style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding: 0px; font-family: 'PT Sans', Arial, sans-serif;"> <a href="https://www.annacentenarylibrary.org/pages/view/services"><span style="color: #fff;"><b>வாசகர்கள் தாங்கள் பரிந்துரைக்க விரும்பும் நூல்களை அந்தந்த தளங்களிலுள்ள புத்தக பரிந்துரைப் பதிவேடு அல்லது இந்த Link ஐ Click செய்து தெரிவிக்கலாம். | Readers may suggest books in the book suggestion registers kept at the floors or through online via clicking this link.</b></span></a></span></marquee><hr />
<div style="background-color: #ffffb3; padding: 10px; border: 1px solid green;" align="center">
<div align="center" style="font-weight: normal;">
<div align="center" style="font-weight: normal; vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; color: #444444; font-family: 'PT Sans', Arial, sans-serif; text-align: center;"><span style="vertical-align: baseline; outline: none; font-size: 16.72px; background: transparent; border: none; margin: 0px; padding: 0px; color: #ff0000;"><span style="vertical-align: baseline; outline: none; font-size: 16.72px; background: transparent; border: none; margin: 0px; padding: 0px; color: #ff0000;"><span style="text-decoration: underline;"><span style="font-size: 10pt;"><span style="font-size: 12pt;"></span><strong>(தினம் ஒரு திருக்குறள் / Thirukkural for the day)</strong></span></span></span></span>
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
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;"><span style="color: #444444; font-family: PT Sans, Arial, sans-serif;">துணைநலம் ஆக்கம் த்ருஉம் வினைநலம்</span></div>
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;"><span style="color: #444444; font-family: PT Sans, Arial, sans-serif;">வேண்டிய எல்லாந் தரும்.&nbsp;</span></div>
</div>
</div>
</div>
<div class="container" align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;"><span style="color: #3598db; text-decoration-line: underline;"><span style="font-family: Arial, Helvetica, sans-serif;"><span style="font-family: 'PT Sans', Arial, sans-serif; font-size: 13.3333px;"><span style="font-size: 13.3333px;"><span style="font-size: 13.3333px;">(பொருட்பால்-</span></span></span></span></span><span style="color: #3598db;"><span style="background-color: transparent;">வினைத்தூய்மை</span><span><span style="font-family: Arial, Helvetica, sans-serif;"><span style="font-family: 'PT Sans', Arial, sans-serif; font-size: 13.3333px;"><span style="font-size: 13.3333px;"><span style="font-size: 13.3333px;"><span style="font-size: 13.3333px;">-</span></span></span></span></span></span></span><span style="color: #3598db; text-decoration-line: underline;"><span style="color: #3598db; text-decoration-line: underline;"><span style="font-family: Arial, Helvetica, sans-serif;"><span style="font-family: 'PT Sans', Arial, sans-serif; font-size: 13.3333px;"><span style="font-size: 13.3333px;"><span style="font-size: 13.3333px;"><span style="font-size: 13.3333px;"><span style="font-size: 13.3333px;"><u><span style="color: #3598db; font-family: PT Sans, Arial, sans-serif;"><span style="font-size: 13.3333px;"> குறள் எண்.651)</span></span><br /></u><span></span></span></span></span></span></span></span></span></span>
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;">ஒருவருக்குக் கிடைக்கும் துணைவர்களால் வலிமை பெருகும்; அவர்களுடன் கூடி ஆற்றிடும் நற்செயல்களால் எல்லா நலன்களும் கிட்டும்.</div>
<div align="center" style="vertical-align: baseline; outline: none; background: transparent; border: none; margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; text-align: center;"><span style="color: #3598db;"><span style="font-size: 10pt;"><span style="font-size: 10pt;"><span style="font-size: 10pt;">(</span></span></span></span><span style="color: #3598db;"><span style="font-size: 10pt;"><span style="font-size: 10pt;"></span></span></span><span style="color: #3598db; text-decoration: underline;"><span style="font-size: 10pt;"><span style="font-size: 10pt;">மு.</span></span></span><span style="color: #3598db; text-decoration: underline;"><span style="font-size: 10pt;"><span style="font-size: 10pt;"> கருணாநிதி உரை)</span></span></span></div>
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
<div style="color: #3598db; font-family: 'PT Sans', Arial, sans-serif; font-weight: normal;">
<div style="color: #3598db; font-family: 'PT Sans', Arial, sans-serif; font-weight: normal;">
<div style="color: #3598db; font-family: 'PT Sans', Arial, sans-serif; font-weight: normal;">
<div style="color: #3598db; font-family: 'PT Sans', Arial, sans-serif; font-weight: normal;">
<div style="color: #3598db; font-family: 'PT Sans', Arial, sans-serif; font-weight: normal;"><span style="color: #000000;">Good alliance brings success; And good deeds all one needs.</span></div>
</div>
</div>
</div>
<span style="color: #000000;"><span style="font-size: 13.3333px;"><strong><span style="background-color: transparent;"></span></strong></span></span></div>
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
</div></div>
                </div>
            
                <div class="default_item">
                    
                    <div class="default_body"><!-- Debut du carrousel --><!-- Carrousel 4.2.4 -->
    


<meta charset="utf-8"/>

<div id="inlibro-carrousel">

    
        <div class="carrouselFrame">
            <p class="special-title">New Arrivals</p>
            <div class="loadingDiv"></div>
            <div id="carrousel-0" class="carrousel">
                <a class="left carousel-control" aria-label="previous" tabindex="0">&lsaquo;</a>
                <a class="right carousel-control" aria-label="next" tabindex="0">&rsaquo;</a>
                
                    
                        <a href="/cgi-bin/koha/opac-detail.pl?biblionumber=240230" title="Human Motivation"><img class="cloudcarousel" src="https://images-na.ssl-images-amazon.com/images/P/0521095808.01.MZZZZZZZ.jpg" alt="Human Motivation" ></a>
                    
                
                    
                        <a href="/cgi-bin/koha/opac-detail.pl?biblionumber=568394" title="th big book of fun with math math"><img class="cloudcarousel" src="https://images-na.ssl-images-amazon.com/images/P/817649853X.01.MZZZZZZZ.jpg" alt="th big book of fun with math math" ></a>
                    
                
                    
                        <a href="/cgi-bin/koha/opac-detail.pl?biblionumber=573060" title="Best Friends Guide To Spectacular Sleepovers"><img class="cloudcarousel" src="https://covers.openlibrary.org/b/isbn/0439689457-M.jpg?default=false" alt="Best Friends Guide To Spectacular Sleepovers" ></a>
                    
                
                    
                        <a href="/cgi-bin/koha/opac-detail.pl?biblionumber=573519" title="Star Wars Jedi Quest"><img class="cloudcarousel" src="https://images-na.ssl-images-amazon.com/images/P/0439339189.01.MZZZZZZZ.jpg" alt="Star Wars Jedi Quest" ></a>
                    
                
                    
                        <a href="/cgi-bin/koha/opac-detail.pl?biblionumber=622503" title="Teaching and Assessing Skills in First Language English"><img class="cloudcarousel" src="https://images-na.ssl-images-amazon.com/images/P/0521753554.01.MZZZZZZZ.jpg" alt="Teaching and Assessing Skills in First Language English" ></a>
                    
                
                    
                        <a href="/cgi-bin/koha/opac-detail.pl?biblionumber=627826" title="Set this house on fire"><img class="cloudcarousel" src="https://images-na.ssl-images-amazon.com/images/P/0679736743.01.MZZZZZZZ.jpg" alt="Set this house on fire" ></a>
                    
                
                    
                        <a href="/cgi-bin/koha/opac-detail.pl?biblionumber=627827" title="The System of the World (The Baroque Cycle, Vol. 3)"><img class="cloudcarousel" src="https://images-na.ssl-images-amazon.com/images/P/0060750863.01.MZZZZZZZ.jpg" alt="The System of the World (The Baroque Cycle, Vol. 3)" ></a>
                    
                
                    
                        <a href="/cgi-bin/koha/opac-detail.pl?biblionumber=627828" title="Special Relationship"><img class="cloudcarousel" src="https://images-na.ssl-images-amazon.com/images/P/0140284222.01.MZZZZZZZ.jpg" alt="Special Relationship" ></a>
                    
                
                    
                        <a href="/cgi-bin/koha/opac-detail.pl?biblionumber=627830" title="Secret Prey (Prey Series)"><img class="cloudcarousel" src="https://images-na.ssl-images-amazon.com/images/P/0425168298.01.MZZZZZZZ.jpg" alt="Secret Prey (Prey Series)" ></a>
                    
                
                    
                        <a href="/cgi-bin/koha/opac-detail.pl?biblionumber=627831" title="A Spy for the Redeemer (Owen Archer Mystery)"><img class="cloudcarousel" src="https://images-na.ssl-images-amazon.com/images/P/0099277972.01.MZZZZZZZ.jpg" alt="A Spy for the Redeemer (Owen Archer Mystery)" ></a>
                    
                
                    
                        <a href="/cgi-bin/koha/opac-detail.pl?biblionumber=627832" title="The Bronze Horseman"><img class="cloudcarousel" src="https://images-na.ssl-images-amazon.com/images/P/0006513220.01.MZZZZZZZ.jpg" alt="The Bronze Horseman" ></a>
                    
                
                    
                        <a href="/cgi-bin/koha/opac-detail.pl?biblionumber=627833" title="Secret love"><img class="cloudcarousel" src="https://images-na.ssl-images-amazon.com/images/P/014200054X.01.MZZZZZZZ.jpg" alt="Secret love" ></a>
                    
                
                    
                        <a href="/cgi-bin/koha/opac-detail.pl?biblionumber=627834" title="So Much for That"><img class="cloudcarousel" src="https://images-na.ssl-images-amazon.com/images/P/0007288026.01.MZZZZZZZ.jpg" alt="So Much for That" ></a>
                    
                
                    
                        <a href="/cgi-bin/koha/opac-detail.pl?biblionumber=627835" title="Suspicion"><img class="cloudcarousel" src="https://images-na.ssl-images-amazon.com/images/P/1439101310.01.MZZZZZZZ.jpg" alt="Suspicion" ></a>
                    
                
                    
                        <a href="/cgi-bin/koha/opac-detail.pl?biblionumber=627836" title="Reading, learning, teaching Toni Morrison"><img class="cloudcarousel" src="https://images-na.ssl-images-amazon.com/images/P/1433102234.01.MZZZZZZZ.jpg" alt="Reading, learning, teaching Toni Morrison" ></a>
                    
                
                    
                        <a href="/cgi-bin/koha/opac-detail.pl?biblionumber=627838" title="The class"><img class="cloudcarousel" src="https://images-na.ssl-images-amazon.com/images/P/0553270907.01.MZZZZZZZ.jpg" alt="The class" ></a>
                    
                
                    
                        <a href="/cgi-bin/koha/opac-detail.pl?biblionumber=627839" title="Tatiana and Alexander"><img class="cloudcarousel" src="https://images-na.ssl-images-amazon.com/images/P/0007118899.01.MZZZZZZZ.jpg" alt="Tatiana and Alexander" ></a>
                    
                
                    
                        <a href="/cgi-bin/koha/opac-detail.pl?biblionumber=627840" title="Rosamund (Friarsgate Inheritance, Book 1)"><img class="cloudcarousel" src="https://images-na.ssl-images-amazon.com/images/P/0451211685.01.MZZZZZZZ.jpg" alt="Rosamund (Friarsgate Inheritance, Book 1)" ></a>
                    
                
                    
                        <a href="/cgi-bin/koha/opac-detail.pl?biblionumber=627841" title="4 classic American novels"><img class="cloudcarousel" src="https://images-na.ssl-images-amazon.com/images/P/0451530551.01.MZZZZZZZ.jpg" alt="4 classic American novels" ></a>
                    
                
                    
                        <a href="/cgi-bin/koha/opac-detail.pl?biblionumber=627842" title="Shadow Prey (Lucas Davenport Mysteries)"><img class="cloudcarousel" src="https://images-na.ssl-images-amazon.com/images/P/0425208842.01.MZZZZZZZ.jpg" alt="Shadow Prey (Lucas Davenport Mysteries)" ></a>
                    
                
                    
                        <a href="/cgi-bin/koha/opac-detail.pl?biblionumber=627844" title="Ringworld's Children"><img class="cloudcarousel" src="https://images-na.ssl-images-amazon.com/images/P/1841492221.01.MZZZZZZZ.jpg" alt="Ringworld's Children" ></a>
                    
                
                    
                        <a href="/cgi-bin/koha/opac-detail.pl?biblionumber=627845" title="The fire"><img class="cloudcarousel" src="https://images-na.ssl-images-amazon.com/images/P/000730353X.01.MZZZZZZZ.jpg" alt="The fire" ></a>
                    
                
                    
                        <a href="/cgi-bin/koha/opac-detail.pl?biblionumber=627846" title="So faux, so good"><img class="cloudcarousel" src="https://images-na.ssl-images-amazon.com/images/P/0380792540.01.MZZZZZZZ.jpg" alt="So faux, so good" ></a>
                    
                
                    
                        <a href="/cgi-bin/koha/opac-detail.pl?biblionumber=627847" title="Splendor in the glass"><img class="cloudcarousel" src="https://images-na.ssl-images-amazon.com/images/P/0380819643.01.MZZZZZZZ.jpg" alt="Splendor in the glass" ></a>
                    
                
                    
                        <a href="/cgi-bin/koha/opac-detail.pl?biblionumber=627848" title="Statue of limitations"><img class="cloudcarousel" src="https://images-na.ssl-images-amazon.com/images/P/0060535148.01.MZZZZZZZ.jpg" alt="Statue of limitations" ></a>
                    
                
                    
                        <a href="/cgi-bin/koha/opac-detail.pl?biblionumber=627849" title="Sonnet to a dead contessa"><img class="cloudcarousel" src="https://images-na.ssl-images-amazon.com/images/P/1410418871.01.MZZZZZZZ.jpg" alt="Sonnet to a dead contessa" ></a>
                    
                
                    
                        <a href="/cgi-bin/koha/opac-detail.pl?biblionumber=627850" title="That Anvil of Our Souls"><img class="cloudcarousel" src="https://images-na.ssl-images-amazon.com/images/P/0671046829.01.MZZZZZZZ.jpg" alt="That Anvil of Our Souls" ></a>
                    
                
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
    color: #ffffff;
    text-align: center;
    background: #222222;
    border: 2px solid #ffffff;
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
    color : #ffffff;
}

#inlibro-carrousel .carousel-control,
#inlibro-carrousel .carousel-caption{
    background-color : #2b2e4a;
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
    background-color : #2b2e4a;
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
    position: relative;
}

#inlibro-carrousel .slider img {
    height: 175px;
}

#inlibro-carrousel .slider button {
    position:absolute;
    top: 70%;
    transform: translateY(-70%);
    height:160px
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
    color: #;
}

#inlibro-carrousel hr{
    margin: -5px 0px 15px 0px;
}

#inlibro-carrousel h2 {
    color: #;
}

#inlibro-carrousel .images {
    left: 0px;
    position: relative;
    white-space: nowrap;

}

#inlibro-carrousel .controls{
    margin-top: 20px;
}

#inlibro-carrousel button{
    color : #ffffff;
    background-color: #2b2e4a;
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
    border: 1px solid #2b2e4a;
}

a:focus>img{
    border: 2px solid #2b2e4a;
}

.cloudcarousel {
    max-width: 300px;
    max-height: 160px;
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

window.addEventListener('load', function() {
    $('.carrousel .cloudcarousel').each( function() {

        if( $(this).length > 0 ){
            
            if( (this.complete != null) && (!this.complete) || this.naturalHeight == 0 ){
                $(this).parent().remove();
            } 
        }
    });

});

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
    

            
        

        </div> <!-- / .col 6/8 -->

        
            <div class="col-12 col-lg-3 order-md-2">
                
                
    
        <div id="OpacNavRight">
            
                <div class="default_item">
                    
                    <div class="default_body"><div id="OpacNavRight">
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
<table id="OpacNavRight" style="margin-left: -35px;">
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
</div>
<br /><br />
<style>
.tg  {border-collapse:collapse;border-color:#aaa;border-spacing:0;}
.tg td{background-color:#fff;border-color:#aaa;border-style:solid;border-width:1px;color:#333;
  font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;word-break:normal;}
.tg th{background-color:#f38630;border-color:#aaa;border-style:solid;border-width:1px;color:#fff;
  font-family:Arial, sans-serif;font-size:14px;font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
.tg .tg-bobw{font-weight:bold;text-align:center;vertical-align:bottom}
.tg .tg-baqh{text-align:center;vertical-align:top}
.tg .tg-8d8j{text-align:center;vertical-align:bottom}
.tg .tg-d53b{background-color:#dae8fc;text-align:center;vertical-align:top}
</style>
<table class="tg" style="margin-left: -35px;">
<thead>
<tr>
<th class="tg-bobw">Category</th>
<th class="tg-bobw">No of Books</th>
<th class="tg-bobw">Loan period (days)</th>
<th class="tg-bobw">Fine amount</th>
<th class="tg-bobw">Renewals allowed (count)</th>
<th class="tg-bobw">Renewal period</th>
</tr>
</thead>
<tbody>
<tr>
<td class="tg-8d8j">Family</td>
<td class="tg-8d8j">5</td>
<td class="tg-8d8j">30 days</td>
<td class="tg-8d8j">1.00/per day</td>
<td class="tg-8d8j">2 times</td>
<td class="tg-8d8j">15 days</td>
</tr>
<tr>
<td class="tg-8d8j">Individual</td>
<td class="tg-8d8j">4</td>
<td class="tg-baqh">30 days</td>
<td class="tg-baqh">1.00/per day</td>
<td class="tg-8d8j">2 times</td>
<td class="tg-baqh">15 days</td>
</tr>
<tr>
<td class="tg-8d8j">Institute</td>
<td class="tg-8d8j">50</td>
<td class="tg-baqh">30 days</td>
<td class="tg-baqh">1.00/per day</td>
<td class="tg-8d8j">1 time</td>
<td class="tg-baqh">15 days</td>
</tr>
<tr>
<td class="tg-8d8j">Senior Citizen</td>
<td class="tg-8d8j">4</td>
<td class="tg-baqh">30 days</td>
<td class="tg-baqh">1.00/per day</td>
<td class="tg-8d8j">2 times</td>
<td class="tg-baqh">15 days</td>
</tr>
<tr>
<td class="tg-8d8j">Student</td>
<td class="tg-8d8j">5</td>
<td class="tg-baqh">30 days</td>
<td class="tg-baqh">1.00/per day</td>
<td class="tg-8d8j">2 times</td>
<td class="tg-baqh">15 days</td>
</tr>
<tr>
<td class="tg-d53b" colspan="6"><span style="font-weight: bold;">Note :Renew your books through Phone 044-22201011</span></td>
</tr>
</tbody>
</table></div>
                </div>
            
        </div>
    

            </div> <!-- / .col -->
        

        </div> <!-- /.container-fluid -->
    </div> <!-- /.row -->
</div> <!-- /.main -->




































































































        
        
            <div class="container-fluid">
                <div class="row">
                    <div class="col">
                        
    
        <div id="opaccredits">
            
                <div class="default_item">
                    
                    <div class="default_body"><div class="opaccredits_en_item">
<div class="opaccredits_en_body">
<div class="topFooter">
<div class="container">
<div class="row">
<div class="col-sm-12">
<h2><span>Find us on the map</span></h2>
<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d15547.451016784232!2d80.2399575!3d13.0171146!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3a526772eb0d4451%3A0xcfc3c35cdd3a47d3!2sAnna%20Centenary%20Library!5e0!3m2!1sen!2sus!4v1631206533525!5m2!1sen!2sus" style="border: 0;" allowfullscreen="" aria-hidden="false" width="100%" height="280" frameborder="0" tabindex="0"></iframe></div>
</div>
</div>
</div>
<div class="footer">
<div class="container footer_container">
<div class="row">
<div class="col-sm-6 copyright"><strong>Anna Centenary Library</strong><br />Copyright &copy; 2023 . All Rights Reserved.</div>
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
        
    </div> <!-- / #wrapper in masthead.inc -->

    
        <footer id="changelanguage" class="navbar navbar-expand navbar-light bg-light noprint">
            <div class="container-fluid">
                <div class="collapse navbar-collapse">
                    
                    

                    <div class="navbar-nav flex-grow-1">
                        

                        
                    </div>
                        
                            <div class="navbar-nav">
                                <a id="koha_url" class="nav-link koha_url" href="http://koha-community.org">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16"><path fill="currentColor" d="M7.394.75c.82-.45 1.75-.72 2.69-.75.5.015.99.1 1.45.27.92.35 1.68 1.05 2.15 1.9.53.865.76 1.875.87 2.875.25 3.315-.98 6.635-3.07 9.18-.825.82-1.835 1.52-3 1.735-.96.135-2-.07-2.775-.675-.48-.365-.67-1-.63-1.575.425.6 1.12 1.015 1.86 1.035.675.03 1.35-.275 1.8-.765.75-.825.835-2.21.12-3.08-.325-.375-.7-.715-1.15-.95-.44-.265-.95-.38-1.46-.45-.93-.06-1.9.11-2.72.57a3.22 3.22 0 0 0-1.565 2.15c-.2.7-.125 1.43-.05 2.14-.31-.81-.43-1.67-.5-2.53v-.64c.12-3.13 1.43-6.2 3.53-8.515.725-.75 1.53-1.43 2.45-1.92Zm0 0" style="stroke-width:.500008"/></svg>
                                    <span class="koha_url_text">Powered by Koha</span>
                                </a>
                            </div>
                        
                    </ul> <!-- /.navbar-nav -->
                </div> <!-- /.collapse.navbar-collapse -->
            </div> <!-- /.container-fluid -->
        </footer> <!-- / #changelanguage -->
    




<!-- CookieConsentedJS code that may run -->


<!-- JavaScript includes -->
<script src="/opac-tmpl/lib/jquery/jquery-3.6.0.min_24.1101000.js"></script>
<script src="/opac-tmpl/lib/jquery/jquery-migrate-3.3.2.min_24.1101000.js"></script>
<script src="/opac-tmpl/lib/bootstrap/js/bootstrap.bundle.min_24.1101000.js"></script>
<script src="/opac-tmpl/lib/fontfaceobserver/fontfaceobserver.min_24.1101000.js"></script>
<script src="/opac-tmpl/lib/enquire/enquire.min_24.1101000.js"></script>
<script>
    let logged_in_user_id = "";
</script>
<script src="/opac-tmpl/bootstrap/js/global_24.1101000.js"></script>


<script>
    

    
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
    $(".clearsh").on("click", function(){
        return confirmDelete( _("Are you sure you want to delete your search history?") );
    });

</script>


    <script src="/opac-tmpl/bootstrap/js/basket_24.1101000.js"></script>




    <script src="/opac-tmpl/bootstrap/js/google-jackets_24.1101000.js"></script>




    <script src="/opac-tmpl/bootstrap/js/localcovers_24.1101000.js"></script>






<script src="/opac-tmpl/lib/js-cookie/js.cookie-3.0.1.min_24.1101000.js"></script>
<script>
$(document).ready(function() {
    if($('#searchsubmit').length) {
        $(document).on("click", '#searchsubmit', function(e) {
            Cookies.remove("form_serialized", { path: '/'});
            Cookies.remove("form_serialized_limits", { path: '/'});
            Cookies.remove("search_path_code", { path: '/'});
        });
    }
});
</script>




<script src="/opac-tmpl/lib/dayjs/dayjs.min_24.1101000.js"></script>
<script src="/opac-tmpl/lib/dayjs/plugin/timezone_24.1101000.js"></script>
<script src="/opac-tmpl/lib/dayjs/plugin/utc_24.1101000.js"></script>
<script>
    dayjs.extend(window.dayjs_plugin_utc);
    dayjs.extend(window.dayjs_plugin_timezone);
</script>

<!-- js-date-format.inc -->
<script>
    (function() {
        var def_date_format = 'dmydot';
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
         * A JS equivilent of the KohaDates TT Plugin. Passed an rfc3339 formatted date string,
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
    (function() {
        /**
         * Format the biblio response from a Koha RESTful API request.
         * @param  {Object}  biblio  The biblio json object as returned from the Koha RESTful API
         * @param  {Object}  config  A configuration object
         *                           Valid keys are: `link`
         * @return {string}          The formatted HTML string
         */
        window.$biblio_to_html = function(biblio, config) {

            if (biblio === undefined) {
                return ''; // empty string for no biblio
            }

            var title = '<span class="biblio-title">';
            if (biblio.title != null && biblio.title != '') {
                title += escape_str(biblio.title);
            } else {
                title += _("No title");
            }
            title += '</span>';

            // add subtitle
            if (biblio.subtitle != null && biblio.subtitle != '') {
                title += ' <span class="biblio-subtitle">' + escape_str(biblio.subtitle) + '</span>';
            }

            // set title as link
            if (config && config.link) {
                if (config.link === 'marcdetail') {
                    title = '<a href="/cgi-bin/koha/opac-MARCdetail.pl?biblionumber=' + encodeURIComponent(biblio.biblio_id) + '" class="title">' + title + '</a>';
                } else if (config.link === 'labeled_marc') {
                    title = '<a href="/cgi-bin/koha/opac-labeledMARCdetail.pl?biblionumber=' + encodeURIComponent(biblio.biblio_id) + '" class="title">' + title + '</a>';
                } else if (config.link === 'isbd') {
                    title = '<a href="/cgi-bin/koha/opac-ISBDdetail.pl?biblionumber=' + encodeURIComponent(biblio.biblio_id) + '" class="title">' + title + '</a>';
                } else {
                    title = '<a href="/cgi-bin/koha/opac-detail.pl?biblionumber=' + encodeURIComponent(biblio.biblio_id) + '" class="title">' + title + '</a>';
                }
            }

            // add medium
            if (biblio.medium != null && biblio.medium != '') {
                title += ' <span class="biblio-medium">' + escape_str(biblio.medium) + '</span>';
            }

            // add part numbers/names
            let part_numbers = (typeof biblio.part_number === 'string') ? biblio.part_number.split("|") : [];
            let part_names = (typeof biblio.part_name === 'string') ? biblio.part_name.split("|") : [];
            let i = 0;
            while (part_numbers[i] || part_names[i]) {
                if (part_numbers[i]) {
                    title += ' <span class="part-number">' + escape_str(part_numbers[i]) + '</span>';
                }
                if (part_names[i]) {
                    title += ' <span class="part-name">' + escape_str(part_names[i]) + '</span>';
                }
                i++;
            }

            return title;
        };
    })();
</script>



    <script>
        /* ================================================================
   Koha Search Quest — OpacUserJS  (v2 — manual-accurate)
   Paste into: Koha › Administration › System preferences › OpacUserJS
   CSS:  OPACUserCSS preference (separate file)

   Search backend : Koha OPAC  (/cgi-bin/koha/opac-search.pl)
   Query syntax   : Koha CCL + Elasticsearch extended syntax
   Source         : https://koha-community.org/manual/latest/en/html/searching.html
   ================================================================ */

(function () {
  "use strict";

  /* ── Block definitions (from Koha manual CCL index table) ────── */

  var CORE_GROUPS = [
    {
      label: "Keyword & Title", color: "#2563eb", kind: "index",
      items: [
        { id: "KW",     ccl: "kw",     label: "Keyword",        hint: "Searches all fields. e.g. artificial intelligence" },
        { id: "TI",     ccl: "ti",     label: "Title",          hint: "e.g. principles of accounting" },
        { id: "TI_PHR", ccl: "ti,phr", label: "Title (phrase)", hint: "Exact phrase. e.g. king arthur" },
        { id: "SE",     ccl: "se",     label: "Series",         hint: "e.g. Oxford Handbooks" },
      ],
    },
    {
      label: "Author / Name", color: "#7c3aed", kind: "index",
      items: [
        { id: "AU",     ccl: "au",     label: "Author",          hint: "e.g. brown joseph" },
        { id: "AU_PHR", ccl: "au,phr", label: "Author (phrase)", hint: "e.g. Rowling J K" },
        { id: "PB",     ccl: "pb",     label: "Publisher",       hint: "e.g. penguin" },
        { id: "PL",     ccl: "pl",     label: "Pub. Place",      hint: "e.g. London" },
      ],
    },
    {
      label: "Subject / Topic", color: "#0891b2", kind: "index",
      items: [
        { id: "SU",     ccl: "su",     label: "Subject",          hint: "e.g. poetry" },
        { id: "SU_PHR", ccl: "su,phr", label: "Subject (phrase)", hint: "e.g. supreme court" },
        { id: "SUGEO",  ccl: "su-geo", label: "Geo. Subject",     hint: "e.g. wales" },
        { id: "SUNA",   ccl: "su-na",  label: "Subject Person",   hint: "e.g. Shakespeare" },
      ],
    },
    {
      label: "Identifiers", color: "#b45309", kind: "index",
      items: [
        { id: "NB",      ccl: "nb",      label: "ISBN",        hint: "e.g. 9780140449143" },
        { id: "NS",      ccl: "ns",      label: "ISSN",        hint: "e.g. 0028-0836" },
        { id: "BC",      ccl: "bc",      label: "Barcode",     hint: "e.g. 502326000912" },
        { id: "CALLNUM", ccl: "callnum", label: "Call Number", hint: "e.g. 823.914 ROW" },
      ],
    },
    {
      label: "Boolean Operators", color: "#ea580c", kind: "operator",
      items: [
        { id: "AND", ccl: "and", label: "AND", hint: "Narrows — both terms must match" },
        { id: "OR",  ccl: "or",  label: "OR",  hint: "Expands — either term matches" },
        { id: "NOT", ccl: "not", label: "NOT", hint: "Excludes records containing the term" },
      ],
    },
  ];

  var ADV_GROUPS = [
    {
      label: "Date Limits (yr:)", color: "#16a34a", kind: "filter",
      items: [
        { id: "YR_FROM",   ccl: "yr", label: "Year From",   hint: "e.g. 2005  =>  yr,st-numeric>=2005" },
        { id: "YR_TO",     ccl: "yr", label: "Year To",     hint: "e.g. 2010  =>  yr,st-numeric<=2010" },
        { id: "YR_RANGE",  ccl: "yr", label: "Year Range",  hint: "e.g. 2005-2010" },
        { id: "YR_AFTER",  ccl: "yr", label: "Year After",  hint: "e.g. >2005 (excluding 2005)" },
        { id: "YR_BEFORE", ccl: "yr", label: "Year Before", hint: "e.g. <2010 (excluding 2010)" },
      ],
    },
    {
      label: "Language (ln:)", color: "#0891b2", kind: "filter",
      items: [
        { id: "LN", ccl: "ln", label: "Language", hint: "3-letter ISO 639-2. e.g. eng  fre  mal  ara  hin" },
      ],
    },
    {
      label: "Item Type (itype:)", color: "#7c3aed", kind: "filter",
      items: [
        { id: "IT_BK",  ccl: "itype", label: "Books (BK)",    hint: "itype:BK" },
        { id: "IT_SR",  ccl: "itype", label: "Audio (SR)",    hint: "itype:SR" },
        { id: "IT_VR",  ccl: "itype", label: "Video (VR)",    hint: "itype:VR" },
        { id: "IT_CF",  ccl: "itype", label: "Digital (CF)",  hint: "itype:CF" },
        { id: "IT_SER", ccl: "itype", label: "Serials (SER)", hint: "itype:SER" },
        { id: "IT_KT",  ccl: "itype", label: "Kit (KT)",      hint: "itype:KT" },
      ],
    },
    {
      label: "Format (l-format:)", color: "#b45309", kind: "filter",
      items: [
        { id: "FMT_TA", ccl: "l-format", label: "Regular Print", hint: "l-format:ta" },
        { id: "FMT_TB", ccl: "l-format", label: "Large Print",   hint: "l-format:tb" },
        { id: "FMT_FK", ccl: "l-format", label: "Braille",       hint: "l-format:fk" },
        { id: "FMT_SD", ccl: "l-format", label: "CD Audio",      hint: "l-format:sd" },
        { id: "FMT_VD", ccl: "l-format", label: "DVD Video",     hint: "l-format:vd" },
        { id: "FMT_CR", ccl: "l-format", label: "Website",       hint: "l-format:cr" },
      ],
    },
    {
      label: "Audience (aud:)", color: "#ea580c", kind: "filter",
      items: [
        { id: "AUD_A", ccl: "aud", label: "Preschool",      hint: "aud:a" },
        { id: "AUD_B", ccl: "aud", label: "Primary",        hint: "aud:b" },
        { id: "AUD_C", ccl: "aud", label: "Pre-Adolescent", hint: "aud:c" },
        { id: "AUD_D", ccl: "aud", label: "Adolescent",     hint: "aud:d" },
        { id: "AUD_E", ccl: "aud", label: "Adult",          hint: "aud:e" },
        { id: "AUD_J", ccl: "aud", label: "Juvenile",       hint: "aud:j" },
      ],
    },
    {
      label: "Content (fic/bio:)", color: "#be185d", kind: "filter",
      items: [
        { id: "FIC_1", ccl: "fic", label: "Fiction",     hint: "fic:1" },
        { id: "FIC_0", ccl: "fic", label: "Non-Fiction", hint: "fic:0" },
        { id: "BIO_B", ccl: "bio", label: "Biography",   hint: "bio:b" },
      ],
    },
    {
      label: "Availability", color: "#16a34a", kind: "filter",
      items: [
        { id: "AVAIL", ccl: "onloan", label: "Available Only", hint: "Items not currently checked out" },
      ],
    },
    {
      label: "Sort Order", color: "#64748b", kind: "sort",
      items: [
        { id: "SORT_REL",  ccl: "relevance",   label: "Relevance",    hint: "Default — best match first" },
        { id: "SORT_TTL",  ccl: "title_az",    label: "Title A-Z",    hint: "Alphabetical by title" },
        { id: "SORT_AUT",  ccl: "author_az",   label: "Author A-Z",   hint: "Alphabetical by author" },
        { id: "SORT_DATE", ccl: "date_desc",   label: "Newest First", hint: "Publication date descending" },
        { id: "SORT_POP",  ccl: "popularity",  label: "Popularity",   hint: "Most borrowed first" },
      ],
    },
  ];

  var ALL_GROUPS = CORE_GROUPS.concat(ADV_GROUPS);
  var BLOCK_META = {};
  ALL_GROUPS.forEach(function (g) {
    g.items.forEach(function (item) {
      BLOCK_META[item.id] = { color: g.color, kind: g.kind, ccl: item.ccl, label: item.label, hint: item.hint };
    });
  });

  /* Fixed value blocks — no user input, add on click */
  var FIXED_VALUE = {
    IT_BK:"BK", IT_SR:"SR", IT_VR:"VR", IT_CF:"CF", IT_SER:"SER", IT_KT:"KT",
    FMT_TA:"ta", FMT_TB:"tb", FMT_FK:"fk", FMT_SD:"sd", FMT_VD:"vd", FMT_CR:"cr",
    AUD_A:"a", AUD_B:"b", AUD_C:"c", AUD_D:"d", AUD_E:"e", AUD_J:"j",
    FIC_1:"1", FIC_0:"0", BIO_B:"b",
    AVAIL:"false",
    SORT_REL:"relevance", SORT_TTL:"title_az", SORT_AUT:"author_az",
    SORT_DATE:"date_desc", SORT_POP:"popularity",
  };

  var YEAR_IDS = { YR_FROM:1, YR_TO:1, YR_RANGE:1, YR_AFTER:1, YR_BEFORE:1 };

  /* ── Missions ────────────────────────────────────────────────── */

  var MISSIONS = [
    { id: "first_run",    emoji: "🎯", title: "First Quest",      desc: "Run your first search",                 pts: 100 },
    { id: "use_and",      emoji: "🔗", title: "Boolean AND",      desc: "Combine terms with AND",                pts: 150 },
    { id: "use_not",      emoji: "🚫", title: "Exclude Expert",   desc: "Use NOT to exclude a term",             pts: 200 },
    { id: "use_or",       emoji: "↔️", title: "Either/Or",        desc: "Use OR for alternatives",               pts: 175 },
    { id: "use_phrase",   emoji: "💬", title: "Phrase Master",    desc: "Search an exact phrase (ti,phr etc.)",  pts: 175 },
    { id: "use_isbn",     emoji: "🔢", title: "ISBN Hunter",      desc: "Search by ISBN (nb=)",                  pts: 150 },
    { id: "use_filter",   emoji: "🔧", title: "Filter Wizard",    desc: "Apply a Year, Language or Format limit", pts: 175 },
    { id: "use_audience", emoji: "👥", title: "Audience Aware",   desc: "Use an Audience (aud:) filter",         pts: 175 },
    { id: "use_geo",      emoji: "🌍", title: "Globe Trotter",    desc: "Use Geographic Subject (su-geo)",        pts: 200 },
    { id: "five_blocks",  emoji: "🧱", title: "Block Builder",    desc: "Build a query with 5 or more blocks",   pts: 250 },
    { id: "use_callnum",  emoji: "📋", title: "Shelf Ranger",     desc: "Search by Call Number (callnum=)",      pts: 200 },
    { id: "use_keyword",  emoji: "🔑", title: "Keyword Keen",     desc: "Use the Keyword (kw) index",            pts: 100 },
  ];

  /* ── Ranks ───────────────────────────────────────────────────── */

  var RANKS = [
    { name: "Novice",          min: 0,    emoji: "📖" },
    { name: "Card Searcher",   min: 150,  emoji: "🔎" },
    { name: "Stack Explorer",  min: 400,  emoji: "🗺️" },
    { name: "Reference Pro",   min: 800,  emoji: "📊" },
    { name: "Boolean Knight",  min: 1400, emoji: "⚔️" },
    { name: "CCL Wizard",      min: 2000, emoji: "🧙" },
    { name: "Grand Librarian", min: 2800, emoji: "👑" },
  ];

  /* ── State ───────────────────────────────────────────────────── */

  var state = {
    blocks:       [],
    selectedType: null,
    inputVal:     "",
    phraseMode:   false,
    activeTab:    0,
    score:        0,
    searches:     0,
    missions:     MISSIONS.map(function (m) { return Object.assign({}, m, { done: false }); }),
    lastQuery:    "",
    toastTimer:   null,
    flashTimer:   null,
  };

  var el = {};

  /* ── Helpers ─────────────────────────────────────────────────── */

  function uid() { return Math.random().toString(36).slice(2) + Date.now().toString(36); }

  function getRank(pts) {
    var r = RANKS[0];
    for (var i = 0; i < RANKS.length; i++) { if (pts >= RANKS[i].min) r = RANKS[i]; }
    return r;
  }
  function getNextRank(pts) {
    for (var i = 0; i < RANKS.length; i++) { if (RANKS[i].min > pts) return RANKS[i]; }
    return null;
  }

  function yearCCL(typeId, val) {
    val = (val || "").trim();
    if (typeId === "YR_FROM")   return "yr,st-numeric>=" + val;
    if (typeId === "YR_TO")     return "yr,st-numeric<=" + val;
    if (typeId === "YR_RANGE")  return "yr=" + val;
    if (typeId === "YR_AFTER")  return "yr,st-numeric>" + val;
    if (typeId === "YR_BEFORE") return "yr,st-numeric<" + val;
    return "yr=" + val;
  }

  /* ── Display query (human readable) ─────────────────────────── */

  function buildDisplayQuery(blocks) {
    var parts = [];
    blocks.forEach(function (b) {
      var meta = BLOCK_META[b.type];
      if (!meta) return;
      if (meta.kind === "operator") { parts.push(b.value.toUpperCase()); return; }
      if (meta.kind === "sort")     { return; }
      if (meta.kind === "filter") {
        if (YEAR_IDS[b.type]) { parts.push(yearCCL(b.type, b.value)); return; }
        if (b.type === "AVAIL") { parts.push("onloan:false"); return; }
        if (b.type === "LN")    { parts.push("ln=" + b.value.slice(0,3).toLowerCase()); return; }
        // itype/format/aud/fic/bio shown as &limit — omit from q= display
        return;
      }
      var expr = b.phrase ? meta.ccl + ",phr=" + b.value : meta.ccl + "=" + b.value;
      parts.push(expr);
    });
    return parts.join(" ");
  }

  /* ── OPAC redirect URL ───────────────────────────────────────── */

  function buildRedirectURL(blocks) {
    var qParts = [];
    var limits  = [];
    var sortBy  = "";

    blocks.forEach(function (b) {
      var meta = BLOCK_META[b.type];
      if (!meta) return;

      if (meta.kind === "operator") { qParts.push(b.value.toLowerCase()); return; }
      if (meta.kind === "sort")     { sortBy = b.value; return; }

      if (meta.kind === "filter") {
        if (YEAR_IDS[b.type]) { qParts.push(yearCCL(b.type, b.value)); return; }
        if (b.type === "AVAIL")  { limits.push("available"); return; }
        if (b.type === "LN")     { limits.push("ln:" + b.value.slice(0,3).toLowerCase()); return; }
        var fv = FIXED_VALUE[b.type];
        if (!fv) return;
        if (b.type.slice(0,3) === "IT_")  { limits.push("mc-itype:" + fv); return; }
        if (b.type.slice(0,4) === "FMT_") { limits.push("l-format:" + fv); return; }
        if (b.type.slice(0,4) === "AUD_") { limits.push("aud:" + fv); return; }
        if (b.type === "FIC_1" || b.type === "FIC_0") { limits.push("fic:" + fv); return; }
        if (b.type === "BIO_B") { limits.push("bio:b"); return; }
        return;
      }

      // index block
      qParts.push(b.phrase ? meta.ccl + ",phr=" + b.value : meta.ccl + "=" + b.value);
    });

    var url = "/cgi-bin/koha/opac-search.pl?q=" + encodeURIComponent(qParts.join(" "));
    limits.forEach(function (l) { url += "&limit=" + encodeURIComponent(l); });
    if (sortBy) url += "&sort_by=" + encodeURIComponent(sortBy);
    return url;
  }

  /* ── Render functions ────────────────────────────────────────── */

  function renderTabs() {
    el.tabCore.classList.toggle("active", state.activeTab === 0);
    el.tabAdv.classList.toggle("active",  state.activeTab === 1);
    el.chipContainer.innerHTML = "";
    var groups = state.activeTab === 0 ? CORE_GROUPS : ADV_GROUPS;
    groups.forEach(function (g) {
      var section = document.createElement("div");
      var lbl = document.createElement("div");
      lbl.className = "ksq-group-label";
      lbl.textContent = g.label;
      section.appendChild(lbl);
      var row = document.createElement("div");
      row.className = "ksq-chip-row";
      g.items.forEach(function (item) {
        var btn = document.createElement("button");
        btn.className = "ksq-chip";
        btn.textContent = item.label;
        btn.title = item.hint;
        btn.style.borderColor = g.color;
        if (state.selectedType === item.id) {
          btn.style.background = "#fff";
          btn.style.color = g.color;
        } else {
          btn.style.background = g.color;
          btn.style.color = "#fff";
        }
        btn.addEventListener("click", function () { pickType(item.id); });
        row.appendChild(btn);
      });
      section.appendChild(row);
      el.chipContainer.appendChild(section);
    });
  }

  function renderInputBox() {
    var type = state.selectedType;
    if (!type) { el.inputBox.classList.remove("ksq-visible"); return; }
    var meta = BLOCK_META[type];
    if (!meta) { el.inputBox.classList.remove("ksq-visible"); return; }
    if (FIXED_VALUE[type] !== undefined) { el.inputBox.classList.remove("ksq-visible"); return; }

    el.inputBox.classList.add("ksq-visible");
    el.inputBox.style.borderColor    = meta.color;
    el.inputTypeLabel.textContent    = meta.label.toUpperCase() + " VALUE";
    el.inputTypeLabel.style.color    = meta.color;
    el.inputHint.textContent         = meta.hint || "";
    el.inputField.placeholder        = meta.hint || "Enter value…";
    el.inputField.value              = state.inputVal;

    var supportsPhrase = meta.kind === "index" &&
      ["KW","TI","AU","SU","SUGEO","SUNA"].indexOf(type) !== -1;
    el.phraseRow.style.display = supportsPhrase ? "flex" : "none";
    el.phraseCheck.checked = state.phraseMode;

    var hasVal = state.inputVal.trim().length > 0;
    el.addBtn.style.background = hasVal ? meta.color : "#e2e8f0";
    el.addBtn.style.color      = hasVal ? "#fff" : "#94a3b8";
    el.addBtn.style.cursor     = hasVal ? "pointer" : "not-allowed";
    el.inputField.focus();
  }

  function renderQueryDrop() {
    el.queryDrop.innerHTML = "";
    if (!state.blocks.length) {
      var ph = document.createElement("span");
      ph.className = "ksq-query-placeholder";
      ph.textContent = "Click blocks on the left to build your Koha CCL query…";
      el.queryDrop.appendChild(ph);
      return;
    }
    state.blocks.forEach(function (block, i) {
      var wrap = document.createElement("span");
      wrap.className = "ksq-block-wrap";
      if (i > 0) {
        var arrow = document.createElement("span");
        arrow.className = "ksq-block-arrow";
        arrow.textContent = "→";
        wrap.appendChild(arrow);
      }
      var meta = BLOCK_META[block.type] || { color: "#64748b", label: block.type };
      var pill = document.createElement("span");
      pill.className = "ksq-block-pill" + (block.phrase ? " phrase-mode" : "");
      pill.style.background = meta.color;

      var typeSpan = document.createElement("span");
      typeSpan.className = "ksq-block-type";
      typeSpan.textContent = meta.label || block.type;

      var valSpan = document.createElement("span");
      valSpan.className = "ksq-block-value";
      valSpan.textContent = block.value;

      pill.appendChild(typeSpan);
      pill.appendChild(valSpan);

      if (block.phrase) {
        var modSpan = document.createElement("span");
        modSpan.className = "ksq-block-modifier";
        modSpan.textContent = "phrase";
        pill.appendChild(modSpan);
      }

      var removeBtn = document.createElement("button");
      removeBtn.className = "ksq-block-remove";
      removeBtn.textContent = "×";
      removeBtn.setAttribute("aria-label", "Remove block");
      (function (id) {
        removeBtn.addEventListener("click", function () { removeBlock(id); });
      }(block.id));
      pill.appendChild(removeBtn);

      wrap.appendChild(pill);
      el.queryDrop.appendChild(wrap);
    });
  }

  function renderRunBtn() {
    el.runBtn.disabled = state.blocks.length === 0;
    el.runBtn.textContent = "🔍 Search My Library";
  }

  function renderMissions() {
    el.missionList.innerHTML = "";
    state.missions.forEach(function (m) {
      var row = document.createElement("div");
      row.className = "ksq-mission-row" + (m.done ? " done" : "");
      var icon = document.createElement("span");
      icon.className = "ksq-mission-icon";
      icon.textContent = m.done ? "✅" : m.emoji;
      var info = document.createElement("div");
      var title = document.createElement("div");
      title.className = "ksq-mission-title" + (m.done ? " done" : "");
      title.textContent = m.title;
      var desc = document.createElement("div");
      desc.className = "ksq-mission-desc";
      desc.textContent = m.desc + " · +" + m.pts + " pts";
      info.appendChild(title);
      info.appendChild(desc);
      row.appendChild(icon);
      row.appendChild(info);
      el.missionList.appendChild(row);
    });
  }

  function renderRankProgress() {
    var rank  = getRank(state.score);
    var nRank = getNextRank(state.score);
    var pct   = nRank ?
      Math.min(100, Math.round(((state.score - rank.min) / (nRank.min - rank.min)) * 100)) :
      100;
    el.rankVal.textContent       = rank.emoji + " " + rank.name;
    el.scoreVal.textContent      = state.score;
    el.progressFill.style.width  = pct + "%";
    el.progressLabel.textContent = nRank ?
      state.score + " / " + nRank.min + " → " + nRank.emoji + " " + nRank.name :
      "👑 Grand Librarian — Max rank reached!";
  }

  function renderResults() {
    el.results.innerHTML = "";

    if (!state.blocks.length) {
      var empty = document.createElement("div");
      empty.className = "ksq-empty-state";
      empty.innerHTML =
        '<div class="ksq-empty-icon">🔍</div>' +
        '<div class="ksq-empty-title">Your next discovery awaits</div>' +
        '<div class="ksq-empty-sub">Build a CCL query with the blocks on the left,<br>' +
        'then hit <strong>Search My Library</strong> to open Koha\'s results page.</div>';
      el.results.appendChild(empty);
      return;
    }

    var wrap = document.createElement("div");
    wrap.className = "ksq-preview-wrap";

    var lbl = document.createElement("div");
    lbl.className = "ksq-preview-label";
    lbl.textContent = "🧪 Live Query Preview";
    wrap.appendChild(lbl);

    // CCL banner
    var cclBox = document.createElement("div");
    cclBox.className = "ksq-query-banner";
    var cclLbl = document.createElement("span");
    cclLbl.className = "ksq-query-banner-label";
    cclLbl.textContent = "KOHA CCL:";
    var cclVal = document.createElement("span");
    cclVal.className = "ksq-query-banner-val";
    cclVal.textContent = buildDisplayQuery(state.blocks) || "—";
    cclBox.appendChild(cclLbl);
    cclBox.appendChild(cclVal);
    wrap.appendChild(cclBox);

    // URL banner
    var urlBox = document.createElement("div");
    urlBox.className = "ksq-query-banner ksq-url-box";
    var urlLbl = document.createElement("span");
    urlLbl.className = "ksq-query-banner-label";
    urlLbl.textContent = "OPAC URL:";
    var urlVal = document.createElement("span");
    urlVal.className = "ksq-query-banner-val";
    urlVal.textContent = buildRedirectURL(state.blocks);
    urlBox.appendChild(urlLbl);
    urlBox.appendChild(urlVal);
    wrap.appendChild(urlBox);

    // Explain grid
    var indexB  = state.blocks.filter(function (b) { return BLOCK_META[b.type] && BLOCK_META[b.type].kind === "index"; });
    var opB     = state.blocks.filter(function (b) { return BLOCK_META[b.type] && BLOCK_META[b.type].kind === "operator"; });
    var filterB = state.blocks.filter(function (b) { return BLOCK_META[b.type] && BLOCK_META[b.type].kind === "filter"; });
    var sortB   = state.blocks.filter(function (b) { return BLOCK_META[b.type] && BLOCK_META[b.type].kind === "sort"; });

    function explainCard(icon, heading, blocks) {
      var card = document.createElement("div");
      card.className = "ksq-explain-card";
      var head = document.createElement("div");
      head.className = "ksq-explain-head";
      head.textContent = icon + " " + heading;
      card.appendChild(head);
      blocks.forEach(function (b) {
        var meta = BLOCK_META[b.type];
        var row  = document.createElement("div");
        row.className = "ksq-explain-row";
        var tag = document.createElement("span");
        tag.className = "ksq-explain-tag";
        tag.style.background = meta ? meta.color : "#64748b";
        tag.textContent = meta ? meta.ccl : b.type;
        var arr = document.createElement("span");
        arr.className = "ksq-explain-arrow";
        arr.textContent = "→";
        var val = document.createElement("span");
        val.className = "ksq-explain-val";
        val.textContent = b.value;
        row.appendChild(tag); row.appendChild(arr); row.appendChild(val);
        if (b.phrase) {
          var mod = document.createElement("span");
          mod.className = "ksq-explain-modifier";
          mod.textContent = "(phrase)";
          row.appendChild(mod);
        }
        card.appendChild(row);
      });
      return card;
    }

    var grid = document.createElement("div");
    grid.className = "ksq-explain-grid";
    if (indexB.length)  grid.appendChild(explainCard("🔵", "Index Search", indexB));
    if (opB.length)     grid.appendChild(explainCard("🟠", "Operators",    opB));
    if (filterB.length) grid.appendChild(explainCard("🟢", "Limits",       filterB));
    if (sortB.length)   grid.appendChild(explainCard("⚫", "Sort",         sortB));
    wrap.appendChild(grid);

    // CCL quick ref
    var cclRef = document.createElement("div");
    cclRef.className = "ksq-ccl-ref";
    cclRef.innerHTML =
      '<div class="ksq-ccl-ref-title">📖 Koha CCL Quick Reference</div>' +
      '<div class="ksq-ccl-ref-grid">' +
      '<div class="ksq-ccl-ref-row"><code>ti=hamlet</code> Title</div>' +
      '<div class="ksq-ccl-ref-row"><code>au=rowling</code> Author</div>' +
      '<div class="ksq-ccl-ref-row"><code>su=poetry</code> Subject</div>' +
      '<div class="ksq-ccl-ref-row"><code>kw=marlin</code> Keyword</div>' +
      '<div class="ksq-ccl-ref-row"><code>pb=penguin</code> Publisher</div>' +
      '<div class="ksq-ccl-ref-row"><code>nb=9780140…</code> ISBN</div>' +
      '<div class="ksq-ccl-ref-row"><code>ln=eng</code> Language</div>' +
      '<div class="ksq-ccl-ref-row"><code>su-geo=wales</code> Geo Subject</div>' +
      '<div class="ksq-ccl-ref-row"><code>itype:BK</code> Item Type</div>' +
      '<div class="ksq-ccl-ref-row"><code>l-format:ta</code> Format</div>' +
      '<div class="ksq-ccl-ref-row"><code>aud:e</code> Adult Audience</div>' +
      '<div class="ksq-ccl-ref-row"><code>fic:1</code> Fiction</div>' +
      '<div class="ksq-ccl-ref-row"><code>yr,st-numeric>=2005</code> Year from</div>' +
      '<div class="ksq-ccl-ref-row"><code>yr=2005-2010</code> Year range</div>' +
      '</div>';
    wrap.appendChild(cclRef);

    // ES syntax ref
    var esRef = document.createElement("div");
    esRef.className = "ksq-es-ref";
    esRef.innerHTML =
      '<div class="ksq-es-ref-title">⚡ Elasticsearch Advanced Syntax (if enabled)</div>' +
      '<div class="ksq-es-ref-row"><code>wierd~</code> Fuzzy — finds "weird", "wired"</div>' +
      '<div class="ksq-es-ref-row"><code>c?t</code> Single wildcard — "cat", "cut"</div>' +
      '<div class="ksq-es-ref-row"><code>cat*</code> Multi wildcard — "cats", "catalog"</div>' +
      '<div class="ksq-es-ref-row"><code>"Pete the cat"</code> Exact phrase in quotes</div>' +
      '<div class="ksq-es-ref-row"><code>fantasy -romance</code> Minus excludes term</div>';
    wrap.appendChild(esRef);

    if (state.lastQuery) {
      var lastWrap = document.createElement("div");
      lastWrap.className = "ksq-last-query";
      lastWrap.innerHTML = '⏱ Last search sent: <code>' + state.lastQuery + '</code>';
      wrap.appendChild(lastWrap);
    }

    el.results.appendChild(wrap);
  }

  function renderAll() {
    renderTabs();
    renderInputBox();
    renderQueryDrop();
    renderRunBtn();
    renderMissions();
    renderRankProgress();
    renderResults();
  }

  /* ── Toast / flash ───────────────────────────────────────────── */

  function showToast(msg) {
    el.toast.textContent = "🏆 " + msg;
    el.toast.classList.add("ksq-visible");
    if (state.toastTimer) clearTimeout(state.toastTimer);
    state.toastTimer = setTimeout(function () { el.toast.classList.remove("ksq-visible"); }, 4500);
  }

  function showScoreFlash(txt) {
    el.scoreFlash.textContent = txt;
    el.scoreFlash.classList.remove("ksq-anim");
    void el.scoreFlash.offsetWidth;
    el.scoreFlash.classList.add("ksq-anim");
    if (state.flashTimer) clearTimeout(state.flashTimer);
    state.flashTimer = setTimeout(function () { el.scoreFlash.classList.remove("ksq-anim"); }, 2100);
  }

  /* ── Actions ─────────────────────────────────────────────────── */

  function pickType(typeId) {
    var meta = BLOCK_META[typeId];
    if (!meta) return;
    if (meta.kind === "operator" || FIXED_VALUE[typeId] !== undefined) {
      var val = FIXED_VALUE[typeId] !== undefined ? FIXED_VALUE[typeId] : meta.ccl;
      state.blocks.push({ id: uid(), type: typeId, value: val });
      state.selectedType = null;
      state.inputVal     = "";
      state.phraseMode   = false;
      renderAll();
      return;
    }
    state.selectedType = typeId;
    state.inputVal     = "";
    state.phraseMode   = false;
    renderAll();
  }

  function commitBlock() {
    if (!state.selectedType || !state.inputVal.trim()) return;
    state.blocks.push({ id: uid(), type: state.selectedType, value: state.inputVal.trim(), phrase: state.phraseMode });
    state.selectedType = null;
    state.inputVal     = "";
    state.phraseMode   = false;
    renderAll();
  }

  function removeBlock(id) {
    state.blocks = state.blocks.filter(function (b) { return b.id !== id; });
    renderAll();
  }

  function clearAll() {
    state.blocks = []; state.selectedType = null; state.inputVal = ""; state.phraseMode = false;
    renderAll();
  }

  function runSearch() {
    if (!state.blocks.length) return;
    var types  = state.blocks.map(function (b) { return b.type; });
    var earned = 50;

    state.searches += 1;
    state.missions = state.missions.map(function (m) {
      if (m.done) return m;
      var pass =
        (m.id === "first_run"    && state.searches >= 1) ||
        (m.id === "use_and"      && types.indexOf("AND")    !== -1) ||
        (m.id === "use_not"      && types.indexOf("NOT")    !== -1) ||
        (m.id === "use_or"       && types.indexOf("OR")     !== -1) ||
        (m.id === "use_phrase"   && state.blocks.some(function (b) { return b.phrase; })) ||
        (m.id === "use_isbn"     && types.indexOf("NB")     !== -1) ||
        (m.id === "use_keyword"  && types.indexOf("KW")     !== -1) ||
        (m.id === "use_geo"      && types.indexOf("SUGEO")  !== -1) ||
        (m.id === "use_callnum"  && types.indexOf("CALLNUM")!== -1) ||
        (m.id === "use_audience" && types.some(function (t) { return t.slice(0,4) === "AUD_"; })) ||
        (m.id === "use_filter"   && types.some(function (t) {
          return YEAR_IDS[t] || t === "LN" || t.slice(0,4) === "FMT_";
        })) ||
        (m.id === "five_blocks"  && state.blocks.length >= 5);
      if (pass) { earned += m.pts; showToast(m.emoji + " Mission: " + m.title + "! +" + m.pts + " pts"); }
      return Object.assign({}, m, { done: m.done || pass });
    });

    state.score    += earned;
    state.lastQuery = buildDisplayQuery(state.blocks);
    showScoreFlash("+" + earned);

    try {
      sessionStorage.setItem("ksq_score",    state.score);
      sessionStorage.setItem("ksq_searches", state.searches);
      sessionStorage.setItem("ksq_missions", JSON.stringify(
        state.missions.map(function (m) { return { id: m.id, done: m.done }; })
      ));
    } catch (e) {}

    renderAll();
    var url = buildRedirectURL(state.blocks);
    setTimeout(function () { window.location.href = url; }, 650);
  }

  /* ── Build DOM ───────────────────────────────────────────────── */

  function buildPanel() {
    var overlay = document.createElement("div");
    overlay.id  = "ksq-overlay";
    var root    = document.createElement("div");
    root.id     = "ksq-root";
    root.setAttribute("role","dialog");
    root.setAttribute("aria-modal","true");
    root.setAttribute("aria-label","Koha Search Quest");

    /* Header */
    var header = document.createElement("header");
    header.className = "ksq-header";
    var brand = document.createElement("div");
    brand.className = "ksq-header-brand";
    brand.innerHTML = '<span>📚</span><span>koha. <span class="sub">SEARCH QUEST</span></span>';
    var headerRight = document.createElement("div");
    headerRight.className = "ksq-header-right";

    var rankWrap = document.createElement("div");
    rankWrap.className = "ksq-stat-block";
    var rankLbl = document.createElement("div");
    rankLbl.className = "ksq-stat-label";
    rankLbl.textContent = "RANK";
    el.rankVal = document.createElement("div");
    el.rankVal.className = "ksq-rank-val";
    rankWrap.appendChild(rankLbl);
    rankWrap.appendChild(el.rankVal);

    var scoreWrap = document.createElement("div");
    scoreWrap.className = "ksq-score-wrap";
    var scoreLbl = document.createElement("div");
    scoreLbl.className = "ksq-stat-label";
    scoreLbl.textContent = "SCORE";
    el.scoreVal = document.createElement("div");
    el.scoreVal.className = "ksq-score-val";
    el.scoreFlash = document.createElement("div");
    el.scoreFlash.className = "ksq-score-flash";
    scoreWrap.appendChild(scoreLbl);
    scoreWrap.appendChild(el.scoreVal);
    scoreWrap.appendChild(el.scoreFlash);

    var closeBtn = document.createElement("button");
    closeBtn.className = "ksq-close-btn";
    closeBtn.textContent = "✕";
    closeBtn.setAttribute("aria-label","Close");
    closeBtn.addEventListener("click", function () { overlay.classList.remove("ksq-open"); });

    headerRight.appendChild(rankWrap);
    headerRight.appendChild(scoreWrap);
    headerRight.appendChild(closeBtn);
    header.appendChild(brand);
    header.appendChild(headerRight);

    el.toast = document.createElement("div");
    el.toast.className = "ksq-toast";

    var body = document.createElement("div");
    body.className = "ksq-body";

    /* Sidebar */
    var sidebar = document.createElement("aside");
    sidebar.className = "ksq-sidebar";

    var tabStrip = document.createElement("div");
    tabStrip.className = "ksq-tab-strip";
    el.tabCore = document.createElement("button");
    el.tabCore.className = "ksq-tab-btn active";
    el.tabCore.textContent = "Core Indexes";
    el.tabAdv  = document.createElement("button");
    el.tabAdv.className  = "ksq-tab-btn";
    el.tabAdv.textContent = "Advanced";
    el.tabCore.addEventListener("click", function () { state.activeTab=0; state.selectedType=null; renderAll(); });
    el.tabAdv.addEventListener("click",  function () { state.activeTab=1; state.selectedType=null; renderAll(); });
    tabStrip.appendChild(el.tabCore);
    tabStrip.appendChild(el.tabAdv);
    sidebar.appendChild(tabStrip);

    el.chipContainer = document.createElement("div");
    sidebar.appendChild(el.chipContainer);

    /* Input box */
    el.inputBox = document.createElement("div");
    el.inputBox.className = "ksq-input-box";
    el.inputTypeLabel = document.createElement("div");
    el.inputTypeLabel.className = "ksq-input-type-label";
    el.inputField = document.createElement("input");
    el.inputField.className = "ksq-input-field";
    el.inputField.type = "text";
    el.inputField.addEventListener("input", function () { state.inputVal = el.inputField.value; renderInputBox(); });
    el.inputField.addEventListener("keydown", function (e) { if (e.key === "Enter") commitBlock(); });
    el.inputHint = document.createElement("div");
    el.inputHint.className = "ksq-input-hint";
    el.phraseRow = document.createElement("div");
    el.phraseRow.className = "ksq-phrase-row";
    el.phraseRow.style.display = "none";
    el.phraseCheck = document.createElement("input");
    el.phraseCheck.type = "checkbox";
    el.phraseCheck.id   = "ksq-phrase-chk";
    el.phraseCheck.addEventListener("change", function () { state.phraseMode = el.phraseCheck.checked; });
    var phraseLabel = document.createElement("label");
    phraseLabel.htmlFor = "ksq-phrase-chk";
    phraseLabel.textContent = "Exact phrase (,phr=)";
    el.phraseRow.appendChild(el.phraseCheck);
    el.phraseRow.appendChild(phraseLabel);
    el.addBtn = document.createElement("button");
    el.addBtn.className = "ksq-add-btn";
    el.addBtn.textContent = "+ ADD BLOCK";
    el.addBtn.addEventListener("click", commitBlock);
    el.inputBox.appendChild(el.inputTypeLabel);
    el.inputBox.appendChild(el.inputField);
    el.inputBox.appendChild(el.inputHint);
    el.inputBox.appendChild(el.phraseRow);
    el.inputBox.appendChild(el.addBtn);
    sidebar.appendChild(el.inputBox);

    /* Missions */
    var missionSec = document.createElement("div");
    missionSec.className = "ksq-section-divider";
    var missionLbl = document.createElement("div");
    missionLbl.className = "ksq-group-label";
    missionLbl.textContent = "🎮 Missions";
    el.missionList = document.createElement("div");
    missionSec.appendChild(missionLbl);
    missionSec.appendChild(el.missionList);
    sidebar.appendChild(missionSec);

    /* Rank progress */
    var rankSec = document.createElement("div");
    rankSec.className = "ksq-section-divider";
    var rankSecLbl = document.createElement("div");
    rankSecLbl.className = "ksq-group-label";
    rankSecLbl.textContent = "NEXT RANK";
    var progressBg = document.createElement("div");
    progressBg.className = "ksq-progress-bar-bg";
    el.progressFill = document.createElement("div");
    el.progressFill.className = "ksq-progress-bar-fill";
    el.progressFill.style.width = "0%";
    progressBg.appendChild(el.progressFill);
    el.progressLabel = document.createElement("div");
    el.progressLabel.className = "ksq-progress-label";
    rankSec.appendChild(rankSecLbl);
    rankSec.appendChild(progressBg);
    rankSec.appendChild(el.progressLabel);
    sidebar.appendChild(rankSec);

    var tip = document.createElement("div");
    tip.className = "ksq-tip";
    tip.textContent = "💡 Core: indexes & booleans. Advanced: dates, language, item type, format, audience & sort. Fixed blocks add instantly — no typing needed.";
    sidebar.appendChild(tip);

    /* Main */
    var main = document.createElement("main");
    main.className = "ksq-main";
    var builder = document.createElement("div");
    builder.className = "ksq-builder";
    var builderTitle = document.createElement("div");
    builderTitle.className = "ksq-builder-title";
    builderTitle.textContent = "🔨 CCL Query Builder";
    el.queryDrop = document.createElement("div");
    el.queryDrop.className = "ksq-query-drop";
    var actions = document.createElement("div");
    actions.className = "ksq-actions";
    var clearBtn = document.createElement("button");
    clearBtn.className = "ksq-btn-clear";
    clearBtn.textContent = "🗑 Clear";
    clearBtn.addEventListener("click", clearAll);
    el.runBtn = document.createElement("button");
    el.runBtn.className = "ksq-btn-run";
    el.runBtn.textContent = "🔍 Search My Library";
    el.runBtn.addEventListener("click", runSearch);
    actions.appendChild(clearBtn);
    actions.appendChild(el.runBtn);
    builder.appendChild(builderTitle);
    builder.appendChild(el.queryDrop);
    builder.appendChild(actions);
    el.results = document.createElement("div");
    el.results.className = "ksq-results";
    main.appendChild(builder);
    main.appendChild(el.results);

    body.appendChild(sidebar);
    body.appendChild(main);
    root.appendChild(header);
    root.appendChild(el.toast);
    root.appendChild(body);
    overlay.appendChild(root);

    overlay.addEventListener("click", function (e) { if (e.target===overlay) overlay.classList.remove("ksq-open"); });
    document.addEventListener("keydown", function (e) { if (e.key==="Escape") overlay.classList.remove("ksq-open"); });
    return overlay;
  }

  function buildLauncher(overlay) {
    var btn = document.createElement("button");
    btn.id  = "ksq-launcher";
    btn.innerHTML = "<span>📚</span><span>Search Quest</span>";
    btn.setAttribute("aria-label","Open Search Quest");
    btn.addEventListener("click", function () { overlay.classList.add("ksq-open"); });
    return btn;
  }

  /* ── Init ────────────────────────────────────────────────────── */

  function init() {
    try {
      var sc = sessionStorage.getItem("ksq_score");
      var se = sessionStorage.getItem("ksq_searches");
      var sm = sessionStorage.getItem("ksq_missions");
      if (sc) state.score    = parseInt(sc, 10) || 0;
      if (se) state.searches = parseInt(se, 10) || 0;
      if (sm) {
        var dm = {};
        JSON.parse(sm).forEach(function (m) { dm[m.id] = m.done; });
        state.missions = state.missions.map(function (m) { return Object.assign({}, m, { done: !!dm[m.id] }); });
      }
    } catch (e) {}

    var overlay  = buildPanel();
    var launcher = buildLauncher(overlay);
    document.body.appendChild(overlay);
    document.body.appendChild(launcher);
    renderAll();
  }

  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", init);
  } else {
    init();
  }

}());

    </script>






</body>
</html>


