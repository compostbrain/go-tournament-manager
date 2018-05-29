# Go Tournament Manager

<img width="1333" alt="screen shot" src="https://user-images.githubusercontent.com/13973110/40689688-5393ee70-6371-11e8-9afe-a4d794f73ce6.png">

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
