module RandomData

  def self.random_chapter
    letters = ('a'..'z').to_a
    letters.shuffle!
    letters[0, rand(3..5)].join.upcase
  end

  def self.random_rank
    rank_letters = ["K","D","P"]
    random_rank = rank_letters.sample
    if random_rank == "K"
      random_rank = "#{rand(1..30)}" + random_rank
    else random_rank = "#{rand(1..9)}" + random_rank
    end
  end

  def self.rating_from_rank(rating)
    category = rating[-1]
    calc_rating = rating.slice(/(\d+)/).to_i
    case category
      when "K"
        rating = calc_rating * -1
      when "D"
        rating = calc_rating
      when "P"
        rating = calc_rating * 10
    end
  end
end
