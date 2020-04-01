<!DOCTYPE html>
<html lang="en">
<head>
    <title>${page.title}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="/asset/css/bootstrap.min.css">
    <link rel="stylesheet" href="/asset/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/asset/font-awesome/css/all.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
    <link rel="stylesheet" href="/asset/css/asciidoctor.css">
    <link rel="stylesheet" href="/asset/css/design.css">
    <link rel="stylesheet" href="/asset/css/style.css">
    <link rel="stylesheet" href="/asset/css/outline-page.css">
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

        <#assign leftNavData = page.relatedNav>
        <#include "common/left-nav.ftl" />

        <main class="col-12 col-md-9 col-xl-10 py-md-3 pl-md-5 bd-content" role="main">
            <div class="row">
                <#if page.topics?has_content>
                    <#list page.topics as topic>
                        <div class="col-3 col-md-3 margin-bottom-20" >
                            <a href="${tagHelper.twUrl(topic.url)}">
                                <div class="card">
                                    <img src="<#if topic.image?has_content>${topic.image}<#else>/asset/images/default_thumbs.jpg</#if>" class="card-img-top">
                                    <div class="card-body">
                                        <h5 class="card-title">${topic.name}</h5>
                                        <p class="card-text">
                                            ${topic.summery}
                                        </p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </#list>
                </#if>
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
</div>


</body>
</html>