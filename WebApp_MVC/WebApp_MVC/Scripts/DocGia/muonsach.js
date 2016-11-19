
$(function () {
    $(".add-to-cart").click(function () {
        var id = $(this).attr("data-id");
        $.ajax({
            url: "/Cart/Add",
            data: { id: id },
            success: function (response) {
                $(".nn-cart #cnt").html(response.Count);
                $(".nn-cart #amt").html(response.Amount);
            }
        });
       
    
});