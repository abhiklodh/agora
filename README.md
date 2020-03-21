# Agora

## Development

Setup: `docker-compose build`

Run: `docker-compose up --remove-orphans`

# Deployment

Sour code: `git push heroku master`

Migrations: `heroku run rake db:migrate`
