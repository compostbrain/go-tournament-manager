# Go Tournament Manager

Building a go tournament manager

Ruby Version 2.4.1
Rails Version 5.1.3

## Models
- X Player
- X User/Director
- X Game
- X tournament
- X Rounds
- X TournamentRegistration
- X RoundStatus
- X Result

## Features
- Import Tournament from CSV
- Tournament set-up
- Auto pairing for rounds
- SMS/Email game pairing information


# UI
- Uses Materialize-sass

# TODOS PlayersController
- remove stone_color attribute from players
- players = Player.where(id: params[:tournament][:player_ids])
- PlayersController#pair method: change players assignment to active players with tournament_registration status if final and round_statuse of active

# TODOS PairingTool
- prevent players from receiving byes if they already had a bye from Swissper
- first round should be paired by split and shift
- tables should be assigned with highest rank on table 1

# TODO Player

# Database set-up
-  enter in CL:
```script
createuser --createdb --login -P go-tournament-manager```
- add these lines to config/database.yml:
```ruby
    default: &default
    adapter: postgresql
    encoding: unicode
    host: localhost
  > username: go-tournament-manager
  > password: go-tournament-manager
    pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>```
- enter in CL:
```script
bin/rails db:set-up
bin/rails db:migrate```
