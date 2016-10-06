$('#upvote-button').on('click', function(event) {
  event.preventDefault();

  var request = $.ajax({
    method: 'POST',
    url: '/reviews/:id/upvote',
    dataType: 'JSON'
  });


  request.done(function(upVote) {
    alert(upVote.foo);
  });
});
