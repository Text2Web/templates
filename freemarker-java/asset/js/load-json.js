jQuery(document).ready(function () {
    var loadData = jQuery("#load-data")
    var url = loadData.attr("load-url")

    if (url !== undefined) {
        jQuery.ajax({url: "http://localhost:8188/asset" + "/data-files/" + url + ".json", dataType: 'json', success: function(result){
                if (result !== undefined && result !== ""){
                    var button = "<br/><div class=\"btn-group\" role=\"group\">";
                    button += "<button type=\"button\" class=\"btn btn-secondary\">Play All</button>";
                    button += "<button type=\"button\" class=\"btn btn-secondary\">Practise</button>";
                    button += "</div><br/><br/>";

                    var table = "<table class=\"table table-condensed\">";
                    table += "<thead><tr>";
                    table += "<th>English</th>";
                    table += "<th>Bangla</th>";
                    table += "<th>Synonymous</th>";
                    table += "<th>Example</th>";
                    table += "</tr></thead>";

                    table += "<tbody>";

                    jQuery.each(result, function (index, object) {
                        console.log(object)
                        table += "<tr>";
                        table += "<td>" + object.english + "</td>";
                        table += "<td>" + object.bangla + "</td>";
                        table += "<td>" + object.synonymous + "</td>";
                        table += "<td>" + object.example + "</td>";
                        table += "</tr>";
                    })


                    table += "</table>";
                    table += "</tbody>";
                    loadData.html("");
                    loadData.html(button + table);
                }
        }});
    }

})