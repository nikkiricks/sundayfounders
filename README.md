# Sunday Founders

INSERT LINK TO FINAL HEROKU HERE

A CRUD Ruby app that's a transparency platform on investors for startup founders. A place for founders to get information, and rate and review their investors.

INSERT PICTURE OF FINAL WEBSITE HERE

# Languages used

* Ruby
* Sinatra
* CSS

## Planning Process

### Choosing a CRUD idea
I was deciding between two CRUD apps, this one and Soapbox. Soapbox is a public speaker marketplace, where event organizers can book speakers that have signed-up. I decided to go with this one as the public speaker platform would require double sided login process and booking links to be functional. Sunday Founders only requires one login. I also care deeply about Sunday Founders as I believe it will help founders in the fundraising process.

### Creating wireframes
I wanted to see what an MVP could look like so I tried to strip down all the functions I wanted to just what I needed.
![](images/SF_Wireframe_1.jpg)

And then added on a login function:
![](images/SF_Wireframe_2.jpg)

Then added what features for version 3,4,5 could look like:
![](images/SF_Wireframe_3.jpg)

I then thought through what tables in my database I needed. I realized later that I would need 2 tables for investors. One that listed the investors, and another that would be multiple ratings and reviews for each investor, that tracked the investor id and the user id that submitted the rating. The third table would then be a user table.
![](images/SF_Wireframe_3.jpg)

I then created a [Figma wireframe](https://www.figma.com/file/EJrlAjbWp9QnHLmHJqmAgV/Sunday-Founders?node-id=0%3A1) to help visualize the layout.

### Writing to-do list

## Challenges

* Understanding how to get the two databases to talk to one another
* Login process and deciding what information I wanted the user to be able to see before signing-up.

## Lessons learned

## Unsolved problems and bonus features

* I would love to make a discussion platform feature eventually, possibly using [Discourse](https://www.discourse.org/), an open source plug-in. 

