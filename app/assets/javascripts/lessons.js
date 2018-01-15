$(document).ready(function(){

  function speak(phrase){
    var msg = new SpeechSynthesisUtterance();
    msg.text = phrase;
    msg.lang = 'en-GB';
    window.speechSynthesis.speak(msg);
  }

  function checkAnswer() {
    var answer = $("#answer").val();
    $.ajax({ url: "/api/v1/lessons/next_question/",
      type: 'PUT',
      data: { answer: answer },
      success: function(result){
        $("#previous-question").html(result.previous);
        $("#your-answer").html(result.your);
        $("#correct-answer").html(result.correct);
        speak(result.correct);
        $("#question").html(result.question);
        $("#status").html(result.status);
        $("#number-of-questions").html("<strong>Number of questions: </strong>" + result.number_of_questions);
        $("#number-of-correct").html("<strong>Number of correct answers: </strong>" + result.number_of_correct);
     }});
     $("#answer").val("");
  }

  checkAnswer();
  $("#answer").keydown( "keydown", function( event ) {
	  if (event.which == 13) {
	  	checkAnswer();
	  };
	});
});
