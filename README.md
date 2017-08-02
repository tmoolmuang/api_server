# Alien Archive   [![Build Status](https://travis-ci.org/tmoolmuang/api_server.svg?branch=master)](https://travis-ci.org/tmoolmuang/api_server)

An objective of this project is to demonstrate the use of RESTful API.
Alien Archive was declassified and released by The National Faker Gem Associations. It contains infomation of aliens collected 
during the period of red scare. Seriously, Alien Archive was created as a simple parent-child relationship where an alien can 
have many powers. An application itself is served as a basic CRUD, but it was built with features where registered user can update
resources via API. In order to use API, a user must register to get an api_key. 

The server is currently running on 
https://api-tm.herokuapp.com/

# API Document
#### Show All Aliens 
**GET**  `https://api-tm.herokuapp.com/api/v1/aliens` <br>
**header:**  `{ Key: Authorization, Value: Token token=api_token }` <br><br>
#### Show an Alien
**GET**  `https://api-tm.herokuapp.com/api/v1/aliens/id` <br>
**header:**  `{ Key: Authorization, Value: Token token=api_token }` <br><br>
#### Create a new Alien
**POST**  `https://api-tm.herokuapp.com/api/v1/aliens` <br>
**header:**  `{ Key: Authorization, Value: Token token=api_token
  Key: Content-Type, Value: application/json  }` <br>
**body:**  `{ "name": "Spiderman", "year": 2001, "month": 2, "origin": "earth" }`<br><br>
#### Update an existing Alien
**PUT**  `https://api-tm.herokuapp.com/api/v1/aliens/id` <br>
**header:**  `{ Key: Authorization, Value: Token token=api_token
  Key: Content-Type, Value: application/json  }` <br>
**body:**  `{ "origin": "mars" }`<br><br>
#### Delete an Alien
**DELETE**  `https://api-tm.herokuapp.com/api/v1/aliens/id` <br>
**header:**  `{ Key: Authorization, Value: Token token=api_token }` <br><br>
********
#### Show all Powers of an Alien 
**GET**  `https://api-tm.herokuapp.com/api/v1/aliens/id/powers` <br>
**header:**  `{ Key: Authorization, Value: Token token=api_token }` <br><br>
#### Show a single Power of an Alien 
**GET**  `https://api-tm.herokuapp.com/api/v1/aliens/id/powers/power_id` <br>
**header:**  `{ Key: Authorization, Value: Token token=api_token }` <br><br>
#### Create a new Power for an existing Alien
**POST**  `https://api-tm.herokuapp.com/api/v1/aliens/id/powers` <br>
**header:**  `{ Key: Authorization, Value: Token token=api_token
  Key: Content-Type, Value: application/json  }` <br>
**body:**  `{ "ability": "fly" }`<br><br>
#### Update a Power of an existing Alien
**PUT**  `https://api-tm.herokuapp.com/api/v1/aliens/id/powers/power_id` <br>
**header:**  `{ Key: Authorization, Value: Token token=api_token
  Key: Content-Type, Value: application/json  }` <br>
**body:**  `{ "ability": "invisibility" }`<br><br>
#### Delete a Power of an Alien
**DELETE**  `https://api-tm.herokuapp.com/api/v1/aliens/id/powers/power_id` <br>
**header:**  `{ Key: Authorization, Value: Token token=api_token }` <br><br>
