<!DOCTYPE html>
<html lang="en">
<head>
    <title>${page.title}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <#include "common/common-header.ftl" />
    ${tagHelper.addCssTag("/asset/css/asciidoctor.css")}
    ${tagHelper.addCssTag("/asset/css/design.css")}
    ${tagHelper.addCssTag("/asset/css/outline-page.css")}
</head>
<body>
<#include "common/top-nav.ftl" />


<div class="container-fluid">
    <div class="row flex-xl-nowrap">

        <#assign leftNavData = page.relatedNav>
        <#include "common/left-nav.ftl" />

        <main class="col-12 col-md-9 col-xl-10 py-md-3 pl-md-5 bd-content" role="main">
            <div class="row">
                <#if page.topics?has_content>
                    <#list page.topics as topic>
                        <div class="col-12 col-sm-6 col-md-6 col-lg-3 col-xl-3 margin-bottom-20" >
                            <a href="${tagHelper.twUrlWithExtension(topic.url)}">
                                <div class="card">
                                    <img src="<#if topic.image?has_content>${topic.image}<#else>/asset/images/default_thumbs.jpg</#if>" class="card-img-top">
                                    <div class="card-body">
                                        <h5 class="card-title">${topic.name}</h5>
                                        <p class="card-text">
                                            ${topic.summery?default("No Summery Available")}
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
<#include "common/footer.ftl" />
</body>
</html>