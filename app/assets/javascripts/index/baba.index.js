$(document).ready(function(){
    $('#get-coupon').on('click', function(){
        //make an ajax call to retrive the actual gift code
        $.ajax({
                method:"GET",
                url:"/coupons"
            }
        )
        .done(function(data) {
            $('#get-coupon').hide();
            $('.coupon-well').text(data.coupon).attr('style', 'display:inline-flex');
        })
        .fail(function() {

        })
        .always(function() {

        });
    });

    //init stuff
    var t = $('.timer').attr('data-countdown');
    var mtz = moment.tz(t, 'Asia/Kolkata');
    $('.timer').countdown(mtz.toDate(), function(event) {
        $(this).html(event.strftime('%w weeks %d days %H:%M:%S'));
    })
    .on('finish.countdown', function(event) {
        $('.hint').hide();
        $('.wow').show();
    });

});
