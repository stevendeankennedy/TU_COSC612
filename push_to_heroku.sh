heroku maintenance:on
git push heroku
heroku pg:reset DATABASE
heroku run rails db:migrate
heroku run rails db:seed
heroku restart
heroku maintenance:off