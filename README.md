# Go Tournament Manager

![ScreenShot](/app/assets/images/Screen Shot.png?raw=true "Screen Shot")

Ruby Version 2.4.1
Rails Version 5.1.3

# Database set-up

* enter in CL:

```script
createuser --createdb --login -P go-tournament-manager
```

* add these username and password to config/database.yml:

```ruby
    default: &default
    adapter: postgresql
    encoding: unicode
    host: localhost
  > username: go-tournament-manager
  > password: go-tournament-manager
    pool:  ENV.fetch("RAILS_MAX_THREADS") { 5 }
```

* enter in CL:

````script
bin/rails db:set-up
bin/rails db:migrate```
````
