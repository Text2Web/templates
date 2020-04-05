<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Time to Hack: Firebase with JavaScript and jQuery</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <style type="text/css">
        #contacts p,
        #contacts p.lead{
            margin: 0;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Contact Store Application</h1>
    <hr/>
    <div class="row">
        <div class="col-md-6">
            <form method="post" name="contactForm">
                <div class="form-group">
                    <label for="name">Name</label>
                    <input type="text" class="form-control" id="name" required placeholder="Enter name">
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" class="form-control" id="email" required placeholder="Enter Email">
                </div>
                <h3>Location</h3>
                <div class="form-group">
                    <label for="city">City</label>
                    <input type="text" class="form-control" id="city" placeholder="Enter City">
                </div>
                <div class="form-group">
                    <label for="email">State</label>
                    <input type="text" class="form-control" id="state" placeholder="Enter State">
                </div>
                <div class="form-group">
                    <label for="zip">Zip</label>
                    <input type="text" class="form-control" id="zip" placeholder="Enter Zip Code">
                </div>
                <button type="submit" class="btn btn-primary addValue">Submit</button>
            </form>
        </div>
        <div class="col-md-6">
            <ul id="contacts" class="list-group">
                <!-- Conatct Object li.list-group-item.contact will be added here by js -->
            </ul>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <div><iframe src="//time2hack.com/ads.html" frameborder=0 class="embed-responsive-item" align="center"></iframe></div>
        </div>
        <div class="col-md-6">
            <div><iframe src="//time2hack.com/ads.html" frameborder=0 class="embed-responsive-item" align="center"></iframe></div>
        </div>
    </div>
</div>


<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- Latest compiled and minified Bootstrap -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<!-- Include Firebase Library -->
<script src="https://www.gstatic.com/firebasejs/4.5.0/firebase.js"></script>
<!-- Contacts Store JavaScript -->
<script >
    // file: script.js
    // Initialize Firebase
    var config = {
        apiKey: "AIzaSyCfolxrOcBrgxVXKiBmdRbwakCNsw-kHbQ",
        authDomain: "tempone-7869c.firebaseapp.com",
        databaseURL: "https://tempone-7869c.firebaseio.com",
        projectId: "tempone-7869c",
        storageBucket: "tempone-7869c.appspot.com",
        messagingSenderId: "557485542616"
    };
    firebase.initializeApp(config);

    //create firebase database reference
    var dbRef = firebase.database();
    var contactsRef = dbRef.ref('contacts');

    //load older conatcts as well as any newly added one...
    contactsRef.on("child_added", function(snap) {
        console.log("added", snap.key, snap.val());
        $('#contacts').append(contactHtmlFromObject(snap.val()));
    });

    //save contact
    $('.addValue').on("click", function( event ) {
        event.preventDefault();
        if( $('#name').val() != '' || $('#email').val() != '' ){
            contactsRef.push({
                name: $('#name').val().replace(/<[^>]*>/ig, ""),
                email: $('#email').val().replace(/<[^>]*>/ig, ""),
                location: {
                    city: $('#city').val().replace(/<[^>]*>/ig, ""),
                    state: $('#state').val().replace(/<[^>]*>/ig, ""),
                    zip: $('#zip').val().replace(/<[^>]*>/ig, "")
                }
            })
            contactForm.reset();
        } else {
            alert('Please fill atlease name or email!');
        }
    });

    //prepare conatct object's HTML
    function contactHtmlFromObject(contact){
        console.log( contact );
        var html = '';
        html += '<li class="list-group-item contact">';
        html += '<div>';
        html += '<p class="lead">'+contact.name+'</p>';
        html += '<p>'+contact.email+'</p>';
        html += '<p><small title="'+contact.location.zip+'">'+contact.location.city+', '+contact.location.state+'</small></p>';
        html += '</div>';
        html += '</li>';
        return html;
    }

</script>
</body>
</html>
