# Go Tournament Manager

Building a go tournament manager to be used by National Go Center

Ruby Version 2.4.1
Rails Version 5.1.2

## Models
- Player
- [ X ] User/Admin
- Pairing
- X tournament
- Rounds

## Features
- Tournament set-up with option
- Auto pairing for rounds
- As an admin I want to create pairings for each round so I can assign players to games.
Swissper gem for swiss pairing logic
Game attributes: round_id, white_stones_player_id, black_stones_player_id, table_number, winner_id, loser_id
Edge cases include odd number of players.
Need a workflow for how each round will be paired

- SMS texting of pairings
-

# UI
- Use Materialize-sass

# TODOS
-  remove stone_color attribute from players


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
