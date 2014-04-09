# Bookmark Manager

Weeks 6/7 Project for Makers Academy - creating an app to store links to your favourite web pages. As a two week project to learn a variety of technologies (DataMapper/BCrypt/Javascript/Modular Sinatra/others), there are a few rough edges in places, but largely everything's ok. This one isn't online.

## How it works

Essentially, it's meant to function a bit like Delicious did (does? did? is it still around?). The main page has a feed of all links added by all users. You can sign up and sign in, and add links yourself. Links are added with tags, and you can filter all links by the tags they have. You can star links you like. Forms for authnetication and new links are added to the page with AJAX instead of directing you to a new page. Once you're done, you can sign out.

It looks a little like this

![Bookmark Manager Home Page](https://raw.githubusercontent.com/NotTheUsual/bookmark-manager/master/screenshots/BM-index.png)

## How it doesn't work

As I said earlier, there are some gaps. You don't need to be signed in to post a link, and even if you are signed in, the link isn't credited to your name (or associated with you at all). When you do sign up, the interface doubles (which I remember fixing, but have no idea how...). Favourites aren't actually stored yet (the code contains the beginnings of an attempt to make that work... which breaks all the rspec tests...), so don't persist between requests. There's also no way to edit the text of the link. Still, the main functionality is all there and many of the rough areas were covered with far more polish in the tests for these two weeks, [Chitter](https://github.com/NotTheUsual/chitter) (for the backend) and [Twitter-clone](https://github.com/NotTheUsual/twitter-clone) (for the frontend). See them for versions of this project with a little added experience.