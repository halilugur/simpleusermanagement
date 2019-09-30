$(function() {
    $.mask.definitions['~'] = "[+-]";
    $("#phone").mask("(999) 999-9999");
});


$("#createUserForm").submit(function (event) {
    var post_url = $(this).attr("action"); //get form action url
    var request_method = $(this).attr("method"); //get form GET/POST method
    var form_data = $(this).serialize(); //Encode form elements for submission
    if (validateCaptcha()) {
        $.ajax({
            url: post_url,
            type: request_method,
            data: form_data,
            beforeSend: function () {
                $("#loading").modal({show: true});
                $("#createUserModal").modal({show: false})

            },
            success: function (response) {
                if (response.status === 200) {
                    location.reload();
                } else {
                    $.each(response, function (index, value) {
                        $("#" + value.field).addClass("is-invalid");
                    });
                    $("#createUserModal").modal({show: true});
                }
                $("#loading").modal({show: false});
            },
            error: function (xhr, status, error) {
                var err = eval("(" + xhr.responseText + ")");
                alert(err);
            }
        });
    }
    return false;
});

$(".delete-user").on("click", function () {
    var id = $(this).data("userId");
    $("#deleteUserModal").find("form").find("#userId").val(id);
});

$("#createUserButton").on("click", function () {
    $("#createUserForm").reset();
    $("#createUserModal").find("form").find(".btn-primary").text("Ekle");
});

$(".update-user").on("click", function () {
    var id = $(this).data("userId");
    var name = $(this).data("userName");
    var lastName = $(this).data("userLastName");
    var phone = $(this).data("userPhone");
    $("#createUserModal").find("form").find("#id").val(id);
    $("#createUserModal").find("form").find("#name").val(name);
    $("#createUserModal").find("form").find("#lastName").val(lastName);
    $("#createUserModal").find("form").find("#phone").val(phone);
    $("#createUserModal").find("form").find(".btn-primary").text("Güncelle");
});