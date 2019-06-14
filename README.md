# Driftrock's Developer Test 
Welcome to Driftrock's take home developer test! Before you read on there are a few things to note: 

Most importantly, if you have any questions, ask us. Email us and we'll get back to you as soon as we can, we're not trying to catch you out and if you're unsure about anything we would prefer that you check with us.

We're aware that you likely have other time commitments. As a guide, we expect the test to take a few hours and we expect the solution back in a week. Hopefully, that means you can spread those few hours out over several days rather than doing it all in one go. 

The example we give below uses Ruby, however you should feel free to use whichever language you find most comfortable. You can use any widely known and supported libraries. Please submit your solution via a GitHub link or alternatively send us a zip file. 

Please ensure that your code has adequate documentation (when assessing documentation we review the README, the commit history, the naming of variables and functions, and any comments you have included). 

Somewhere in your documentation please express your thought process and any design decisions you have made. 

In your README please include all the necessary information on how to run your code/tests, an Architecture-like overview and any ideas on how you think your code could be improved. Please make sure you name variables/functions/classes sensibly. Write the code to be simple and readable, other people should be able to understand and navigate your code without the need to ask you for help. The code should be split up into multiple files. 

We expect to see meaningful tests with a reasonable amount of coverage included in the codebase. Please make sure they're passing before you submit your solution. Dealing with edge cases, if any should occur to you, is a bonus but not mandatory. The above requirements are what we expect from each other everyday at work, therefore your code will be reviewed along these lines. 

We know that not all the code someone produces is perfect, therefore we are not necessarily looking for the perfect solution. What we would really like to see is your coding preferences, attention to detail, and the development principles you believe in. You can find more info on how we evaluate your test and about our general hiring practices here. 

## Overview 
The test is based around producing an app that can answer some questions about data held in a public API. The API and the questions are detailed below. A lot of the work we do at Driftrock involves the creation of APIs and communicating with both these internally created APIs and externally managed ones. Doing this test will involve having to work out how best to merge data returned from two different end points. 
## What you have: 
You have been given access to a JSON API on https://driftrock-dev-test.herokuapp.com There are 2 endpoints, 1 for user data (/users) and another for purchase (/purchases) data. More information can be found in the documentation here http://docs.driftrockdevtest.apiary.io/#. 

### User data looks like this: 
```
{ 
  "data": [{
    "id": "12DF-2324-GA2D-31RT",
    "first_name": "Drift",
    "last_name": "Rock",
    "phone": "0-200-100-1234",
    "email": "drift.rock@email.com"}, ... ] 
} 
```
### Purchases data looks like this: 
```
{ 
  "data": [{
    "user_id": "12DF-2324-GA2D-31RT",
    "item": "Huge pineapple pizza",
    "spend": "19.99"
    }, {
    "user_id": "12DF-2324-GA2D-31RT",
    "item": "A nice cup of tea",
    "spend": "2.99"}]
} 
```

## Your task 
Create a script that can be run from the command line and can answer the questions listed below. The script accepts one parameter to specify which question it will answer and in some cases an optional argument. The script will print the answer to the console output. 
`ruby app.rb COMMAND PARAMETERS`

The script should implement these commands: 
1. most_sold: What is the name of the most sold item?
2. total_spend [EMAIL]: What is the total spend of the user with this email address [EMAIL]?
3. most_loyal: What is the email address of the most loyal user (the person with the most number of items bought)? 

e.g.
```
$ ruby app.rb total_spend drift.rock@email.com`
22.98 

$ ruby app.rb most_loyal
drift.rock@email.com 
```

Good luck! 

## NOTES

Bundle up to load the necessary gems: `bundle install`
You will need ruby 2.6.2 to run

To run the test suite just do `./scripts/test`
To open a console and fiddle around do `./scripts/console`

## Architecture

I've purposely tried to keep this as simple as possible and bring in as few gems as I can.

1. ActiveResource: To connecto to the api easily
2. ActiveSupport: To be able to do `Array#sum`
3. Mocha: For easy stubbing
4. Pry: Much better app console than standard irb + better breakpoints

This app follows a very simple architecture.
Phases are:
1. Run `app.rb`
2. Instantiate `Parser` to parse out the options
3. Instantiate appropriate `command` to do the actual work (Standard Command pattern)
4. Load model data via `ActiveResource`

Because the API does not support all options (like searching via API) I just hack the finders a bit to allow the app to use the same classic AR patterns (where...)

![Paper Misc 1](https://user-images.githubusercontent.com/419903/59505532-f1dc3780-8ea5-11e9-9e2d-924ff54373ac.png)



