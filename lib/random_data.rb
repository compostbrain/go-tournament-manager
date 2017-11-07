module RandomData
  def self.random_chapter
    letters = ("a".."z").to_a
    letters.shuffle!
    letters[0, rand(3..5)].join.upcase
  end

  def self.random_rank
    rank_categories = ["kyu", "dan"]
    random_rank = rank_categories.sample
    if random_rank == "kyu"
      rand(1..30).to_s + " " + random_rank
    else rand(1..9).to_s + " " + random_rank
    end
  end

  def self.rating_from_rank(rank)
    category = rank.last(3)
    floated_rating = rank.to_i + rand
    formated_rating = "%0.05f" % floated_rating

    imitation_aga_rating = BigDecimal(formated_rating)
    case category
    when "kyu"
      - imitation_aga_rating
    when "dan"
      imitation_aga_rating
    end
  end
end
