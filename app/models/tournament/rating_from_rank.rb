class RatingFromRank
  attr_accessor :rank, :rating

  def calculate!(rank)
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
