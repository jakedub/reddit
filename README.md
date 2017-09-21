# Reddit
Normal mode is a simple, naive, implementation of Reddit

# Explorer Mode
* Reddit is "User-generated news links. Votes promote stories to the front page."
* Each Link should have many Votes associated with it.
* The homepage should order by the most number of votes
* Clicking on a link should create a positive vote and then send the user to the link in question
* Click on a vote link or button should also create a positive vote
* Display the number of votes next to the link title, the link title will be linked (and eventually end up at the url of the link you clicked), and an optional summary of the link
* Scaffold is fine

1. Controllers
2. Models
3. Views
4. Routes

Routes:
User handled through devise
Links use resources: Links

Models
User: (probably devise)
username
Email
password

Links:
url:string
title:string
user: references (added later)

Votes
user: references (added later)
link:references (added later)
up:boolean


Migrations: Links, devise, AddUserToLinks, AddLinksToVotes
Associations: User has_many :links, Links belongs_to :user, Votes belongs_to :link, Links has_many :votes
Controllers:
Vote validation
validates :user_id, :uniqueness => { :scope => :link_id }


# Adventure Mode
* Clicking "DOWN" should create a negative vote
* Add a `User` who `has_many` links
* When submitting a link, allow user to select themselves in a drop down. Note:  You'll also need to have a way for a user to add themselves.
* Check the Links for unique URLs and if the link already exists, add a vote and send them to the home page

# Epic Mode
* Links should have a category or subreddit. And you can pick that when creating a link
* Style things a bit better using bootstrap rather than the default scaffold HTML and styling

# Insane Mode
* Create a subfolder for each "sub-reddit", like LOL and Gifs. Going to a url like `/lol` should show all the links in that subreddit
* You should validate that a potential subreddit name doesn't conflict with a resource name
* Create a user profile page that includes all the links a user has submitted. `/users/:username`




# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
