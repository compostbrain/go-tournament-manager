# Go Tournament Manager

Building a go tournament manager to be used by National Go Center

Ruby Version 2.4.1
Rails Version 5.1.2

## Models
- Player
- X User/Admin
- Pairing
- X tournament
- Rounds

## Features
- Tournament set-up with option
- Auto pairing for rounds
- SMS texting of pairings
-




# UI
- Use Materialize-sass


# Database set-up
-  enter in CL:```
createuser --createdb --login -P go-tournament-manager```
- add these lines to config/database.yml:
```
    default: &default
    adapter: postgresql
    encoding: unicode
    host: localhost
  > username: go-tournament-manager
  > password: go-tournament-manager
    pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>```
- enter in CL:
```
bin/rails db:set-up && bin/rails db:migrate```
