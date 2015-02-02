#Instagram Clone

[![Code Climate](https://codeclimate.com/github/nickbdyer/instagram-clone/badges/gpa.svg)](https://codeclimate.com/github/nickbdyer/instagram-clone)

Week 8 Challenge at Makers Academy

###The Challenge

Instagram using Rails. 

> You'll need users who can
> post pictures, write comments on pictures and like a picture. It will need to
> look like the instagrams website or better.
> 
> Breakdown of models:
> 
> User
> Post
> Comment/description
> Like

###Solution

Following a similar construction pattern to that of the Yelp App, the Post,
comment and like models were created first. Followed by the User model which
was then used to restrict functionality that was available to users. 

I opted to use Bootstrap-Rails for the CSS, just to discover how it formatted
documents. It actually makes quite a usable administration type interface, but
is not acceptable as final user interface.

It was useful to continue getting aquainted with Active Record and Devise,
although both systems are too large to grasp fully in such a short project. 

###How to Run

#####Program
```sh
$ bin/rails s
```

#####Test Suite

```sh
$ rspec
```

###Images

#####Signed In

![alt text](images/SignedIn.png
"Signed In User Interface")

#####Signed Out

![alt text](images/SignedOut.png
"Signed Out User Interface")

###Improvements

- CSS to improve the UX
- Create a fixed scroll of comments below each post
- Allow Geo Location to be captured with Posts
- Improve testing coverage



