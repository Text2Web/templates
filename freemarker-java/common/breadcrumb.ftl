<#if page.breadcrumb?has_content >
    <span aria-label="breadcrumb">
    <ol class="breadcrumb">
        <#list page.breadcrumb as  breadcrumb>
            <li class="breadcrumb-item"><a href="${breadcrumb.url}">${breadcrumb.name}</a></li>
        </#list>
    </ol>
</span>
</#if>
