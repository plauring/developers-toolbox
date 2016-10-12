$(document).ready (function() {

  $(`.upvoteButton`).on('click', function(event) {
    event.preventDefault();
    var targetReview = this.parentElement.action;
    var id = this.id;

    var request = $.ajax({
      url: `${targetReview}.json`,
      method: 'POST',

    });
    request.done(function(data) {
      document.getElementById(`upcount${id}`).innerHTML = `${data.upvotes} upvotes`;
      document.getElementById(`downcount${id}`).innerHTML = `${data.downvotes} downvotes`;
      document.getElementById(`sum${id}`).innerHTML = `sum of votes: ${data.sumvotes}`;
    });

  });

  $(`.downvoteButton`).on('click', function(event) {
    event.preventDefault();
    var targetReview = this.parentElement.action;
    var currentTarget = $(event.currentTarget);
    var id = this.id;

    var request = $.ajax({
      url: `${targetReview}.json`,
      method: 'POST',

    });

    request.done(function(data) {
      document.getElementById(`upcount${id}`).innerHTML = `${data.upvotes} upvotes`;
      document.getElementById(`downcount${id}`).innerHTML = `${data.downvotes} downvotes`;
      document.getElementById(`sum${id}`).innerHTML = `sum of votes: ${data.sumvotes}`;
    });

  });
});
