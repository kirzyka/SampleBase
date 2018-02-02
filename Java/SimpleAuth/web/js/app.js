$(document).ready(function() {

    $('#btnLogin').on('click', 'a', function(event) {
        event.preventDefault();
        $.ajax('/JavaTest/auth', {
                method: 'POST',
                data: {action: 'login',
                       login: $('#txtLogin').val(),
                       pass: $('#txtPassword').val()
                },
                success: function(response) {
                    checkAuthState();
                }
            }
        )
    });

    $('#btnLogout').on('click', 'a', function(event) {
        event.preventDefault();
        $.ajax('/JavaTest/auth', {
                method: 'POST',
                data: {action: 'logout'},
                success: function(response) {
                    checkAuthState();
                }
            }
        )
    });

    checkAuthState();
});

function checkAuthState() {
    console.log($.cookie('token'));
    if($.cookie('token') != null) {
        $('#btnLogin').hide();
        $('#btnLogout').show();
    } else {
        $('#btnLogin').show();
        $('#btnLogout').hide();
    }

}
