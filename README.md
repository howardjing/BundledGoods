Notes
=====

make sure you migrate the database on heroku, not just your local machine

`heroku run rake db:migrate`

to start server in stats mode

`./start-server`

to kill processes after you're done

```
ps ax | grep ehcache
kill pid number here
ps ax | grep rails
kill pid number here
```
