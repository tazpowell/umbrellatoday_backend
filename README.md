# UmbrellaToday
- Deployed front-end: https://tazukopowell.com/umbrellatoday_frontend
- Deployed back-end: https://floating-earth-61602.herokuapp.com
- Front-end repo: https://github.com/tazpowell/umbrellatoday_frontend

## Back-end
This repo is the back-end for my UmbrellaToday web app.
It uses weather data to determine if you need to bring an umbrella with you today.

## Technologies
Ruby, Ruby on Rails

## Development Process
#### Planning
I was excited to incorporate a third-party API into my final project app. After doing research on available weather APIs, I picked the DarkSky API because their data includes precipitation probability. Since their API requires a request with lat/long values, I also looked into geocoding resources and found geocode.xyz.

Next, I planned the functionality and basic layout, using the ERD and user stories as a basis. I created both front and back end repos and started building my resources in Rails.

#### Problem Solving
My biggest unknown was working with the DarkSky API. I used the HTTParty gem to make the GET requests from my backend. After reviewing docs, other example code using HTTParty and/or DarkSky API, I was able to successfully retrieve weather data based on any valid lat/long values.

Then I created CURL scripts to test all the resources (users, locations, coordinates, forecasts) and moved on to build the front end that would interact with the back end.

After the front and back end interacted with each other successfully, I focused on the UI.

#### Future Iterations
Additional features would be to update the Add New Locations form so users can look up locations by name, similar to the Find By Name form above it. On the front end, I also removed the 'default' field on a user's locations -- but I would like to build the functionality for user's to select one default location that would load when they sign in.

I'm also interested in exploring HTMLCanvas to possibilty add some animated rain drops when the answer is yes.

## Set up on localhost
- Fork and clone
- Install dependencies with `bundle install`
- Create a `.env` for sensitive settings (`touch .env`).
- Generate new `development` and `test` secrets (`bundle exec rails secret`).
- Store them in `.env` with keys `SECRET_KEY_BASE_<DEVELOPMENT|TEST>` respectively.

### Setup database
- bin/rails db:create
- bin/rails db:migrate
- Run the API server with `bin/rails server` or `bundle exec rails server`.

## ERD and routes
[ERD](https://drive.google.com/file/d/13Xs_CjXJ809y6wx0L2vnROrJLsU-wyU3/view?usp=sharing)


### Locations
| Verb   | URI Pattern            | Controller#Action   |
|--------|------------------------|---------------------|
| GET    | `/locations`           | `locations#index`   |
| GET    | `/locations/:id`       | `locations#show`    |
| POST   | `/locations`           | `locations#create`  |
| PATCH  | `/locations/:id`       | `locations#update`  |
| DELETE | `/locations/:id`       | `locations#destroy` |

All locations CRUD requests must include a header "Authorization: Token token=${TOKEN}".

---
#### GET /locations

Request:

```sh
curl "https://floating-earth-61602.herokuapp.com/locations" \
  --include \
  --request GET \
  --header "Authorization: Token token=${TOKEN}"
echo
```

```sh
TOKEN='BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f' sh scripts/locations/get-locations.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "locations": [
    {
      "id": 1,
      "name": "Boston, MA",
      "lat": "42.35843",
      "long": "-71.05977",
      "default": false,
      "user": {
        "id": 1,
        "email": "sample@email.com"
      }
    },
    {
      "id": 2,
      "name": "NYC",
      "lat": "40.785091",
      "long": "-71.05977",
      "default": false,
      "user": {
        "id": 1,
        "email": "sample@email.com"
      }
    }
  ]
}
```
---
#### GET /locations/:id

Request:

```sh
curl "https://floating-earth-61602.herokuapp.com/locations/${ID}" \
  --include \
  --request GET \
  --header "Authorization: Token token=${TOKEN}"

echo
```

```sh
ID=2 TOKEN='BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f' sh scripts/locations/get-one-location.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "id": 2,
  "name": "NYC",
  "lat": "40.785091",
  "long": "-71.05977",
  "default": false,
  "user": {
    "id": 1,
    "email": "sample@email.com"
    }
  }
}
```
---
#### POST /locations

Request:

```sh
curl "https://floating-earth-61602.herokuapp.com/locations" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "location": {
      "name": "'"${NAME}"'",
      "lat": "'"${LAT}"'",
      "long": "'"${LONG}"'",
      "default": "'"${DEFAULT}"'"
    }
  }'

echo
```

```sh
NAME='Tokyo, JP' LAT=35.68536 LONG=139.753372 DEFAULT=true TOKEN='BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f' sh scripts/locations/create-location.sh
```

Response:

```md
HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8

{
  "location": {
    "id": 3,
    "name": "Tokyo, JP",
    "lat": "35.68536",
    "long": "139.753372",
    "default": true,
    "user": {
      "id": 1,
      "email": "sample@email.com"
    }
  }
}
```
---
#### PATCH /locations/:id

Request:

```sh
curl "https://floating-earth-61602.herokuapp.com/locations/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "location": {
      "name": "'"${NAME}"'",
      "lat": "'"${LAT}"'",
      "long": "'"${LONG}"'",
      "default": "'"${DEFAULT}"'"
    }
  }'

echo
```

```sh
ID=3 NAME='Tokyo, JAPAN' LAT=35.68536 LONG=139.753372 DEFAULT=false TOKEN='BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f' sh scripts/locations/update-location.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "location": {
    "id": 3,
    "name": "Tokyo, JAPAN",
    "lat": "35.68536",
    "long": "139.753372",
    "default": false,
    "user": {
      "id": 1,
      "email": "sample@email.com"
    }
  }
}
```
---
#### DELETE /locations/:id

Request:

```sh
curl "https://floating-earth-61602.herokuapp.com/locations/${ID}" \
  --include \
  --request DELETE \
  --header "Authorization: Token token=${TOKEN}"
echo

```

```sh
ID=3 TOKEN='BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f' sh scripts/locations/delete-location.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

### Forecasts
| Verb   | URI Pattern            | Controller#Action |
|--------|------------------------|-------------------|
| GET    | `/forecasts`           | `forecasts#index` |

---
#### GET /forecasts

Request:

```sh
curl "https://floating-earth-61602.herokuapp.com/forecasts" \
  --include \
  --request GET \
  --header "Content-Type: application/json" \
  --data '{
    "location": {
      "lat": "'"${LAT}"'",
      "long": "'"${LONG}"'"
    }
  }'
echo
```

```sh
LAT=35.68536 LONG=-71.05977 sh scripts/forecasts/get-forecast.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{ "latitude": 42.35843,
  "longitude": -71.05977,
  "timezone": "America/New_York",
  "daily": {
    "summary": "Light rain today through Monday, with high temperatures falling to 74°F on Saturday.",
    "icon": "rain",
    "data":[
      { "time":1533787200,
        "summary":"Partly cloudy until evening and humid throughout the day.",
        "icon": "partly-cloudy-day",
        "sunriseTime": 1533808001,
        "sunsetTime": 1533858928,
        "moonPhase": 0.94,
        "precipIntensity": 0.0025,
        "precipIntensityMax": 0.0252,
        "precipIntensityMaxTime": 1533805200,
        "precipProbability": 0.81,
        "precipType": "rain",
        ... ]},
        "offset": -4
        }
```

### Coordinates
| Verb   | URI Pattern            | Controller#Action   |
|--------|------------------------|---------------------|
| GET    | `/coordinates`         | `coordinates#index` |

---
#### GET /coordinates

Request:

```sh
curl "https://floating-earth-61602.herokuapp.com/forecasts" \
  --include \
  --request GET \
  --header "Content-Type: application/json" \
  --data '{
    "query": {
      "name": "'"${NAME}"'",
      "region": "'"${REGION}"'"
    }
  }'
echo
```

```sh
NAME='Boston, MA' REGION='US' sh scripts/coordinates/get-coordinates.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "standard":{
    "addresst": {},
    "city": "Boston",
    "prov": "US",
    "countryname": "United States of America",
    "postal":{},
    "confidence":"0.8"
    },
  "longt":"-71.06676",
  "alt":{},
  "elevation":{},
  "latt":"42.33331"
  }
```

### User authentication
| Verb   | URI Pattern            | Controller#Action |
|--------|------------------------|-------------------|
| POST   | `/sign-up`             | `users#signup`    |
| POST   | `/sign-in`             | `users#signin`    |
| PATCH  | `/change-password`     | `users#changepw`  |
| DELETE | `/sign-out`            | `users#signout`   |

---
#### POST /sign-up

Request:

```sh
curl "https://floating-earth-61602.herokuapp.com/sign-up" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "'"${EMAIL}"'",
      "password": "'"${PASSWORD}"'",
      "password_confirmation": "'"${PASSWORD}"'"
    }
  }'
echo
```

```sh
EMAIL=sample@email.com PASSWORD=sample sh scripts/auth/sign-up.sh
```

Response:

```md
HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "sample@email.com"
  }
}
```
---
#### POST /sign-in

Request:

```sh
curl "https://floating-earth-61602.herokuapp.com/sign-in" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "'"${EMAIL}"'",
      "password": "'"${PASSWORD}"'"
    }
  }'
echo
```

```sh
EMAIL=sample@email.com PASSWORD=sample sh scripts/auth/sign-in.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "sample@email.com",
    "token": "BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f"
  }
}
```
---
#### PATCH /change-password

Request:

```sh
curl "https://floating-earth-61602.herokuapp.com/change-password" \
  --include \
  --request PATCH \
  --header "Authorization: Token token=${TOKEN}" \
  --header "Content-Type: application/json" \
  --data '{
    "passwords": {
      "old": "'"${OLDPW}"'",
      "new": "'"${NEWPW}"'"
    }
  }'
echo
```

```sh
OLDPW='sample' NEWPW='elpmas' TOKEN='BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f' sh scripts/auth/change-password.sh
```

Response:

```md
HTTP/1.1 204 No Content
```
---
#### DELETE /sign-out

Request:

```sh
curl "https://floating-earth-61602.herokuapp.com/sign-out" \
  --include \
  --request DELETE \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}"
echo
```

```sh
TOKEN='BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f' sh scripts/auth/sign-out.sh
```

Response:

```md
HTTP/1.1 204 No Content
```
