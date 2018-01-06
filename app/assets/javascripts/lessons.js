$(document).ready(function(){
  function checkAnswer() {
    var answer = $("#answer").val();
    $.ajax({ url: "/api/v1/lessons/next_question/",
      type: 'PUT',
      data: { answer: answer },
      success: function(result){
        $("#previous-question").html(result.previous);
        $("#your-answer").html(result.your);
        $("#correct-answer").html(result.correct);
        $("#question").html(result.question);
        $("#number-of-questions").html("<strong>Number of questions: </strong>" + result.number_of_questions);
        $("#number-of-correct").html("<strong>Number of correct answers: </strong>" + result.number_of_correct);
     }});
     $("#answer").val("");
  }
  checkAnswer();
  $('#check-answer').click(checkAnswer);
});
