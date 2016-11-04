$(document).ready(function () {

  $(".new-question").click(function() {
    $(this).addClass("hidden");
    $("#new-question").removeClass("hidden");
  });

  $("#new-question").submit(function(event) {
    event.preventDefault();
    var ajaxRequest = $.ajax({
      url: '/questions',
      method: 'POST',
      data: $(this).serialize()
    });
    ajaxRequest.done(function(response) {
      $("ul.questions").prepend(response);
      $("form#new-question")[0].reset();
      $(".new-question").removeClass("hidden");
      $("form#new-question").addClass("hidden");
    });
  });

  $('#answer-form').on('submit', function(event){
    event.preventDefault();
    var route = $(this).attr("action");
    var answerData = $(this).find("textarea").serialize();
    $.ajax({
      url: route,
      method: "post",
      data: answerData
    }).done(function(serverResponse) {
      $(".answer-box").find(".answers").append(serverResponse)
      $('#answer-form').find('textarea').val('')
    });
  });

  $('.questions').on("click", ".upvote-button", function(event) {
    event.preventDefault();
    var voteDirection = 1;
    var questionId = $(this).closest("li").attr("id");
    $.ajax({
      url: '/votes',
      method: 'POST',
      data: {"type": "Question", "question_id": questionId, "vote_direction": voteDirection}
    })
    .done(function(serverResponse) {
      var questionID = serverResponse['question_id'];
      var points = serverResponse['points'];
      $("li#" + questionID).find(".points").text(points);
    });
  });

  $('.questions').on("click", ".downvote-button", function() {
    event.preventDefault();
    var voteDirection = -1;
    var questionId = $(this).closest("li").attr("id");

    $.ajax({
      url: '/votes',
      method: 'POST',
      data: {"type": "Question", "question_id": questionId, "vote_direction": voteDirection}
    })
    .done(function(serverResponse) {
      var questionID = serverResponse['question_id'];
      var points = serverResponse['points'];
      $("li#" + questionID).find(".points").text(points);
    });
  });

});


