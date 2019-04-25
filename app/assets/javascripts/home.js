//= require jquery3

$(document).ready(function () {
    $("#request-loader").fadeOut(1000);
    $('.end-date').datepicker({
        minDate: 0,
        dateFormat: 'dd/mm/yy',
        todayHighlight: true,
        beforeShowDay: $.datepicker.noWeekends,
    });

    $('.leaveApprovalForm button').click(function (e) {
        e.preventDefault();
        var type = $(this).attr("data-type");
        console.log(type);
        var form = $(this).closest('form');
        let token = form.find('.token').val();
        console.log(token);
        let id = $(this).attr('data-id');
        console.log(id);
        let status = 'pending';
        if (type === 'approve')
            status = 'approved';
        else
            status = 'rejected';
        $('#request-loader').show();
        $.ajax({
            url: '/leave/' + id,
            method: 'PUT',
            data: {
                type: type,
                authenticity_token: token,
                status: status
            },
            beforeSend: function () {

            },
            success: function (data) {
                if (data.success === true) {
                    window.location.href = "/";
                }
            }
        })
    });

    $('.leaveExtendForm button').click(function (e) {
        e.preventDefault();
        var type = $(this).attr("data-type");
        console.log(type);
        var form = $(this).closest('form');
        let token = form.find('.token').val();
        console.log(token);
        let id = $(this).attr('data-id');
        console.log(id);
        let end_date = form.find('.end-date').val();
        console.log(end_date);
        $('#request-loader').show();
        $('#loading-image').show();
        $.ajax({
            url: '/leave/extend_leave/' + id,
            method: 'PUT',
            data: {
                type: type,
                authenticity_token: token,
                end_date: end_date
            },
            success: function (data) {
                if (data.success === true) {
                    window.location.href = "/";
                }
            },
            complete: function () {
                $('#loading-image').hide();
            },
        })
    });
});