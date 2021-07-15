# Zero to MVP with Omniauth-Github

I want to have an app deployed on Heroku where one can log in via Github. 

It'll live live somewhere, as proof. 

Working through [https://github.com/josh-works/devise_practice_02](https://github.com/josh-works/devise_practice_02), where I finally (for like the third time) found a good guide to setting up Devise and authentication via Github.

# The Steps

I'm going to "narrarate" every step of this repositoiry, and the linked Heroku application.

## Rails new, and adding Git

I have `rails 6.1.4` installed as my newest version:

```
$ rails new github_authorization_practice
```

Wait for the terminal to finish `rails new-ing`, and:

```
cd github_authorization_practice
hub create
ga .
gc -m "initial commit: rails new github_authorization_practice"
```

And we're off!

[https://github.com/josh-works/github_authorization_practice/commit/aa0f5c9](https://github.com/josh-works/github_authorization_practice/commit/aa0f5c9)

## Add `devise` to Gemfile, run installer

1. add `devise` to Gemfile
2. run `rails g devise:install`

Add all and commit:

[https://github.com/josh-works/github_authorization_practice/commit/8b602f4](https://github.com/josh-works/github_authorization_practice/commit/8b602f4)

You can run `b rails s` and head to `localhost:3000` now if you want to see things happen in a browser

## Set Root

Update `routes.rb` to use a root URL:

```ruby
# config/routes.rb

  root to: "home#index"
```

[https://github.com/josh-works/github_authorization_practice/commit/42085dc](https://github.com/josh-works/github_authorization_practice/commit/42085dc)


If you reload your page, you'll get an `Uninitialized Constant: HomeController`

## Create Home#index

```ruby
# app/controllers/home_controller.rb
class HomeController < ApplicationController
  def index
  end
end

```
[https://github.com/josh-works/github_authorization_practice/commit/990babc](https://github.com/josh-works/github_authorization_practice/commit/990babc)

Reload the page, now complains about the view

## Create view

```erb
# app/views/home/index.html.erb
<h1>I'm in index.html.erb</h1>
```
[https://github.com/josh-works/github_authorization_practice/commit/9bf1a56](https://github.com/josh-works/github_authorization_practice/commit/9bf1a56)

## Show "login" or "logout" if current user is signed in

In the view, add logic around the current_user:

```html
<!-- app/views/home/index.html.erb -->
<h1>I'm in index.html.erb</h1>

<% if user_signed_in? %>
	  <h1>User is LOGGED IN! :)</h1>
<% else %>
	  <h1>User is NOT logged in! :(</h1>
<% end %>
```

[https://github.com/josh-works/github_authorization_practice/commit/88b2c02](https://github.com/josh-works/github_authorization_practice/commit/88b2c02)

Reload the page. You'll get a no method error on `user_signed_in?`.

Lets fix this.

## Add Devise to User model:

```
$ rails generate devise User

=> Running via Spring preloader in process 69055
      invoke  active_record
      create    db/migrate/20210715031134_devise_create_users.rb
      create    app/models/user.rb
      invoke    test_unit
      create      test/models/user_test.rb
      create      test/fixtures/users.yml
      insert    app/models/user.rb
       route  devise_for :users
```

Look at the files Devise created, especially the migration. Leave it alone for now, but deff take a look.

```
rails db:migrate
```

Now I'm here:

[https://github.com/josh-works/github_authorization_practice/commit/e6edae9](https://github.com/josh-works/github_authorization_practice/commit/e6edae9)

Reload the page. No more do you get a `no method error` on `user_signed_in?`

## Add an easy way to sign up/sign in

Now we've got to make it easy for users to sign in.

```diff
 <% if user_signed_in? %>
-         <h1>User is LOGGED IN! :)</h1>
+  <h2>Welcome <%= current_user.email %></h2>
+         <h1>You are logged in! :)</h1>
+    <%= link_to "log out", destroy_user_session_path %>
 <% else %>
-         <h1>User is NOT logged in! :(</h1>
+         <h1>No one is logged in! :(</h1>
+    <%= link_to "log in", new_user_session_path %>
```

[https://github.com/josh-works/github_authorization_practice/commit/5e6e3df](https://github.com/josh-works/github_authorization_practice/commit/5e6e3df)

reload the page. See that "log in" button? click it. Enjoy the error message:

```
Completed 500 Internal Server Error in 26ms (ActiveRecord: 0.0ms | Allocations: 5923)

ActionView::Template::Error (undefined method `session_path' for #<ActionView::Base:0x007fb070497b90>
Did you mean?  session):
    1: <h2>Log in</h2>
    2:
    3: <%= form_for(resource, as: resource_name, url: session_path(resource_name)) do |f| %>
    4:   <div class="field">
    5:     <%= f.label :email %><br />
    6:     <%= f.email_field :email, autofocus: true, autocomplete: "email" %>
```

## Generate Devise views

Also from the instructions after installing devise:

```
rails g devise:views
```
--------- 

localhost:3000/users/sign_up
## add flash messages

Per the instructions after running `rails devise:install`


```html
<!-- app/views/layouts/application.html.erb -->
<p class="notice"><%= notice %></p>
<p class="alert"><%= alert %></p>
```
