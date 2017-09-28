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
    else random_rank = "#{rand(1..30)}" + random_rank
    end

    def self.rating_from_rank(rating)
      rating_from_rank = rating.to_a.map {|x| x[/\d+/]}

    end


  end
