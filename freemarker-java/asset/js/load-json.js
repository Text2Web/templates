
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

var playAllInterval, spellingPractiseInterval, counterInterval;


function closePlayAll() {
    if (playAllInterval !== undefined){
        clearInterval(playAllInterval);
    }
}

function closeSpellingPractise() {
    if (spellingPractiseInterval !== undefined){
        clearInterval(spellingPractiseInterval);
    }
}

function closeCounterInterval() {
    if (counterInterval !== undefined){
        clearInterval(counterInterval);
    }
    jQuery("#counter").html("")
}

function startCounterInterval(count) {
    closeCounterInterval();
    var counter = jQuery("#counter")
    counter.html("")
    counter.html(" (" + count + ")")
    counterInterval = setInterval(function () {
        counter.html(" (" + (count--) + ")")
    }, 1000)
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

var correct = 0, wrong = 0;

function spellCheckAndAddRow(wordDetails) {
    var spellInput = jQuery("#spell-input")
    var value = spellInput.val()
    spellInput.val("");
    spellInput.focus();

    var yesNo = "<button type=\"button\" class=\"btn btn-danger\">NO</button>"
    if (wordDetails !== undefined && wordDetails.english !== undefined){
        var areEqual = value.toLowerCase().trim() === wordDetails.english.toLowerCase();
        if (areEqual){
            yesNo = "<button type=\"button\" class=\"btn btn-success\">YES</button>"
            correct++
        }else{
            wrong++
        }

        var table = "<tr>";
        table += "<td>" + yesNo + "</td>";
        table += "<td>" + value + "</td>";
        table += "<td>" + wordDetails.english + " ( " + wordDetails.bangla + " )</td>";
        table += "</tr>";
        jQuery("#spelling-practise-add-row").prepend(table);
        jQuery("#wrong").text(" " + wrong)
        jQuery("#correct").text(" " + correct)
    }

}

function spellingPractise(wordList){
    closeAll();
    jQuery("#vocabulary-list").hide();
    var spellingArea = jQuery("#spelling-list");
    spellingArea.show();
    spellingArea.html("")

    var html = ""

    html += "<div class=\"form-group\">"
    html += "<label>Please Write the word, which you just listen. <span id='counter'></span></label>"
    html += "<input type=\"text\" id='spell-input' class=\"form-control\">"
    html += "</div><br/><div><strong>Total: <span id='total'> 0</span></strong>, <strong>Correct: <span id='correct'> 0</span></strong>, <strong>Wrong: <span id='wrong'> 0</span></strong></div><br/>"



    html += "<table class=\"table table-condensed\">";
    html += "<thead><tr>";
    html += "<th>Is Correct</th>";
    html += "<th>Your Spelling</th>";
    html += "<th>Actual Spelling</th>";
    html += "</tr></thead>";
    html += "<tbody id='spelling-practise-add-row'>";
    html += "</table>";
    html += "</tbody>";
    spellingArea.html(html)
    jQuery("#spell-input").focus()
    jQuery("#total").text(" " + (wordList.length - 1))
    correct = 0
    wrong = 0;


    if (wordList !== undefined){
        let index = 0, isFirst = true;
        var totalSpan = 6;
        startCounterInterval(totalSpan)
        spellingPractiseInterval = setInterval(function () {
            closeCounterInterval()
            startCounterInterval(totalSpan)
            if (!isFirst){
                spellCheckAndAddRow(wordList[index])
            }
            index++;
            if (wordList[index] !== undefined){
                textToSpeech(wordList[index].english, function () {
                    if (index === wordList.length){
                        spellCheckAndAddRow(wordList[index]);
                        closeCounterInterval();
                    }
                });
            }

            if (index > wordList.length){
                closeSpellingPractise();
                closeCounterInterval();
            }
            isFirst = false;
        }, totalSpan * 1000)
    }
}

function closeAll(){
    closeCounterInterval();
    closePlayAll();
    closeSpellingPractise();
}



jQuery(document).ready(function () {
    var loadData = jQuery("#load-data")
    var url = loadData.attr("load-url");

    var wordList = undefined;
    if (url !== undefined) {
        jQuery.ajax({url: "/data-file/" + url + ".json", dataType: 'json', success: function(result){
                if (result !== undefined && result !== ""){
                    wordList = result;
                    var button = "<br/><div class=\"btn-group\" role=\"group\">";
                    button += "<button type=\"button\" class=\"btn btn-secondary play-word\">Play All</button>";
                    button += "<button type=\"button\" class=\"btn btn-secondary spelling-practise\">Practise</button>";
                    button += "</div><br/><br/>";

                    var table = "<div id='vocabulary-list'><table class=\"table table-condensed\">";
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
                    table += "</tbody></div><div id='spelling-list'></div>";
                    loadData.html("");
                    loadData.html(button + table);

                    jQuery(".play-word").on( "click", function() {
                        closeAll()
                        playEnglishWord(wordList);
                        jQuery("#vocabulary-list").show();
                        jQuery("#spelling-list").hide();
                    });

                    jQuery(".spelling-practise").on( "click", function() {
                        spellingPractise(wordList);
                    });

                }
        }});
    }

})