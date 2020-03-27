<script>
    $(document).ready(function () {
        $("#search-input").on("keyup", function () {
            var value = this.value.toLowerCase().trim();
            $(".bd-sidenav li").show().filter(function () {
                return $(this).text().toLowerCase().trim().indexOf(value) == -1;
            }).hide();
        });
    });
</script>

<#if leftNavData?has_content >
    <div class="col-12 col-md-3 col-xl-2 bd-sidebar">
        <form class="bd-search d-flex align-items-center" action="#">
            <input type="search" class="form-control" id="search-input" placeholder="Search..." aria-label="Search for..." autocomplete="off">
            <button class="btn btn-link bd-search-docs-toggle d-md-none p-0 ml-3" type="button" data-toggle="collapse" data-target="#bd-docs-nav" aria-controls="bd-docs-nav" aria-expanded="false" aria-label="Toggle docs navigation">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 30 30" width="30" height="30" focusable="false"><title>Menu</title><path stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-miterlimit="10" d="M4 7h22M4 15h22M4 23h22"></path></svg>
            </button>
        </form>
        <nav class="collapse bd-links left-navigation" id="bd-docs-nav">
            <div class="bd-toc-item">
                <ul class="nav bd-sidenav ">
                    ${page.getLeftNavHtml(leftNavData)}
                </ul>
            </div>
        </nav>
    </div>
</#if>
