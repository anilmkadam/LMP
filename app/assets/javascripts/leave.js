//= require jquery3

$(document).ready(function () {

    $('#start-date').datepicker({
        minDate: 0,
        dateFormat: 'dd/mm/yy',
        beforeShowDay: $.datepicker.noWeekends,
    });

    $('#end-date').datepicker({
        minDate: 0,
        dateFormat: 'dd/mm/yy',
        beforeShowDay: $.datepicker.noWeekends,
    });

    function renderCalendar() {
        var today = moment().day();
        $('#calender').fullCalendar({
            locale: 'fr',
            header: {
                left: 'title',
                center: '',
                right: 'prev,next',
            },
            firstDay: today,
            dayClick: function (date, allDay, jsEvent, view) {
                $('#start-date').val(date.format());
                $(".fc-state-highlight").removeClass("fc-state-highlight");
                $(jsEvent.target).addClass("fc-state-highlight");
            }
        });
    }


    /*Ajax code */

    $('.leaveCancelForm button').click(function (e) {
        e.preventDefault();
        var type = $(this).attr("data-type");
        console.log(type);
        var form = $(this).closest('form');
        let token = form.find('.token').val();
        console.log(token);
        let id = $(this).attr('data-id');
        console.log(id);
        let status = 'pending';
        if (type === 'cancel')
            status = 'canceled_by_user';
        else
            status = 'pending';

        $.ajax({
            url: '/leave/cancel_leave/' + id,
            method: 'PUT',
            data: {
                type: type,
                authenticity_token: token,
                status: status
            },
            success: function (data) {
                if (data.success === true) {
                    window.location.href = "/leave/history";
                }
            }
        })
    });
    renderCalendar();
});