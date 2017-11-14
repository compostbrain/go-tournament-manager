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

# TODO Standings Calculator

The final order of the field is by McMahon score, and inevitably there will ties. While cash prizes
can be split without difficulty, other prizes may have to be awarded by tiebreaks. A variety of tie
breaking methods have been proposed, but the AGA uses four standard tie break procedures in
the following order:
1. SOMS: The Sum of McMahon Scores for all of a player’s opponents
2. SODOMS: The Sum of Defeated Opponents McMahon Scores
3. Face to face result (if applicable).
4. Random draw
The Swiss McMahon pairing approach is designed with the expectation that the SOMS,
SODOMS tiebreak system will be used and the rules are specifically formulated to make those
distinctions as significant as possible. Alternative methods may be desirable for many reasons and
are permitted. Manual pairing may be guided by the TD's understanding of the tie breaking
system being used.
If a player involved in a tie break situation has received a forced bye, the bye is treated as a
victory against a phantom player who started with the same initial McMahon score as the tied
player and who won half his games in the tournament. Voluntary byes are treated in the same
manner, except that the voluntary bye is treated as a loss against the same phantom player.
In the case of a player involved in a tiebreak situation who had one or more opponents who
received a voluntary bye or a double forfeit, the SOMS and (when the relevant opponent was
defeated) SODOMS scores are to be credited with 0.5 McMahon points per instance.

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
