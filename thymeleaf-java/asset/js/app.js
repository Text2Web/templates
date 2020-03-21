jQuery(document).ready(function () {
    jQuery("pre").addClass("prettyprint")
    PR.prettyPrint()
    var searchSuggestionOnselect = function (event, ui) {
        window.location.href = event.value.url;
    };
    var searchField = $("#search-input");
    function bindAutocomplete(searchInput) {
        searchField.autocomplete({
            serviceUrl: "/search/navigation",
            type: 'GET',
            showNoSuggestionNotice: true,
            noSuggestionNotice: 'No results found',
            autoSelectFirst: true,
            triggerSelectOnValidInput: false,
            preventBadQueries: false,
            groupBy: "category",
            onSelect: searchSuggestionOnselect,
            params: {name: searchInput.val()}
        });
    }
    bindAutocomplete($("#search-input"));

    jQuery('a[href^="#"]').on('click', function (event) {
        var target = jQuery(this.getAttribute('href'));
        if (target.length) {
            event.preventDefault();
            jQuery('html, body').stop().animate({
                scrollTop: target.offset().top - 65
            }, 1000);
        }
    });
});

