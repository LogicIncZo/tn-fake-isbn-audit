

































<!DOCTYPE html>
<!-- TEMPLATE FILE: opac-main.tt -->









<html lang="en" class="no-js">
<head>

<title>Koha online catalog</title>


<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="generator" content="Koha 23.0504000" /> <!-- leave this for stats -->
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link href="/opac-tmpl/bootstrap/lib/jquery/responsive.dataTables.min_23.0504000.css" type="text/css" rel="stylesheet">

<link rel="shortcut icon" href="/opac-tmpl/bootstrap/images/favicon.ico" type="image/x-icon" />
<link rel="apple-touch-icon" href="/opac-tmpl/bootstrap/images/favicon.ico" type="image/x-icon" />

    
        
    


    <link rel="stylesheet" type="text/css" href="/opac-tmpl/bootstrap/css/opac_23.0504000.css">




    <link rel="stylesheet" type="text/css" media="print" href="/opac-tmpl/bootstrap/css/print_23.0504000.css">


    <style>/* Header icon Color By Ganesh*/
.fa.fa-icon-black {
    color: #ffffff;
}

/* Header Color By Ganesh*/
.navbar-expand  {
    background: #5d2d46;
    margin:2px;
    /*border:1px solid #5d2d46; */

}

/* Header Text Color By Ganesh*/
.navbar-nav>li>a {
    color: #ffffff;
    font-weight: 700;
}

/* Search Outer Box Color By Ganesh*/
#opac-main-search {
    background: #c8a7b8;
    margin: 0.5em 0;
    border-radius: 5px;
    border: 0.5px solid #5d5d5d;
}

/*Login and Search Button By Ganesh*/
.btn-primary {
    background-color: #5d2d46;
    border: 1px solid #5d2d46;
    color: #fff;
}


/*Outer main Color By Ganesh*/
#wrapper {
    height: auto !important;
    height: 100%;
    min-height: 100%;
    padding-right: 0px !important;
    padding-left: 0px !important;
    background-color: #5d2d46;
}

/*Main Color By Ganesh*/
.main {
    background-color: #EEE9EE;
    border-radius: 7px;
    box-shadow: 0 1px 1px 0 rgba(0,0,0,.2);
}

/*Main Home Color By Ganesh*/
.breadcrumb {
    background-color: #C8A7B8;
}


/* For Table by Ganesh */

.accordion {
    background: #ffffff;
    margin-bottom: 20px;
    text-align: center;
    font-weight: bold;
}

.accordion-group {
    border: 1px solid #5d2d46;
    margin-bottom: 2px;
    border-radius: 4px;
}

.nit-nav-tab {
    background-color: #5d2d46;
}

.accordion-heading {
    display: block;
    padding: 8px 15px;
}

.accordion-toggle {
    cursor: pointer;
}

.nit-nav-tab-link {
    color: #fff !important;
    text-decoration: none !important;
}

.accordion-inner {
    padding: 9px 15px;
    border-top: 1px solid #e5e5e5;
}

/* OPAC Credits By Ganesh */

#footer-texts-left, #footer-texts-right, #footer-texts-left a, #footer-texts-right a, #footer-texts-left a:visited {
    color: #fff;
}

.pull-left {
    float: left;
}

.pull-right {
    float: right;
}

.container-fluid {
    padding-right: 20px;
    padding-left: 20px;
  
  
}


/*OPAC NAV RIGHT*/
.table tbody tr.warning>td {
    background-color: #fcf8e3;
}

.table td, .table th {
    line-height: 135%;
}

.table th, .table td {
    padding: 8px;
    line-height: 20px;
    text-align: left;
    vertical-align: top;
    border-top: 1px solid #dddddd;
}


.title_block {
    background: url(../images/sprite2.png) no-repeat scroll -231px -547px transparent;
    color: #4D3019;
    font-family: 'Droid Serif',Arial,Helvetica,sans-serif;
    font-size: 16px;
    font-weight: normal;
    padding: 3px 11px 6px 28px;
    text-transform: capitalize;
}
.bx-wrapper {
    position: relative;
    padding: 0;
    
}

.bx-viewport {
    width: 100%;
    overflow: hidden;
    position: relative;
    height: 282px;
}</style>




<script>
    var Koha = {};
    function _(s) { return s } // dummy function for gettext
    const is_logged_in = false
</script>

<script src="/opac-tmpl/bootstrap/js/Gettext_23.0504000.js"></script>
<script src="/opac-tmpl/bootstrap/js/i18n_23.0504000.js"></script>

<link rel="stylesheet" type="text/css" href="/opac-tmpl/lib/font-awesome/css/font-awesome.min_23.0504000.css">

































</head>




    





    

<body ID="opac-main" class="branch-default" >











































<button id="scrolltocontent">Skip to main content</button>
<div id="wrapper">
    <div id="header-region" class="noprint">
        <nav class="navbar navbar-expand">
            <div id="logo">
            <a class="navbar-brand" href="/cgi-bin/koha/opac-main.pl">
                
                    Koha online
                
            </a>
            </div>
            
                <div id="cartDetails" class="cart-message">Your cart is empty.</div>
            
            <ul id="cart-list-nav" class="navbar-nav">
                
                    <li class="nav-item js-show">
                        <a href="#" class="nav-link" title="Collect items you are interested in" id="cartmenulink" role="button">
                            <i id="carticon" class="fa fa-shopping-cart fa-icon-black" aria-hidden="true"></i> <span class="cartlabel">Cart</span> <span id="basketcount"></span>
                        </a>
                    </li>
                
                <li class="divider-vertical"></li>
                
                    <li class="nav-item dropdown">
                        <a href="/cgi-bin/koha/opac-shelves.pl" title="Show lists" class="nav-link dropdown-toggle" id="listsmenu" data-toggle="dropdown" role="button" aria-label="Show dropdown with detailed list information" aria-haspopup="true" aria-expanded="false"
                            ><i class="fa fa-list fa-icon-black" aria-hidden="true"></i> <span class="listslabel">Lists</span>
                        </a>
                        <div aria-labelledby="listsmenu" role="menu" class="dropdown-menu">
                            
                                <a class="dropdown-item" href="/cgi-bin/koha/opac-shelves.pl?op=list&amp;public=1" tabindex="-1" role="menuitem"><strong>Public lists</strong></a>
                                
                                
                                    <a class="dropdown-item" href="/cgi-bin/koha/opac-shelves.pl?op=view&amp;shelfnumber=103&amp;sortfield=title" tabindex="-1" role="menuitem">HI BRO</a>
                                    
                                    
                                
                                    <a class="dropdown-item" href="/cgi-bin/koha/opac-shelves.pl?op=view&amp;shelfnumber=101&amp;sortfield=dateadded" tabindex="-1" role="menuitem">MFs I can't care less what you do with this account. Heck I never even accessed this website.</a>
                                    
                                    
                                
                                    <a class="dropdown-item" href="/cgi-bin/koha/opac-shelves.pl?op=view&amp;shelfnumber=79&amp;sortfield=title" tabindex="-1" role="menuitem">Bro can't follow basic account safety steps, please drop out from college</a>
                                    
                                    
                                
                                    <a class="dropdown-item" href="/cgi-bin/koha/opac-shelves.pl?op=view&amp;shelfnumber=89&amp;sortfield=title" tabindex="-1" role="menuitem">Maths</a>
                                    
                                    
                                
                                    <a class="dropdown-item" href="/cgi-bin/koha/opac-shelves.pl?op=view&amp;shelfnumber=86&amp;sortfield=title" tabindex="-1" role="menuitem">hello whats up</a>
                                    
                                    
                                
                                    <a class="dropdown-item" href="/cgi-bin/koha/opac-shelves.pl?op=view&amp;shelfnumber=69&amp;sortfield=title" tabindex="-1" role="menuitem">Positive Life skill books</a>
                                    
                                    
                                
                                    <a class="dropdown-item" href="/cgi-bin/koha/opac-shelves.pl?op=view&amp;shelfnumber=82&amp;sortfield=title" tabindex="-1" role="menuitem">bro check public lists</a>
                                    
                                    
                                
                                    <a class="dropdown-item" href="/cgi-bin/koha/opac-shelves.pl?op=view&amp;shelfnumber=80&amp;sortfield=title" tabindex="-1" role="menuitem">chantge your password</a>
                                    
                                    
                                
                                    <a class="dropdown-item" href="/cgi-bin/koha/opac-shelves.pl?op=view&amp;shelfnumber=78&amp;sortfield=title" tabindex="-1" role="menuitem">Bro change your passwords u lil bitch. ANywone can access your shit. Also pay your fine</a>
                                    
                                    
                                
                                    <a class="dropdown-item" href="/cgi-bin/koha/opac-shelves.pl?op=view&amp;shelfnumber=26&amp;sortfield=title" tabindex="-1" role="menuitem">Mathematics</a>
                                    
                                    
                                
                                    <a class="dropdown-item listmenulink" href="/cgi-bin/koha/opac-shelves.pl?op=list&amp;public=1" tabindex="-1" role="menuitem">View all</a>
                                
                            
                            
                                <div class="dropdown-divider"></div>
                            
                            
                                <a class="dropdown-item" href="/cgi-bin/koha/opac-shelves.pl?op=list&amp;public=0" tabindex="-1" role="menuitem"><strong>Your lists</strong></a>
                                
                                    <a class="dropdown-item" href="/cgi-bin/koha/opac-shelves.pl?op=add_form" tabindex="-1" role="menuitem">Log in to create your own lists</a>
                                
                            
                        </div> <!-- / .dropdown-menu -->
                    </li> <!-- / .nav-item.dropdown -->
                
            </ul> <!-- / .navbar-nav -->

            
                
                <ul id="members" class="navbar-nav">
                    <li class="nav-item dropdown">
                        
                            
                                
                                    <a href="/cgi-bin/koha/opac-user.pl" class="nav-link login-link loginModal-trigger"><i class="fa fa-user fa-icon-black fa-fw" aria-hidden="true"></i> <span class="userlabel">Log in to your account</span></a>
                                
                            
                        

                        
                    </li>
                    
                        
                            <li class="nav-item search_history">
                                <a class="nav-link login-link" href="/cgi-bin/koha/opac-search-history.pl" title="View your search history">Search history</a>
                            </li>
                            <li class="divider-vertical"></li>
                            <li class="nav-item">
                                <a class="nav-link logout clearsh" href="/cgi-bin/koha/opac-search-history.pl?action=delete" title="Delete your search history"><i class="fa fa-trash" aria-hidden="true"></i> Clear</a>
                            </li>
                        
                    
                </ul>
            
        </nav> <!-- /navbar -->

        
            <div class="container-fluid">
                <div class="row">
                    <div class="col">
                        
    
        <div id="opacheader">
            
                <div class="en_item">
                    
                    <div class="en_body"><center><nav class="navbar1 navbar-expand-lg" id="navbar-main" aria-label="Primary Navigation"><a href="/cgi-bin/koha/tools/class=&quot;navbar-brand&quot;"> <img src="/opac-tmpl/bootstrap/images/logo.png" /> </a></nav></center><center>
<div>
<ul style="font-size: 1.5rem; color: white;">Central Library</ul>
</div>
</center></div>
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
                                
                                    <form name="searchform" method="get" action="/cgi-bin/koha/opac-search.pl" id="searchform">
                                        <div class="form-row align-items-center">
                                            <div class="col-sm-auto order-2 order-sm-2">
                                                <select name="idx" id="masthead_search" class="form-control">
                                                    
                                                        <option value="">Library catalog</option>
                                                    
                                                    
                                                        <option value="ti">Title</option>
                                                    
                                                    
                                                        <option value="au">Author</option>
                                                    
                                                    
                                                        <option value="su">Subject</option>
                                                    
                                                    
                                                        <option value="nb">ISBN</option>
                                                    
                                                    
                                                        <option value="ns">ISSN</option>
                                                    
                                                    
                                                        <option value="se">Series</option>
                                                    
                                                    
                                                        
                                                            <option value="callnum">Call number</option>
                                                        
                                                    
                                                </select>
                                            </div> <!-- /.col-sm-auto -->

                                            <div class="col order-4 order-sm-3">
                                                
                                                    <input type="text" class="transl1 form-control" id="translControl1" name="q" value="" /><span id="translControl"></span>
                                                
                                            </div> <!-- /.col -->

                                            
                                                
                                                    
                                                
                                            

                                            <div class="order-5 col-sm-auto">
                                                <button type="submit" id="searchsubmit" class="btn btn-primary" title="Search" aria-label="Search">
                                                    <i class="fa fa-search" aria-hidden="true"></i>
                                                </button>
                                            </div>

                                        </div> <!-- /.form-row -->
                                        <input type="hidden" name="weight_search" value="1">
                                    </form>
                                
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
                            
                                <span>Libraries</span>
                            
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
                    <h2 class="modal-title" id="modalLoginLabel">Log in to your account</h2>
                    <button type="button" class="closebtn" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form action="/cgi-bin/koha/opac-user.pl" method="post" name="auth" id="modalAuth">
                    <input type="hidden" name="has-search-query" id="has-search-query" value="" />
                    <div class="modal-body">
                        
                        
                        
                            
                            
                            <input type="hidden" name="koha_login_context" value="opac" />
                            <fieldset class="brief">
                                <div class="local-login">
                                    <label for="muserid">Login:</label><input type="text" id="muserid" name="userid" autocomplete="off" />
                                    <label for="mpassword">Password:</label><input type="password" id="mpassword" name="password" autocomplete="off" />
                                    <fieldset class="action">
                                        <input type="submit" class="btn btn-primary" value="Log in" />
                                    </fieldset>
                                </div>
                                
                                
                                    <div id="forgotpassword-modal" class="forgotpassword">
                                        <a href="/cgi-bin/koha/opac-password-recovery.pl">Forgot your password?</a>
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
                    <a href="#" aria-current="page">Home</a>
                </li>
            
        </ol>
    </nav> <!-- /#breadcrumbs -->

    
        
            <div id="notloggedin" class="container-fluid">
        
    

    <div class="row">
        

        
            
            <div class="col-12 col-lg-9 order-md-1 maincontent">
        

        <h1 class="sr-only">Koha home</h1>

        

         <!-- koha news -->
            

        

        
            

            
        

        </div> <!-- / .col 6/8 -->

        
            <div class="col-12 col-lg-3 order-md-2">
                
                    
                        
                            <div id="login">
                                <form action="/cgi-bin/koha/opac-user.pl" method="post" name="auth" id="auth" autocomplete="off">
                                    <input type="hidden" name="koha_login_context" value="opac" />
                                    <fieldset class="brief">
                                        <legend>Log in to your account:</legend>
                                        
                                        
                                        
                                        <div class="local-login">
                                            <label for="userid">Login:</label>
                                            <input class="form-control" type="text" id="userid" name="userid" autocomplete="off" />
                                            <label for="password">Password:</label>
                                            <input class="form-control" type="password" id="password" name="password" autocomplete="off" />
                                            <fieldset class="action">
                                                <input type="submit" value="Log in" class="btn btn-primary" />
                                            </fieldset>
                                        </div>
                                        
                                        
                                            <div id="forgotpassword-main" class="forgotpassword">
                                                <p><a href="/cgi-bin/koha/opac-password-recovery.pl">Forgot your password?</a></p>
                                            </div>
                                        
                                        
                                    </fieldset>
                                </form>
                            </div> <!-- /#login -->
                        
                    
                
                
    
        <div id="OpacNavRight">
            
                <div class="en_item">
                    
                    <div class="en_body"></div>
                </div>
            
        </div>
    

            </div> <!-- / .col -->
        

        </div> <!-- /.container-fluid -->
    </div> <!-- /.row -->
</div> <!-- /.main -->




































        
        

        
    </div> <!-- / #wrapper in masthead.inc -->

    
        
    


<!-- JavaScript includes -->
<script src="/opac-tmpl/lib/jquery/jquery-3.6.0.min_23.0504000.js"></script>
<script src="/opac-tmpl/lib/jquery/jquery-migrate-3.3.2.min_23.0504000.js"></script>
<script src="/opac-tmpl/lib/bootstrap/js/bootstrap.bundle.min_23.0504000.js"></script>
<script src="/opac-tmpl/lib/fontfaceobserver.min_23.0504000.js"></script>
<script src="/opac-tmpl/lib/enquire.min_23.0504000.js"></script>
<script>
    let logged_in_user_id = "";
</script>
<script src="/opac-tmpl/bootstrap/js/global_23.0504000.js"></script>

    <script>
        var NO_AMAZON_IMAGE = _("No cover image available");
    </script>
    <script src="/opac-tmpl/bootstrap/js/amazonimages_23.0504000.js"></script>


<script>

    var MSG_CONFIRM_AGAIN = _("Warning: Cannot be undone. Please confirm once again")
    var MSG_DELETE_SEARCH_HISTORY = _("Are you sure you want to delete your search history?");
    var MSG_NO_SUGGESTION_SELECTED = _("No suggestion was selected");
    var MSG_SEARCHING = _("Searching %s...");
    var MSG_ERROR_SEARCHING_COLLECTION = _("Error searching %s collection");
    var MSG_NO_RESULTS_FOUND_IN_COLLECTION = _("No results found in the library's %s collection");
    var MSG_RESULTS_FOUND_IN_COLLECTION = _("Found %s results in the library's %s collection");
    var MSG_BY = _("by");
    var MSG_TYPE = _("Type");
    var MSG_NEXT = _("Next");
    var MSG_PREVIOUS = _("Previous");
    var MSG_CHECKOUTS = _("Checkouts");
    var MSG_NO_CHECKOUTS = _("No checkouts");
    var MSG_CHECK_OUT = _("Check out");
    var MSG_CHECK_OUT_CONFIRM = _("Are you sure you want to check out this item?");
    var MSG_CHECKED_OUT_UNTIL = _("Checked out until %s");
    var MSG_CHECK_IN = _("Check in");
    var MSG_CHECK_IN_CONFIRM = _("Are you sure you want to return this item?");
    var MSG_NO_CHECKOUTS = _("No checkouts");
    var MSG_DOWNLOAD = _("Download");
    var MSG_HOLDS = _("Holds");
    var MSG_NO_HOLDS = _("No holds");
    var MSG_PLACE_HOLD = _("Place hold");
    var MSG_CANCEL_HOLD = _("Cancel");
    var MSG_CANCEL_HOLD_CONFIRM = _("Are you sure you want to cancel this hold?");
    var MSG_ON_HOLD = _("On hold");

    
        var MSG_TAGS_DISABLED = _("Sorry, tags are not enabled on this system.");
        var MSG_TAG_ALL_BAD = _("Error! Your tag was entirely markup code.  It was NOT added.  Please try again with plain text.");
        var MSG_ILLEGAL_PARAMETER = _("Error! Illegal parameter");
        var MSG_TAG_SCRUBBED = _("Note: your tag contained markup code that was removed. The tag was added as ");
        var MSG_ADD_TAG_FAILED = _("Error! Adding tags failed at");
        var MSG_ADD_TAG_FAILED_NOTE = _("Note: you can only tag an item with a given term once.  Check 'My Tags' to see your current tags.");
        var MSG_DELETE_TAG_FAILED = _("Error! You cannot delete the tag");
        var MSG_DELETE_TAG_FAILED_NOTE = _("Note: you can only delete your own tags.")
        var MSG_LOGIN_REQUIRED = _("You must be logged in to add tags.");
        var MSG_TAGS_ADDED = _("Tags added: ");
        var MSG_TAGS_DELETED = _("Tags added: ");
        var MSG_TAGS_ERRORS = _("Errors: ");
        var MSG_MULTI_ADD_TAG_FAILED = _("Unable to add one or more tags.");
        var MSG_NO_TAG_SPECIFIED = _("No tag was specified.");
    
    
    

    
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
    $(".clearsh").on("click", function(){
        return confirmDelete(MSG_DELETE_SEARCH_HISTORY);
    });

</script>


    <script src="/opac-tmpl/bootstrap/js/basket_23.0504000.js"></script>


<script src="/opac-tmpl/bootstrap/js/tags_23.0504000.js"></script>

    <script src="/opac-tmpl/bootstrap/js/google-jackets_23.0504000.js"></script>
    <script>

        var NO_GOOGLE_JACKET = _("No cover image available");

    </script>




    <script src="/opac-tmpl/bootstrap/js/localcovers_23.0504000.js"></script>
    <script>

    var NO_LOCAL_JACKET = _("No cover image available");

    </script>






<script src="/opac-tmpl/lib/js-cookie/js.cookie-3.0.1.min_23.0504000.js"></script>
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


    <script>
        /* JS for Koha CoverFlow Plugin 
   This JS was added automatically by installing the CoverFlow plugin
   Please do not modify */$(document).ready(function(){$.getScript("/plugin/Koha/Plugin/Com/ByWaterSolutions/CoverFlow/bower_components/jquery-flipster/dist/jquery.flipster.min.js",function(data,textStatus,jqxhr){$("head").append("<link id='flipster-css' href='/plugin/Koha/Plugin/Com/ByWaterSolutions/CoverFlow/bower_components/jquery-flipster/dist/jquery.flipster.min.css' type='text/css' rel='stylesheet' />");$('#coverflow').load("/coverflow.pl?id=3",function(){$('.koha-coverflow img').on("load",function(){if(this.naturalHeight==1){$(this).attr("src","https://raw.githubusercontent.com/bywatersolutions/web-assets/master/NoImage.png");}});var opt={'items':'.item','minfactor':15,'distribution':1.5,'scalethreshold':0,'staticbelowthreshold':false,'titleclass':'itemTitle','selectedclass':'selectedItem','scrollactive':true,'step':{'limit':4,'width':10,'scale':true}};$('#coverflow').flipster({autoplay:'4000',buttons:'true',loop:'true',style:'coverflow',});});});});
/* End of JS for Koha CoverFlow Plugin */
    </script>



</body>
</html>


