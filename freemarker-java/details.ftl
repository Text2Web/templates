<!DOCTYPE html>
<html lang="en">
<head>
    <title>${page.title}</title>
    <#include "common/common-header.ftl" />
    ${tagHelper.addCssTag("/asset/css/asciidoctor.css")}
</head>
<body>

<#include "common/top-nav.ftl" />

<div class="container-fluid">
    <div class="row flex-xl-nowrap">

        <#assign leftNavData = page.nav>
        <#include "common/left-nav.ftl" />

        <main class="col-12 col-md-9 col-xl-10 py-md-3 pl-md-5 bd-content" role="main">
            <#include "common/breadcrumb.ftl" />
            <div class="asciidoctor-content">
                ${page.content}
            </div>
        </main>
    </div>
</div>
<#include "common/footer.ftl" />
</body>
</html>
