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


[https://github.com/josh-works/github_authorization_practice/commit/aa0f5c9](https://github.com/josh-works/github_authorization_practice/commit/aa0f5c9)


