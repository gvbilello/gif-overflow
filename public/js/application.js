$(document).ready(function () {
  $('#answer-form').on('submit', function(event){
    event.preventDefault();
    var route = $(this).attr("action");
    var answerData = $(this).find("textarea").serialize();
    // debugger;
    $.ajax({
      url: route,
      method: "post",
      data: answerData
    }).done(function(serverResponse) {
      // debugger;
      $(".answer-box").find(".answers").append(serverResponse)
    });
  });

});
