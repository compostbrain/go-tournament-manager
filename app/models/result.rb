class Result < ApplicationRecord
  belongs_to :game

  enum result: %w(none white_won black_won draw white_forfeit black_forfeit)
end
