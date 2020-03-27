<!DOCTYPE html>
<html lang="en">
<head>
    <title>Tutorial Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="/asset/css/bootstrap.min.css">
    <link rel="stylesheet" href="/asset/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/asset/font-awesome/css/all.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
    <link rel="stylesheet" href="/asset/css/asciidoctor.css">
    <link rel="stylesheet" href="/asset/css/design.css">
    <link rel="stylesheet" href="/asset/css/style.css">
    <link rel="stylesheet" href="/asset/css/video-page.css">
    <script src="/asset/js/jquery-3.2.1.min.js"></script>
    <script src="/asset/js/popper.min.js"></script>
    <script src="/asset/js/bootstrap.min.js"></script>
    <script src="/asset/js/jquery.autocomplete.js"></script>
</head>
<body>
<a id="skippy" class="sr-only sr-only-focusable" href="#content">
    <div class="container">
        <span class="skiplink-text">Skip to main content</span>
    </div>
</a>


<header class="navbar navbar-expand navbar-dark flex-column flex-md-row bd-navbar">
    <a class="navbar-brand mr-0 mr-md-2" href="">
        <img  src="/asset/images/logo-32x32.png" class="responsive" alt="Logo"/>
    </a>

    <div class="navbar-nav-scroll">
        <ul class="navbar-nav bd-navbar-nav flex-row">
            <li class="nav-item">
                <a class="nav-link " href="/">Home</a>
            </li>
        </ul>
    </div>
    <ul class="navbar-nav flex-row ml-md-auto d-none d-md-flex">
        <li class="nav-item dropdown">
            <a class="nav-item nav-link dropdown-toggle mr-md-2" href="#" id="bd-versions" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Latest
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="bd-versions">
                <a class="dropdown-item active" href="#">Latest</a>
                <a class="dropdown-item" href="#">old</a>
            </div>
        </li>
    </ul>
</header>


<div class="container-fluid">
    <div class="row flex-xl-nowrap">

        <#assign leftNavData = page.nav>
        <#include "common/left-nav.ftl" />


        <main class="col-12 col-md-9 col-xl-10 py-md-3 pl-md-5 bd-content" role="main">

            <div class="col inner-content">
                <div class="row video-list-item">
                    <div class="col-sm-3">
<#--                        <img src="/asset/images/video-thumb-image-1.jpg" class="img-fluid" alt="Video Thumb">-->
                        <iframe class="img-fluid" src="https://www.youtube.com/embed/tgbNymZ7vqY">
                        </iframe>
                    </div>

                    <div class="col-sm">
                        <h4 class="video-thumb-title">Video Title</h4>
                        <p>Video description goes here. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec congue et mi ut finibus. Proin orci mauris, onsectetur adipiscing elit. Donec congue et mi ut finibus.imperdiet a maximus eget, luctus sed dui. </p>
                    </div>
                </div><!--video list item End-->
            </div>



        </main>
    </div>
</div>

<div class="container-fluid footer">
    <div class="row">
        <div class="col-sm-6">
            <a href="http://www.hmtmcse.com/" target="_blank">HMTMCSE</a>
        </div>
        <div class="col-sm-6">
            <ul class="list-inline d-flex flex-row-reverse">
                <li class="list-inline-item"><a href="#">Privacy</a></li>
                <li class="list-inline-item"><a href="#">Terms</a></li>
                <li class="list-inline-item"><a href="#">Settings</a></li>
            </ul>
        </div>
    </div>
</div> <!--footer design End-->


</body>
</html>