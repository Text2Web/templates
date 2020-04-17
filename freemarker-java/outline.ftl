<!DOCTYPE html>
<html lang="en">
<head>
    <title>${page.title}</title>
    <#include "common/common-header.ftl" />
    ${tagHelper.addCssTag("/asset/css/outline-page.css")}
</head>
<body>
<#include "common/top-nav.ftl" />


<div class="container-fluid">
    <div class="row flex-xl-nowrap">

        <#assign leftNavData = page.relatedNav>
        <#include "common/left-nav.ftl" />

        <main class="col-12 col-md-9 col-xl-10 py-md-3 pl-md-5 bd-content" role="main">
            <#include "common/breadcrumb.ftl" />
            <div class="col inner-content">
                <#list page.topics as outline>
                    <h3 class="underline-header">${outline.name}</h3>
                    <ul class="out-line-list pb-x">
                        <#list outline.childs as topic>
                            <li><a href="${tagHelper.twUrlWithExtension(topic.url)}">${topic.name}</a></li>
                        </#list>
                    </ul>
                </#list>
            </div>
        </main>
    </div>
</div>
<#include "common/footer.ftl" />
</body>
</html>