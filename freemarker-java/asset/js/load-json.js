jQuery(document).ready(function () {
    var loadData = jQuery("#load-data")
    var url = loadData.attr("load-url")
    if (url !== undefined){
        console.log("Data " + loadData.attr("load-url"))
    }
})