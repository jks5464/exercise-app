# Girl Scout Cookies Exercise Tracker


### Setup

1. Install chrome. This is required to run cucumber tests

`
sudo curl https://intoli.com/install-google-chrome.sh | sudo bash
`

**Production URL: https://exercise-track-app.herokuapp.com/**
1. To reset the production database on heroku

`
heroku restart -a exercise-track-app; heroku pg:reset DATABASE --confirm exercise-track-app -a exercise-track-app; heroku run rake db:migrate db:seed -a exercise-track-app
`

**Development URL: https://steer-exercise-app.herokuapp.com/**
1. To reset the develop database on heroku

`
heroku restart -a steer-exercise-app; heroku pg:reset DATABASE --confirm steer-exercise-app steer-exercise-app; heroku run rake db:migrate db:seed steer-exercise-app
`

*Team Members:*
* Constantina Hug
* Natalie Cluck
* Zac Steer
* Hirva Sha
* Jody Wu

PivotalTracker link: https://www.pivotaltracker.com/n/projects/2234695
