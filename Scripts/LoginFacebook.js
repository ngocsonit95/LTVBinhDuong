window.fbAsyncInit = function () {
    // FB JavaScript SDK configuration and setup
    FB.init({
        appId: '165562234201060', // FB App ID
        cookie: true,  // enable cookies to allow the server to access the session
        xfbml: true,  // parse social plugins on this page
        version: 'v2.8' // use graph api version 2.8
    });

    // Check whether the user already logged in
    FB.getLoginStatus(function (response) {
        if (response.status === 'connected') {
            //display user data
            //getFbUserData();
        }
    });
};

// Load the JavaScript SDK asynchronously
(function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

// Facebook login with JavaScript SDK
function fbLogin() {
    FB.login(function (response) {
        if (response.authResponse) {
            // Get and display the user profile data
            getFbUserData();
        } else {
            alert('Lỗi chưa đăng nhập được từ Facebook.');
        }
    }, { scope: 'email' });
}

// Fetch the user profile data from facebook
function getFbUserData() {
    FB.api('/me', { locale: 'en_US', fields: 'id,first_name,last_name,email,link,gender,locale,picture.width(250).height(250)' },
        function (response) {
            var data = data = "{email: '{0}', avatar: '{1}', fullName: '{2}', idFacebook: '{3}'}"
                .replace("{0}", response.email)
                .replace("{1}", response.picture.data.url)
                .replace("{2}", response.first_name + " " + response.last_name)
                .replace("{3}", response.id);
                console.log(response.picture.data.url);
            $.ajax({
                url: '/ServiceUtility.asmx/LoginFacebook',
                data: data,
                dataType: "json",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    if (data.d == true) {
                        location.reload();
                    }
                    else if (data.d == false) {

                        alertify.notify("Không thành công vui lòng thử lại");
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Error");
                }
            });
        });
}

// Logout from facebook
function fbLogout() {
    FB.logout(function () {
        //document.getElementById('fbLink').setAttribute("onclick", "fbLogin()");
        //document.getElementById('fbLink').innerHTML = '<img src="fblogin.png"/>';
        //document.getElementById('userData').innerHTML = '';
        //document.getElementById('status').innerHTML = 'You have successfully logout from Facebook.';
    });
}
