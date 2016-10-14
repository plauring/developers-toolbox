function upvoteButton () {
  event.preventDefault();
    var id = event.currentTarget.id;
    var request = $.ajax({
      url: `/reviews/${id}/upvote.json`,
      method: 'POST',
      error: function() {
        alert('Please sign in!');
      }
    });

    request.done(function(data) {
      document.getElementById(`upcount${id}`).innerHTML = `${data.upvotes} upvotes`;
      document.getElementById(`downcount${id}`).innerHTML = `${data.downvotes} downvotes`;
      document.getElementById(`sum${id}`).innerHTML = `sum of votes: ${data.sumvotes}`;
    });
  };

  function downvoteButton () {
    event.preventDefault();
      var id = event.currentTarget.id;
      var request = $.ajax({
        url: `/reviews/${id}/downvote.json`,
        method: 'POST',
        error: function() {
          alert('Please sign in!');
        }
      });

      request.done(function(data) {
        document.getElementById(`upcount${id}`).innerHTML = `${data.upvotes} upvotes`;
        document.getElementById(`downcount${id}`).innerHTML = `${data.downvotes} downvotes`;
        document.getElementById(`sum${id}`).innerHTML = `sum of votes: ${data.sumvotes}`;
      });
    };

  
