# Shelbyville sucks!
Simpsons Characters as a Service

![N|Solid](https://i.redditmedia.com/sEXLnlcc1ABfnEYaoe7ag3zSEG5Fop4-52__l0A8DwU.jpg?w=640&s=a503d90892240c8ff67c2dc066033528)

# What?
Seeds an Intercom app with test users who happen to be the most famous characters from the Simpsons

# Why?
Get out

# How?
After cloning the repo install dependancies: 
 - `bundle install`
 - `pip install -r requirements.txt`

And set your Intercom access token as a shell variable `INTERCOM_PAT`

Scrape IMDB for a list of character names and dump them to JSON with the `python main.py`. This also generates an email for each user. Can manually approve each name in case you dislike any of the characters. 

Then create the users in Intercom with `ruby main.rb`

//TODO: Avatars, how do they work
