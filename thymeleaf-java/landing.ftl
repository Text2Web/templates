<!DOCTYPE html>
<html>
<head>
    <title>${page.title}</title>
    <link rel="stylesheet" href="/asset/css/bootstrap.min.css">
    <link rel="stylesheet" href="/asset/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/asset/font-awesome/css/all.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">

    <script src="/asset/js/jquery-3.2.1.min.js"></script>
    <script src="/asset/js/popper.min.js"></script>
    <script src="/asset/js/bootstrap.min.js"></script>
    <script src="/asset/js/jquery.autocomplete.js"></script>

    <link rel="stylesheet" href="/asset/css/design.css">
    <link rel="stylesheet" href="/asset/css/landing.css">
    <link rel="stylesheet" href="/asset/css/style.css">
</head>
<body>
<div class="body">
    <div class="container-fluid top">
        <ul class="user-nav">
            <li><a href="https://github.com/hmtmcse-com" target="_blank" style="font-size: 20px;"><i class="fab fa-github-square"></i> GitHub</a></li>
            <li><a href="https://www.facebook.com/hmtmcsecom" target="_blank" style="font-size: 20px;"><i class="fab fa-facebook-square"></i> Facebook</a></li>
            <li><a href="http://youtube.com/hmtmcse" target="_blank" style="font-size: 20px;"><i class="fab fa-youtube"></i> YouTube</a></li>
        </ul>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="intro">
                    <div class="text-center mb-4">
                        <img  src="/asset/images/logo.png" class="responsive" alt="Logo" width="500px"/>
                    </div>
                    <form>
                        <div class="form-label-group">
                            <input type="email" id="inputEmail" class="form-control form-control-lg" placeholder="Search the documentation " required autofocus>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="container pb-x">
        <div class="row">
            <div class="col-sm-12">
                <div class="quick-feature-wrapper">
                    <div class="quick-feature">
                        <#list page.blocks.SQUIRE_BLOCK.childs as block>
                            <div class="block-wrapper">
                                <a href="${ block.url }" class="block">
                                    <div class="icon-wrap">
                                        <i class="${ block.icon }"></i>
                                    </div>
                                    <div class="content">
                                        <h5 class="card-title">${ block.name }</h5>
                                        <p class="card-text">${ block.summery }</p>
                                    </div>
                                </a>
                            </div>
                        </#list>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container-fluid pb-x">
        <div class="row">
            <div class="col-1"></div>
            <div class="col-10">
                <div class="card border-0">
                    <h2 class="text-center card-title">Tutorials</h2>
                    <div class="card-body">
                        <div class="row">


                            <#list page.blocks.LIST_BLOCK['childs'] as listBlock>
                                <div class="col-md-4 col-space-tb">
                                    <h5 class=""><a href="${listBlock.url}">${listBlock.name}</a></h5>
                                    <ul class="list-style-arrow">
                                        <#list listBlock.childs as topic>
                                            <li><a href="${topic.url}">${topic.name}</a></li>
                                        </#list>
                                    </ul>
                                </div>
                            </#list>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-1"></div>
        </div>
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
            </ul>
        </div>
    </div>
</div>

</body>
</html>
