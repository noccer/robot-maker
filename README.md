# Robot Maker

The key features I wanted in my game were:

- A game that is simple to look at and is mobile responsive.
- An option to vary the grid size from a 3x3 grid to a 5x5 grid.
- For larger grids, an option to choose how many tiles in a row win the game.

## Technologies Used

- HTML5
- CSS3 - Many transition effects!
- Google Fonts
- Ruby Programming Language
- Ruby on Rails Framework
- HTTParty gem - to capture API data
- The openweathermap.org API - to find the weather for various robot locations
- The quotesondesign.com API - to give the robots random quotes
- Faker gem - to generate random robot names
- robohash.com to generate random 'profile' pictures
- A SQL script found at https://gist.github.com/randomecho/5020859 to help me seed all the suburb details into a database
- For version control I relied on Dropbox instead of Git (reason outlined later)

## Approach Taken

To fulfil the brief requirements, I opted to create a 'Robot Maker' app that would allow users to:

- Sign up
- Log in
- Create robots
- Update their robots
- Delete their robots

I created 3 models/tables:

- Users - self explanatory, storing user names, email addresses, id's etc.
- Robots - storing robot id's, postcodes, suburbs, image strings etc.
- Suburbs - a table of all suburbs in Australia generated from suburb_seeds.rb file

## Unsolved Problems

- If a user visits any of the pages that are usually protected by login, the app crashes. Need to fix this.
- I would like to have a google map on the show.html.erb for each robot to show where they are from.
- I would really like to have a function that autocompletes suburbs based on the suburb database. The easiest way I can think of doing this is to just collect a postcode in the form, then match this against a suburb in the database and use that. The problem with this method is that only the first postcode will be used, therefore you could never select 'Kensington' for 3031 as it would always choose 'Flemington' isntead.

## Features Left Out

- Google Maps integration
- Autocomplete in the new robot generator as mentioned above.

## Dropbox -vs- Git

Because I was still getting my bearings with rails, I decided to go against convention for this project and not commit to Git after the initial commit. There are 2 very good reasons for this:

1. All my files are continuously backed up in Dropbox already
2. In my text editor Atom, there is a great feature that shows you visible changes since your last commit. While learning Rails I have relied heavily on this because it shows me what files are generated when we run `rails g controller ###`, or what changes are made to the schema when a migration is run.

For future projects I will return to Git

## Report / Conclusion

I was a little slower to understand the Rails concept later than other class members which was somewhat disappointing and left me with little time to build my app. Initially I wanted to integrate with FitBit and collect user data but I decided to tackle this project at a later stage when I have improved my rails skills.

I really enjoyed pulling apart the SQL file in MS Excel and reconstructing it as a seed file. Perhaps I should have integrated with a postcode API instead.

The most difficult part of the app for me was updating the robot data. For some reason, no matter what classroom examples I looked back on, none of them seemed to work and it took me a very long time to get this basic functionality working correctly.

Overall I am disappointed with the app because it is far below the standards of my peers. However I am certain that with more time and practice I will be able to unlock the many great possibilities in Rails.

## My GitHub Repo

<https://github.com/noccer2016/robot-maker>

## Hosted Version of My Game
TBA
