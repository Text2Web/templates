
function textToSpeech(text, close){
    var msg = new SpeechSynthesisUtterance();
    var voices = window.speechSynthesis.getVoices();
    msg.voice = voices[5];
    msg.rate = 1;
    msg.pitch = 1;
    msg.text = text;
    msg.onend = function(e) {
        if (close !== undefined){
            close();
        }
    };
    speechSynthesis.speak(msg);
}

function selectRow(row) {
    var table = jQuery("#word-table")
    table.find("tr").removeClass("table-success")
    table.find(".row-" + row).addClass("table-success")
}

var playAllInterval;

function closePlayAll() {
    if (playAllInterval !== undefined){
        clearInterval(playAllInterval);
    }
}

function playEnglishWord(wordList){
    if (wordList !== undefined){
        let index = 0;
        playAllInterval = setInterval(function () {
            selectRow(index)
            textToSpeech(wordList[index].english, function () {
                selectRow(index)
            });
            index++;
            if (index === wordList.length){
                closePlayAll();
            }
        }, 2000)
    }
}



jQuery(document).ready(function () {
    var loadData = jQuery("#load-data")
    var url = loadData.attr("load-url");

    var wordList = undefined;
    if (url !== undefined) {
        jQuery.ajax({url: "http://localhost:8188/asset" + "/data-files/" + url + ".json", dataType: 'json', success: function(result){
                if (result !== undefined && result !== ""){
                    wordList = result;
                    var button = "<br/><div class=\"btn-group\" role=\"group\">";
                    button += "<button type=\"button\" class=\"btn btn-secondary play-word\">Play All</button>";
                    button += "<button type=\"button\" class=\"btn btn-secondary\">Practise</button>";
                    button += "</div><br/><br/>";

                    var table = "<table class=\"table table-condensed\">";
                    table += "<thead><tr>";
                    table += "<th>English</th>";
                    table += "<th>Bangla</th>";
                    table += "<th>Synonymous</th>";
                    table += "<th>Example</th>";
                    table += "</tr></thead>";

                    table += "<tbody id='word-table'>";
                    jQuery.each(result, function (index, object) {
                        table += "<tr class='row-" + index + " '>";
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

                    jQuery(".play-word").on( "click", function() {
                        playEnglishWord(wordList);
                    });

                }
        }});
    }

})