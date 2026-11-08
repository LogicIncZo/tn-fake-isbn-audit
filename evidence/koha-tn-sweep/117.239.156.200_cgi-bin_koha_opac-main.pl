

































<!DOCTYPE html>
<!-- TEMPLATE FILE: opac-main.tt -->









<html lang="en" class="no-js">
<head>

<title>Koha online catalog</title>



<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="generator" content="Koha 23.1104000" /> <!-- leave this for stats -->
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link href="/opac-tmpl/bootstrap/lib/jquery/responsive.dataTables.min_23.1104000.css" type="text/css" rel="stylesheet">

<link rel="shortcut icon" href="/opac-tmpl/bootstrap/images/favicon.ico" type="image/x-icon" />
<link rel="apple-touch-icon" href="/opac-tmpl/bootstrap/images/favicon.ico" type="image/x-icon" />

    
        
    


    <link type="text/css" rel="stylesheet" href="/opac-tmpl/bootstrap/css/opac_23.1104000.css">


    
    
        <link rel="stylesheet" type="text/css" href="/opac-tmpl/bootstrap/css/colors.css" />
    



    <link rel="stylesheet" type="text/css" media="print" href="/opac-tmpl/bootstrap/css/print_23.1104000.css">






<script>
    var Koha = {};
    function _(s) { return s } // dummy function for gettext
    const is_logged_in = false
</script>

<script src="/opac-tmpl/bootstrap/js/Gettext_23.1104000.js"></script>
<script src="/opac-tmpl/bootstrap/js/i18n_23.1104000.js"></script>

<link rel="stylesheet" type="text/css" href="/opac-tmpl/lib/fontawesome/css/fontawesome.min_23.1104000.css">
<link href="/opac-tmpl/lib/fontawesome/css/brands.min_23.1104000.css" type="text/css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="/opac-tmpl/lib/fontawesome/css/solid.min_23.1104000.css">






































































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
                                
                                
                                
                                    <a class="dropdown-item" href="/cgi-bin/koha/opac-shelves.pl?op=list&amp;public=0" tabindex="-1" role="menuitem"><strong>Your lists</strong></a>
                                    
                                        <a class="dropdown-item" href="/cgi-bin/koha/opac-shelves.pl?op=add_form" tabindex="-1" role="menuitem">Log in to create your own lists</a>
                                    
                                
                            </div> <!-- / .dropdown-menu -->
                        </li> <!-- / .nav-item.dropdown -->
                    
                    

                </ul> <!-- / .navbar-nav -->
            
            
                
                <ul id="members" class="navbar-nav">
                    <li class="nav-item dropdown">
                        
                            
                                
                                    <a href="/cgi-bin/koha/opac-user.pl" class="nav-link login-link loginModal-trigger"><i class="fa fa-user fa-icon-black fa-fw" aria-hidden="true"></i> <span class="userlabel">Log in to your account</span></a>
                                
                            
                        

                        
                    </li>
                    <!-- Cookie consent button for non logged-in users -->
                    
                        <li style="display:none" id="cookieConsentDivider" class="divider-vertical" aria-hidden="true"></li>
                        <li style="display:none" id="cookieConsentLi" class="nav-item" aria-hidden="true">
                            <a id="cookieConsentButton" href="#" name="Your cookies" class="nav-link" title="View and amend cookies you have consented to" role="button">
                                <i class="fa fa-cookie-bite" aria-hidden="true"></i>
                                <span class="cookieconsentlabel">Your cookies</span>
                            </a>
                        </li>
                    
                    
                        
                            <li class="divider-vertical"></li>
                            <li class="nav-item search_history">
                                <a class="nav-link login-link" href="/cgi-bin/koha/opac-search-history.pl" title="View your search history">Search history</a>
                            </li>
                            <li class="divider-vertical"></li>
                            <li class="nav-item">
                                <a class="nav-link logout clearsh" href="/cgi-bin/koha/opac-search-history.pl?action=delete" title="Delete your search history"><i class="fa fa-trash-can" aria-hidden="true"></i> Clear</a>
                            </li>
                        
                    
                </ul>
            
        </nav> <!-- /navbar -->

        
            <div class="container-fluid">
                <div class="row">
                    <div class="col">
                        
    
        <div id="opacheader">
            
                <div class="en_item">
                    
                    <div class="en_body"><h1><img src="/logo.png" />  <span style="color:#FFF;" > : Online Public Access Catalogue</span></h1></div>
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
                    
                    <div class="default_body"><ul>
<li><a href="http://shodhganga.inflibnet.ac.in/">ShodhGanga</a></li>
<li><a href="http://www.macollege.in/">MA College</a></li>
</ul>
</div>
                </div>
            
        </div>
    







                </div>
            </div>
        

        
            
            <div class="col-12 col-lg-7 order-md-1 maincontent">
        

        <h1 class="sr-only">Koha home</h1>

        

        
            
        
         <!-- koha news -->
            

        

        
            

            
                
    
        <div id="OpacMainUserBlock">
            
                <div class="en_item">
                    
                    <div class="en_body"><h2>Welcome to Online Public Access Catalog of MA College, Kothamangalam... </h2>
<hr></div>
                </div>
            
        </div>
    

            
        

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
                                        
                                        
                                        
                                    </fieldset>
                                </form>
                            </div> <!-- /#login -->
                        
                    
                
                
    

            </div> <!-- / .col -->
        

        </div> <!-- /.container-fluid -->
    </div> <!-- /.row -->
</div> <!-- /.main -->











































































        
        

        
    </div> <!-- / #wrapper in masthead.inc -->

    
        
    




<!-- CookieConsentedJS code that may run -->


<!-- JavaScript includes -->
<script src="/opac-tmpl/lib/jquery/jquery-3.6.0.min_23.1104000.js"></script>
<script src="/opac-tmpl/lib/jquery/jquery-migrate-3.3.2.min_23.1104000.js"></script>
<script src="/opac-tmpl/lib/bootstrap/js/bootstrap.bundle.min_23.1104000.js"></script>
<script src="/opac-tmpl/lib/fontfaceobserver.min_23.1104000.js"></script>
<script src="/opac-tmpl/lib/enquire.min_23.1104000.js"></script>
<script>
    let logged_in_user_id = "";
</script>
<script src="/opac-tmpl/bootstrap/js/global_23.1104000.js"></script>

    <script src="/opac-tmpl/bootstrap/js/amazonimages_23.1104000.js"></script>


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
    $(".clearsh").on("click", function(){
        return confirmDelete( _("Are you sure you want to delete your search history?") );
    });

</script>


    <script src="/opac-tmpl/bootstrap/js/basket_23.1104000.js"></script>


<script src="/opac-tmpl/bootstrap/js/tags_23.1104000.js"></script>

    <script src="/opac-tmpl/bootstrap/js/google-jackets_23.1104000.js"></script>




    <script src="/opac-tmpl/bootstrap/js/localcovers_23.1104000.js"></script>






<script src="/opac-tmpl/lib/js-cookie/js.cookie-3.0.1.min_23.1104000.js"></script>
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




<script src="/opac-tmpl/lib/dayjs/dayjs.min_23.1104000.js"></script>
<script src="/opac-tmpl/lib/dayjs/plugin/timezone_23.1104000.js"></script>
<script src="/opac-tmpl/lib/dayjs/plugin/utc_23.1104000.js"></script>
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








</body>
</html>


