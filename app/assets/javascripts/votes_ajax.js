$(document).ready (function() {
$('.upvoteButton').on('click', function(event) {
  event.preventDefault();
  var targetReview = this.parentElement.action

  var url = window.location.href;

  var request = $.ajax({
    url: `${targetReview}.json`,
    method: 'POST',

  });

  request.done(function(data) {
    document.getElementById("upcount").innerHTML = `${data.upvotes} upvotes`;
    document.getElementById("downcount").innerHTML = `${data.downvotes} downvotes`;
    document.getElementById("sum").innerHTML = `sum of votes: ${data.sumvotes}`;
  });

});

$('.downvoteButton').on('click', function(event) {
  event.preventDefault();
  var targetReview = this.parentElement.action

  var url = window.location.href;

  var request = $.ajax({
    url: `${targetReview}.json`,
    method: 'POST',

  });

  request.done(function(data) {
    document.getElementById("upcount").innerHTML = `${data.upvotes} upvotes`;
    document.getElementById("downcount").innerHTML = `${data.downvotes} downvotes`
    document.getElementById("sum").innerHTML = `sum of votes: ${data.sumvotes}`;
  });

});
});
