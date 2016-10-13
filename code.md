RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.after(:suite) do
  end
end

config.before(:all) do
  DatabaseCleaner.clean_with(:truncation, reset_ids: true)
end

config.before(:all) do
  DatabaseCleaner.strategy = :truncation, { reset_ids: true }
end

config.before(:all, js: true) do
  DatabaseCleaner.strategy = :truncation, { reset_ids: true }
end

config.before(:all) do
  DatabaseCleaner.start
end

config.before(:all) do
  DatabaseCleaner.clean
end

config.after(:all) do
  DatabaseCleaner.start
end

config.after(:all) do
  DatabaseCleaner.clean
end

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
