class AgaNumber
  def self.auto_assign!
    number = rand(90000..99999).to_s
    if existing_aga_numbers.include?(number)
      auto_assign!
    else
      number
    end
  end

  private_class_method def self.existing_aga_numbers
    players = Player.all
    existing = []
    players.each do |p|
      existing << p.aga_number
    end
    existing
  end
end
