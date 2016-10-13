// $(document).ready (function() {
//
//   $(`.upvoteButton`).on('click', function(event) {
//     event.preventDefault();
//     var targetReview = this.parentElement.action;
//
//     var id = this.id;
//
//     var request = $.ajax({
//       url: `${targetReview}.json`,
//       method: 'POST',
//       error: function() {
//         alert('Please sign in!');
//       }
//     });
//
//     request.done(function(data) {
//       document.getElementById(`upcount${id}`).innerHTML = `${data.upvotes} upvotes`;
//       document.getElementById(`downcount${id}`).innerHTML = `${data.downvotes} downvotes`;
//       document.getElementById(`sum${id}`).innerHTML = `sum of votes: ${data.sumvotes}`;
//     });
//   });
//
//   $(`.downvoteButton`).on('click', function(event) {
//     event.preventDefault();
//     var targetReview = this.parentElement.action;
//     var id = this.id;
//
//     var request = $.ajax({
//       url: `${targetReview}.json`,
//       method: 'POST',
//       error: function() {
//         alert('Please sign in!');
//       }
//     });
//
//     request.done(function(data) {
//       document.getElementById(`upcount${id}`).innerHTML = `${data.upvotes} upvotes`;
//       document.getElementById(`downcount${id}`).innerHTML = `${data.downvotes} downvotes`;
//       document.getElementById(`sum${id}`).innerHTML = `sum of votes: ${data.sumvotes}`;
//     });
//
//   });
// });

<h1>Devtools</h1>

<%= form_tag(devtools_path, method: :get) do %>
    <%= text_field_tag :search, params[:search] %>
    <%= submit_tag "Search", title: nil %>
<% end %>

<% if !current_user.nil? && current_user.admin? %>
  <h1>Welcome Super Elite Group 8 member, you are a member
    of an exclusive, Clandestine, and Dope AF club.</h1>
<% end %>

<% @devtools.each do |devtool|%>
  <li><%= link_to devtool.title, devtool_path(devtool) %>
    <% if !current_user.nil? && current_user.admin? %>
      <%= link_to 'delete', devtool, method: :delete %>
    <% end %>
  </li>
<% end %>

<div><%= link_to "Add New Dev Tool", new_devtool_path %></div>
